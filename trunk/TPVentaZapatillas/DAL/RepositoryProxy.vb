'TODO: Patron Proxy -> Proxy
Public Class RepositoryProxy
    Implements IRepository

    Private _repository As IRepository

    Public Sub New(connectionstring As String)
        _repository = New RepositorySql(connectionstring)
    End Sub

    Public Sub AddClient() Implements IRepository.AddClient
        _repository.AddClient()
    End Sub

    Public Sub AddParameter(name As String, value As Object) Implements IRepository.AddParameter
        _repository.AddParameter(name, value)
    End Sub

    Public Sub BackUp(path As String) Implements IRepository.BackUp
        _repository.BackUp(path)
    End Sub

    Public Sub BeginTransaction() Implements IRepository.BeginTransaction
        _repository.BeginTransaction()
    End Sub

    Public Sub Commit() Implements IRepository.Commit
        _repository.Commit()
    End Sub

    Public Sub Conectar() Implements IRepository.Conectar
        _repository.Conectar()
    End Sub

    Public Sub Desconectar() Implements IRepository.Desconectar
        _repository.Desconectar()
    End Sub

    Public Function ExecuteDataSet() As System.Data.DataSet Implements IRepository.ExecuteDataSet
        Return _repository.ExecuteDataSet()
    End Function

    Public Function ExecuteDataTable() As System.Data.DataTable Implements IRepository.ExecuteDataTable
        Return _repository.ExecuteDataTable()
    End Function

    Public Function ExecuteNonQuery() As Integer Implements IRepository.ExecuteNonQuery
        Return _repository.ExecuteNonQuery()
    End Function

    Public Function ExecuteReturnValue() As Object Implements IRepository.ExecuteReturnValue
        Return _repository.ExecuteReturnValue()
    End Function

    Public Function ExecuteScalar() As Object Implements IRepository.ExecuteScalar
        Return _repository.ExecuteScalar()
    End Function

    Public Property Nombre As String Implements IRepository.Nombre
        Get
            Return _repository.Nombre
        End Get
        Set(value As String)
            _repository.Nombre = value
        End Set
    End Property

    Public Sub Restore(path As String) Implements IRepository.Restore
        _repository.Restore(path)
    End Sub

    Public Sub Rollback() Implements IRepository.Rollback
        _repository.Rollback()
    End Sub

    Public Property Timeout As Integer Implements IRepository.Timeout
        Get
            Return _repository.Timeout
        End Get
        Set(value As Integer)
            _repository.Timeout = value
        End Set
    End Property

#Region "IDisposable Support"
    Private disposedValue As Boolean

    Public ReadOnly Property IsDisposed As Boolean Implements IRepository.IsDisposed
        Get
            Return _repository.IsDisposed
        End Get
    End Property

    Protected Overridable Sub Dispose(disposing As Boolean)
        If Not Me.disposedValue Then
            If disposing Then
                Me.disposedValue = True
            End If
        End If
        Me.disposedValue = True
    End Sub

    Public Sub Dispose() Implements IDisposable.Dispose
        _repository.Dispose()
        Dispose(True)
        GC.SuppressFinalize(Me)
    End Sub
#End Region

End Class
