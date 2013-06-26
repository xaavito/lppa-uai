Imports Negocio
Imports System.Security.Principal

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
    End Sub



    Protected Sub LoginButton_Click(sender As Object, e As EventArgs)

        Try
            'Verifica el usuario y password ingresados
            Seguridad.Seguridad.Login(Me.UserName.Text, Me.Password.Text)

            'Carga el usuario logueado en memoria
            Current.Usuario = Servicios.GesUsuarios.Obtener(Me.UserName.Text)

            'Obtiene el perfil del usuario logueado
            Dim Userroles As String = Current.Usuario.Perfil.Nombre

            'Persiste en una cookie los datos del usuario
            Dim ticket As FormsAuthenticationTicket = New FormsAuthenticationTicket(
                    1,
                    Current.Usuario.Nick,
                    DateTime.Now,
                    DateTime.Now.AddMinutes(30),
                    True,
                    Userroles,
                    FormsAuthentication.FormsCookiePath)


            Dim hash As String = FormsAuthentication.Encrypt(ticket)
            Dim cookie As HttpCookie = New HttpCookie(FormsAuthentication.FormsCookieName, hash)
            Response.Cookies.Add(cookie)

            'Redirecciona a la pagina a la que se intentó ingresar
            If Not String.IsNullOrEmpty(Request.QueryString("ReturnUrl")) Then
                Response.Redirect(Request.QueryString("ReturnUrl").ToString)
            End If
            Response.Redirect("~/")

        Catch ex As Exception
            My.Application.HandlerException(Me, ex, "LoginUserValidationGroup")
        End Try

    End Sub
End Class