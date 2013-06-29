Imports Servicios

Public Class DigitoVerificador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim digitos As DataTable
            digitos = GesDigitos.Verificar()
            dgDigitosVerificadores.DataSource = digitos
            dgDigitosVerificadores.DataBind()
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try

    End Sub

    Protected Sub btnRecalcular_Click(ByVal sender As Object, ByVal e As EventArgs)

        Try
            GesDigitos.Recalcular()
            Response.Redirect("/DigitoVerificador.aspx", False)
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try

    End Sub
End Class