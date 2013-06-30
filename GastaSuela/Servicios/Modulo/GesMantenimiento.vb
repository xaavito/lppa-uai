Imports Negocio
Imports DataLayer
Imports Excepciones

Public Class GesMantenimiento

    Public Shared Sub GuardarBackUp(ruta As String)
        Dim repository As IRepository = RepositoryFactory.Create()
        Try
            repository.Nombre = "BACKUP_PROC"
            repository.AddParameter("@ACCION", 1)
            repository.AddParameter("@ID", Nothing)
            repository.AddParameter("@IDUSUARIO", Negocio.Current.Usuario.OID)
            repository.AddParameter("@RUTA", ruta)
            repository.ExecuteNonQuery()
        Catch ex As Exception
            repository.Dispose()
        End Try
    End Sub

    Public Shared Sub RealizarBackUp(path As String)
        Try
            GuardarBackUp(path)
            Dim repo As IRepository = RepositoryFactory.Create()
            repo.BackUp(path)
        Catch ex As Exception
            Throw ex
        End Try

        GesBitacoras.Guardar(EstadoPersistencia.INSERT, "ModBackUp", New String() {"BackUp", path})

    End Sub

    Public Shared Function ConsutarBackUp() As List(Of Backup)
        Dim backups As New List(Of Backup)
        Try
            Dim repository As IRepository = RepositoryFactory.Create()
            repository.Nombre = "BACKUP_PROC"
            repository.AddParameter("@ACCION", "4")

            Dim dtBackup As DataTable = repository.ExecuteDataTable()

            For Each dr As DataRow In dtBackup.Rows
                Dim b As New Backup()
                b.Persistencia = EstadoPersistencia.UPDATE
                b.OID = Convert.ToInt32(dr.Item("bkID"))
                b.Fecha = Convert.ToDateTime(dr.Item("bkFECHA"))
                b.Ruta = dr.Item("bkRUTA").ToString()


                Dim usu As New Usuario()
                usu.Nick = dr.Item("usuNICK").ToString()
                usu.Apellido = dr.Item("usuAPELLIDO").ToString()
                usu.Nombre = dr.Item("usuNOMBRE").ToString()
                b.Usuario = usu

                backups.Add(b)
            Next

        Catch ex As Exception
            Throw New BackupGetException()
        End Try
        Return backups

    End Function

    Public Shared Sub GuardarRestore(ruta As String)
        Dim repository As IRepository = RepositoryFactory.Create()
        Try
            repository.Nombre = "RESTORE_PROC"
            repository.AddParameter("@ACCION", 1)
            repository.AddParameter("@ID", Nothing)
            repository.AddParameter("@IDUSUARIO", Negocio.Current.Usuario.OID)
            repository.AddParameter("@RUTA", ruta)
            repository.ExecuteNonQuery()
        Catch ex As Exception
            repository.Dispose()
        End Try
    End Sub
    Public Shared Sub RealizarRestore(path As String)
        Try            
            Dim repo As IRepository = RepositoryFactory.Create()
            repo.Restore(path)
            GuardarRestore(path)
        Catch ex As Exception
            Throw ex
        End Try

        GesBitacoras.Guardar(EstadoPersistencia.INSERT, "ModRestore", New String() {"Restore", path})
    End Sub

    Public Shared Function ConsutarRestore() As List(Of Restore)
        Dim restores As New List(Of Restore)
        Try
            Dim repository As IRepository = RepositoryFactory.Create()
            repository.Nombre = "RESTORE_PROC"
            repository.AddParameter("@ACCION", "4")

            Dim dtRestore As DataTable = repository.ExecuteDataTable()

            For Each dr As DataRow In dtRestore.Rows
                Dim b As New Restore()
                b.Persistencia = EstadoPersistencia.UPDATE
                b.OID = Convert.ToInt32(dr.Item("rtID"))
                b.Fecha = Convert.ToDateTime(dr.Item("rtFECHA"))
                b.Ruta = dr.Item("rtRUTA").ToString()


                Dim usu As New Usuario()
                usu.Nick = dr.Item("usuNICK").ToString()
                usu.Apellido = dr.Item("usuAPELLIDO").ToString()
                usu.Nombre = dr.Item("usuNOMBRE").ToString()
                b.Usuario = usu

                restores.Add(b)
            Next

        Catch ex As Exception
            Throw New RestoreGetException()
        End Try

        Return restores

    End Function

End Class
