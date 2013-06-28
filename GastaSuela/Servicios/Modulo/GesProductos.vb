Imports Negocio
Imports DataLayer
Imports Excepciones

Public Class GesProductos

    Public Shared Function Consultar(id As Int16) As List(Of Producto)
        Dim productos As New List(Of Producto)
        Try
            Dim repository As IRepository = RepositoryFactory.Create()
            repository.Nombre = "PRODUCTOS_SP"
            repository.AddParameter("@ID", id)
            Dim dtProducto As DataTable = repository.ExecuteDataTable()

            For Each dr As DataRow In dtProducto.Rows
                Dim p As New Producto()
                p.Persistencia = EstadoPersistencia.UPDATE
                p.OID = Convert.ToInt32(dr.Item("proID"))
                p.Nombre = dr.Item("proNOMBRE").ToString()
                p.PrecioUnitario = Convert.ToDecimal(dr.Item("proPrecioUnit"))
                p.Foto = dr.Item("proFoto").ToString()
                productos.Add(p)
            Next

        Catch ex As Exception
            Throw New ProductoGetException()
        End Try

        Return productos

    End Function

End Class
