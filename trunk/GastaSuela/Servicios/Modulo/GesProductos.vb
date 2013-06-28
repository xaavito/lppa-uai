Imports Negocio
Imports DataLayer
Imports Excepciones

Public Class GesProductos

    Public Shared Function Consultar() As List(Of Producto)

        Dim productos As New List(Of Producto)
        Try
            Dim repository As IRepository = RepositoryFactory.Create()
            repository.Nombre = "PRODUCTOS_SP"
            repository.AddParameter("@ID", Nothing)
            Dim dtProducto As DataTable = repository.ExecuteDataTable()

            For Each dr As DataRow In dtProducto.Rows
                Dim p As New Producto()
                p.Persistencia = EstadoPersistencia.UPDATE
                p.OID = Convert.ToInt32(dr.Item("prodID"))
                p.Nombre = dr.Item("prodNOMBRE").ToString()
                p.PrecioUnitario = Convert.ToDecimal(dr.Item("prodPrecioUnit"))
                p.Foto = dr.Item("prodFoto").ToString()
                productos.Add(p)
            Next

        Catch ex As Exception
            Throw New PefilGetException()
        End Try

        Return productos

    End Function

End Class
