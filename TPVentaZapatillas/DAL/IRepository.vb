'TODO: Patron Proxy -> Subject
Public Interface IRepository
    Inherits IDisposable

    Sub Conectar()
    Sub Desconectar()
    Sub BeginTransaction()
    Sub BackUp(path As String)
    Sub Restore(path As String)
    Property Nombre() As String
    Property Timeout() As Integer
    ReadOnly Property IsDisposed() As Boolean
    Sub AddParameter(name As String, value As Object)
    Sub AddClient()
    Function ExecuteNonQuery() As Integer
    Function ExecuteScalar() As Object
    Function ExecuteDataTable() As DataTable
    Function ExecuteDataSet() As DataSet
    Function ExecuteReturnValue() As Object
    Sub Commit()
    Sub Rollback()

End Interface
