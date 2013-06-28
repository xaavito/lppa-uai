Imports Servicios

Public Class Productos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarLista()
        End If
    End Sub
    Private Sub CargarLista()

        Try

            Dim productos As New List(Of Negocio.Producto)
            productos = GesProductos.Consultar()
            gvShoppingCart.DataSource = productos
            gvShoppingCart.DataBind()
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try

    End Sub

    Protected Sub gvShoppingCart_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim Prod As Negocio.Producto = CType(e.Row.DataItem, Negocio.Producto)

            Dim lblDescripcion As Label = CType(e.Row.FindControl("LblDescription"), Label)
            lblDescripcion.Text = Prod.Nombre

            Dim ImageProducto As Image = CType(e.Row.FindControl("ImgProducto"), Image)
            ImageProducto.ImageUrl = Prod.Foto

            Dim LblPrecio As Label = CType(e.Row.FindControl("LblPrecio"), Label)
            LblPrecio.Text = Prod.PrecioUnitario.ToString
        End If
    End Sub

End Class