Imports System.Data.SqlClient
Imports Excepciones
'TODO: Patron Proxy -> RealSubject
Public Class RepositorySql
    Implements IRepository

    Private _timeout As Integer
    Private _connectionstring As String
    Private _nombre As String = ""
    Private Conn As SqlConnection = New SqlConnection()
    Private Trans As SqlTransaction
    Private cmd As SqlCommand
    Private _params As New Hashtable()
    Private _clients As Integer = 0

    Public Sub New(connectionstring As String)
        Conn.ConnectionString = connectionstring
    End Sub

    Public Sub BeginTransaction() Implements IRepository.BeginTransaction
        Conectar()
        Trans = Conn.BeginTransaction()
    End Sub

    Private Sub Init()
        cmd = New SqlCommand()
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Connection = Conn
        cmd.CommandTimeout = 10000
        cmd.CommandText = _nombre
        If Trans IsNot Nothing Then
            cmd.Transaction = Trans
        End If
        'Cargo los parametros
        For Each pr As DictionaryEntry In _params
            cmd.Parameters.AddWithValue(pr.Key, pr.Value)
        Next
        _params = New Hashtable()
    End Sub

    Public Sub Conectar() Implements IRepository.Conectar
        Try
            If Conn.State = ConnectionState.Closed Then
                Conn.Open()
            End If
        Catch ex As Exception
            Me.Dispose()
            Throw New CannotOpenConnectionDataBaseException()
        End Try

    End Sub

    Public Sub Desconectar() Implements IRepository.Desconectar
        Try
            If Conn.State = ConnectionState.Open Then
                Conn.Close()            
            End If
            Me.Dispose()
        Catch ex As Exception

        End Try
    End Sub

    Public Sub AddParameter(name As String, value As Object) Implements IRepository.AddParameter
        Try
            _params.Add(name, value)
        Catch ex As Exception
            Me.Rollback()
        End Try

    End Sub

    Public Sub AddClient() Implements IRepository.AddClient
        _clients = _clients + 1
    End Sub

    Private Sub RemoveClient()
        _clients = _clients - 1
    End Sub

    Public Function ExecuteDataSet() As DataSet Implements IRepository.ExecuteDataSet
        Init()
        RemoveClient()
        Dim Adap As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim dt As DataSet = New DataSet
        If Trans Is Nothing Then Conectar()
        Try
            Adap.Fill(dt)
        Catch ex As Exception
            Me.Rollback()
            Throw New ExecuteQueryException()
        End Try
        If Trans Is Nothing Then Desconectar()
        Return dt
    End Function

    Public Function ExecuteDataTable() As DataTable Implements IRepository.ExecuteDataTable
        Init()
        RemoveClient()
        Dim Adap As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim dt As DataTable = New DataTable
        If Trans Is Nothing Then Conectar()
        Try
            Adap.Fill(dt)
        Catch ex As Exception
            Me.Rollback()
            Throw New ExecuteQueryException()
        End Try
        If Trans Is Nothing Then Desconectar()
        Return dt
    End Function

    Public Function ExecuteNonQuery() As Integer Implements IRepository.ExecuteNonQuery
        Init()
        RemoveClient()
        If Trans Is Nothing Then Conectar()
        Dim r As Integer = 0
        Try
            r = cmd.ExecuteNonQuery()
        Catch ex As Exception
            Me.Rollback()
            Throw New ExecuteQueryException()
        End Try
        If Trans Is Nothing Then Desconectar()
        Init()
        Return r
    End Function

    Public Function ExecuteScalar() As Object Implements IRepository.ExecuteScalar
        Init()
        RemoveClient()
        If Trans Is Nothing Then Conectar()
        Dim r As Object = Nothing
        Try
            r = cmd.ExecuteScalar()
        Catch ex As Exception
            Me.Rollback()
            Throw New ExecuteQueryException()
        End Try
        If Trans Is Nothing Then Desconectar()
        Return r
    End Function

    Public Function ExecuteReturnValue() As Object Implements IRepository.ExecuteReturnValue
        Init()
        RemoveClient()
        If Trans Is Nothing Then Conectar()
        Dim r As Object = Nothing
        Try
            Dim returnValue As SqlParameter = New SqlParameter
            returnValue.ParameterName = "@Return_Value"
            returnValue.Direction = ParameterDirection.ReturnValue
            cmd.Parameters.Add(returnValue)
            cmd.ExecuteNonQuery()
            r = cmd.Parameters("@Return_Value").Value
        Catch ex As Exception
            Me.Rollback()
            Throw New ExecuteQueryException()
        End Try
        If Trans Is Nothing Then Desconectar()
        Return r
    End Function

    Public Sub Commit() Implements IRepository.Commit
        If _clients < 1 Then
            If Trans IsNot Nothing Then
                Trans.Commit()
                Trans.Dispose()
            End If
            Trans = Nothing
            Desconectar()
        End If
    End Sub

    Public Sub Rollback() Implements IRepository.Rollback
        If Trans IsNot Nothing Then
            Trans.Rollback()
            Trans.Dispose()
        End If
        Trans = Nothing
        Desconectar()
    End Sub

    Public Property Nombre As String Implements IRepository.Nombre
        Get
            Return _nombre
        End Get
        Set(value As String)
            _nombre = value
        End Set
    End Property

    Public Property Timeout As Integer Implements IRepository.Timeout
        Get
            Return _timeout
        End Get
        Set(value As Integer)
            _timeout = value
        End Set
    End Property

    Public Sub BackUp(path As String) Implements IRepository.BackUp
        Try
            Dim Maintenance As New RepositorySqlMaintenance()
            Maintenance.BackUp(path, Conn.ConnectionString)
        Catch ex As Exception
            Throw New BackUpException()
        End Try
    End Sub

    Public Sub Restore(path As String) Implements IRepository.Restore
        Try
            Dim Maintenance As New RepositorySqlMaintenance()
            Maintenance.Restore(path, Conn.ConnectionString)
        Catch ex As Exception
            Throw New RestoreException()
        End Try
    End Sub

#Region "IDisposable Support"
    Private disposedValue As Boolean

    Public ReadOnly Property IsDisposed() As Boolean Implements IRepository.IsDisposed
        Get
            Return disposedValue
        End Get
    End Property

    ' IDisposable
    Protected Overridable Sub Dispose(disposing As Boolean)
        If Not Me.disposedValue Then
            If disposing Then
                If Trans IsNot Nothing Then
                    Trans.Rollback()
                    Trans.Dispose()
                End If
                If Conn IsNot Nothing Then
                    Conn.Close()
                    Conn.Dispose()
                End If
            End If
        End If
        Me.disposedValue = True
    End Sub

    Public Sub Dispose() Implements IDisposable.Dispose
        Dispose(True)
        GC.SuppressFinalize(Me)
    End Sub
#End Region

End Class
