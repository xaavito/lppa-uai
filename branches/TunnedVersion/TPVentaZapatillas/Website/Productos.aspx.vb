Partial Class Productos
    Inherits System.Web.UI.Page
    Public Class Ejemplo
        Public Imagen As String
        Public Descripcion As String
        Public Precio As String
    End Class
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarLista()
        End If
    End Sub
    Private Sub CargarLista()
        Dim ListaEjemplo As New Generic.List(Of Ejemplo)
        Dim Ej As Ejemplo
        Dim Ej2 As Ejemplo
        Dim Ej3 As Ejemplo

        Ej = New Ejemplo
        Ej.Imagen = "images/zapa1.jpg"
        Ej.Descripcion = "Zapatilla1"
        Ej.Precio = "$2,10"
        ListaEjemplo.Add(Ej)

        Ej2 = New Ejemplo
        Ej2.Imagen = "images/zapa2.jpg"
        Ej2.Descripcion = "Zapatilla2"
        Ej2.Precio = "$3,20"
        ListaEjemplo.Add(Ej2)


        Ej3 = New Ejemplo
        Ej3.Imagen = "images/zapa3.jpg"
        Ej3.Descripcion = "Zapatilla3"
        Ej3.Precio = "$5,20"
        ListaEjemplo.Add(Ej3)

        gvShoppingCart.DataSource = ListaEjemplo
        gvShoppingCart.DataBind()
    End Sub
    Protected Sub gvShoppingCart_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim Ej As Ejemplo = CType(e.Row.DataItem, Ejemplo)

            Dim lblDescripcion As Label = CType(e.Row.FindControl("LblDescription"), Label)
            lblDescripcion.Text = Ej.Descripcion

            Dim ImageProducto As Image = CType(e.Row.FindControl("ImgProducto"), Image)
            ImageProducto.ImageUrl = Ej.Imagen

            Dim LblPrecio As Label = CType(e.Row.FindControl("LblPrecio"), Label)
            LblPrecio.Text = Ej.Precio
        End If
    End Sub


End Class
