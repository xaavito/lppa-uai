Imports Negocio
Imports System.Security.Principal

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
    End Sub



    Protected Sub LoginButton_Click(sender As Object, e As EventArgs)

        Try
            Seguridad.Seguridad.Login(Me.UserName.Text, Me.Password.Text)
            Current.Usuario = Servicios.GesUsuarios.Obtener(Me.UserName.Text)
            Dim Userroles As String = "Administrador"

            Dim ticket As FormsAuthenticationTicket = New FormsAuthenticationTicket(
                    1,
                    Current.Usuario.Nick,
                    DateTime.Now,
                    DateTime.Now.AddMinutes(30),
                    True,
                    Userroles,
                    FormsAuthentication.FormsCookiePath)


            Dim hash As String = FormsAuthentication.Encrypt(ticket)
            Dim cookie As HttpCookie = New HttpCookie(
               FormsAuthentication.FormsCookieName,
               hash)
            Response.Cookies.Add(cookie)

            'FormsAuthentication.SetAuthCookie(Current.Usuario.Nick, False)

            Dim roles As String() = ticket.UserData.Split(New Char() {"|"})
            Dim id As IIdentity = New FormsIdentity(ticket)
            Dim principal As IPrincipal = New GenericPrincipal(id, roles)
            Context.User = principal


            Response.Redirect("~/")

        Catch ex As Exception
            My.Application.HandlerException(Me, ex, "LoginUserValidationGroup")
        End Try

    End Sub
End Class