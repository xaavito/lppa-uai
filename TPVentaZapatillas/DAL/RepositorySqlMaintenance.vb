Imports System.Data.SqlClient
Imports System.IO
Imports Microsoft.SqlServer.Management.Smo
Imports Microsoft.SqlServer.Management.Common

'http://www.microsoft.com/es-es/download/details.aspx?id=16177
'http://codecampserver.googlecode.com/svn/branches%5cTestBranch1/lib/sqlserver/

Public Class RepositorySqlMaintenance
    Public Sub BackUp(path As String, connectionString As String)

        Dim builder As New SqlConnectionStringBuilder(connectionString)
        Dim connection As New ServerConnection(builder.DataSource, builder.UserID, builder.Password)
        Dim sqlServer As New Server(connection)

        Dim bk As New Backup
        bk.Database = builder.InitialCatalog
        bk.Action = BackupActionType.Database
        bk.BackupSetDescription = "Full backup of " & bk.Database
        bk.BackupSetName = bk.Database + "_" + DateTime.Now.ToString("yyyyMMddHHmmss")
        bk.Devices.AddDevice(path, DeviceType.File)
        bk.Incremental = False
        bk.LogTruncation = BackupTruncateLogType.Truncate
        bk.SqlBackup(sqlServer)

        'Dim builder As New SqlConnectionStringBuilder(connectionString)

        'Dim sql As String = "   BACKUP DATABASE [" + builder.InitialCatalog + "] TO  " & vbCrLf & _
        '        "	DISK = N'" & path & "' " & vbCrLf & _
        '        "	WITH NOFORMAT, NOINIT,  NAME = N'" + builder.InitialCatalog + "', " & vbCrLf & _
        '        "	SKIP, NOREWIND, NOUNLOAD,  STATS = 10"


        'Dim Conn As SqlConnection = New SqlConnection(connectionString)
        'Conn.Open()
        'Dim cmd As New SqlCommand(sql, Conn)
        'cmd.ExecuteNonQuery()
        'Conn.Close()

    End Sub

    Public Sub Restore(path As String, connectionString As String)

        Dim builder As New SqlConnectionStringBuilder(connectionString)
        Dim connection As New ServerConnection(builder.DataSource, builder.UserID, builder.Password)
        Dim sqlServer As New Server(connection)

        Dim rs As New Restore
        rs.Database = builder.InitialCatalog
        rs.NoRecovery = False
        rs.Action = BackupActionType.Database
        rs.ReplaceDatabase = True
        rs.Devices.AddDevice(path, DeviceType.File)
        sqlServer.KillAllProcesses(builder.InitialCatalog)
        rs.Wait()
        rs.SqlRestore(sqlServer)

        'Dim builder As New SqlConnectionStringBuilder(connectionString)

        'Dim sql = "USE master;" _
        '& "ALTER DATABASE [" + builder.InitialCatalog + "] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;" _
        '& "RESTORE DATABASE [" + builder.InitialCatalog + "] FROM DISK = '" & path & "' with replace ;" _
        '& "ALTER DATABASE [" + builder.InitialCatalog + "] SET MULTI_USER;"

        'Dim Conn As SqlConnection = New SqlConnection(connectionString)
        'Conn.Open()
        'Dim cmd As New SqlCommand(sql, Conn)
        'cmd.ExecuteNonQuery()
        'Conn.Close()

    End Sub

    Public Sub CreateDataBase(dbname As String, FileScript As String, connectionString As String)

        Dim builder As New SqlConnectionStringBuilder(connectionString)
        builder.InitialCatalog = ""

        'LEO EL ARCHIVO SQL
        Dim thefile As New FileInfo(FileScript)
        Dim script As String = thefile.OpenText().ReadToEnd()


        Dim db As String = String.Format("CREATE DATABASE [{0}] ", dbname)
        Dim use As String = String.Format("USE [{0}] " + vbNewLine + "GO" + vbNewLine, dbname)
        script = use + script
        script = script.Replace(vbNewLine & "GO", vbNewLine)

        Dim conn As SqlConnection = New SqlConnection(builder.ConnectionString)
        'CREA LA BASE DE DATOS
        Try
            conn.Open()
            Try
                Dim cmd As New SqlCommand(db, conn)
                cmd.ExecuteNonQuery()
                conn.Close()
            Catch ex As Exception
                conn.Close()
                Throw ex
            End Try
        Catch ex As Exception
            Throw ex
        End Try

        'EJECUTA EL SCRIPT
        Try
            conn.Open()
            Dim transaction As SqlTransaction = conn.BeginTransaction()
            Try
                Dim cmd As New SqlCommand(script, conn)
                cmd.Transaction = transaction
                cmd.ExecuteNonQuery()
                transaction.Commit()
                conn.Close()
            Catch ex As Exception
                transaction.Rollback()
                conn.Close()
                Throw ex
            End Try
        Catch ex As Exception
            Throw ex
        End Try

    End Sub
End Class
