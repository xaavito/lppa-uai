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
            productos = GesProductos.Consultar(Nothing)
            gvShoppingCart.DataSource = productos
            gvShoppingCart.DataBind()
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try

    End Sub

    Protected Sub gvShoppingCart_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim Prod As Negocio.Producto = CType(e.Row.DataItem, Negocio.Producto)

        End If
    End Sub

    Protected Sub gvShoppingCart_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If (e.CommandName = "AddToCart") Then

            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim row As GridViewRow = gvShoppingCart.Rows(index)


            Dim DDCantidad As DropDownList = CType(row.FindControl("DDCantidad"), DropDownList)
            Dim Cantidad As Integer = Convert.ToInt32(DDCantidad.SelectedValue)

            Dim ProdId As Integer = CType(CType(row.FindControl("OID"), HiddenField).Value, Integer)

            ShoppingCart.Instance.AgregarItem(ProdId, Cantidad)
            Response.Redirect("ViewCart.aspx")
        End If
    End Sub

End Class