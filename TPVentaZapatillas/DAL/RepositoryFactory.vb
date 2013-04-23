Imports System.Configuration

'TODO: Patron Factory
Public Class RepositoryFactory
    Private Shared _connectionstring As String = ConfigurationSettings.AppSettings("connectionString")
    Private Shared _repository As IRepository

    Public Shared Function Create() As IRepository
        CheckDisposed()
        If _repository Is Nothing Then
            _repository = New RepositoryProxy(_connectionstring)
        End If
        _repository.AddClient()
        Return _repository
    End Function

    Public Shared Function CreateTransactional() As IRepository
        CheckDisposed()
        If _repository Is Nothing Then
            _repository = New RepositoryProxy(_connectionstring)
            _repository.BeginTransaction()
        End If
        _repository.AddClient()
        Return _repository
    End Function

    Private Shared Sub CheckDisposed()
        Try
            If _repository.IsDisposed Then
                _repository = Nothing
            End If
        Catch ex As Exception

        End Try
    End Sub

    Public Shared Property ConnectionString() As String
        Get
            Return _connectionstring
        End Get
        Set(ByVal value As String)
            _connectionstring = value
        End Set
    End Property


End Class
