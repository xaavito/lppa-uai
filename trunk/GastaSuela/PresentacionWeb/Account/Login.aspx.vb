Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
    End Sub



    Protected Sub LoginButton_Click(sender As Object, e As EventArgs)

        Try
            Seguridad.Seguridad.Login(Me.LoginUser.UserName, Me.LoginUser.Password)
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try

    End Sub
End Class