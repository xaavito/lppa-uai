Imports Servicios

Public Class Productos
    Inherits System.Web.UI.Page


    Private cot As New Cotizacion.CotizacionSoapClient
    Private cotizacion As Decimal


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cotizacion = 1
            CargarMonedas()
            CargarLista()
        End If

    End Sub
    Private Sub CargarLista()
        Try
            gvShoppingCart.DataSource = Nothing
            Dim productos As New List(Of Negocio.Producto)
            productos = GesProductos.Consultar(cotizacion)
            gvShoppingCart.DataSource = productos
            gvShoppingCart.DataBind()
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try

    End Sub

    Private Sub CargarMonedas()
        Dim itemValues As Array = System.Enum.GetValues(GetType(Cotizacion.Moneda))
        Dim itemNames As Array = System.Enum.GetNames(GetType(Cotizacion.Moneda))

        For i As Integer = 0 To itemNames.Length - 1
            Dim item As New ListItem(itemNames(i), itemValues(i))
            ddlMoneda.Items.Add(item)
        Next
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

    Protected Sub ddlMoneda_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlMoneda.SelectedIndexChanged
        cotizacion = cot.Obtener(CType(Convert.ToInt16(ddlMoneda.SelectedValue), Cotizacion.Moneda))
        CargarLista()
    End Sub
End Class