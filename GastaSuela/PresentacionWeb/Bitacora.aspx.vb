Imports Servicios

Public Class Bitacora
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try

            Dim bitacoras As New List(Of Negocio.Bitacora)
            bitacoras = GesBitacoras.Consultar()
            dgvBitacoras.DataSource = bitacoras
            dgvBitacoras.DataBind()
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try

    End Sub

    Private Sub dgvBitacoras_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles dgvBitacoras.PageIndexChanging
        dgvBitacoras.PageIndex = e.NewPageIndex
    End Sub
End Class