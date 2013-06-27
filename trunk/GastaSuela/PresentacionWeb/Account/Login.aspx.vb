Imports Negocio
Imports System.Security.Principal
Imports Servicios
Imports Excepciones

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
    End Sub



    Protected Sub LoginButton_Click(sender As Object, e As EventArgs)

        If Me.Session("CountFails") Is Nothing Then
            Me.Session("CountFails") = 0
        End If

        If Me.Session("CountFails") = 2 Then
            My.Application.HandlerException(Me, New CustomException("U05", "Usuario bloqueado, intentelo mas tarde."), "LoginUserValidationGroup")
        Else

            Try
                'Verifica el usuario y password ingresados
                Seguridad.Seguridad.Login(Me.UserName.Text, Me.Password.Text)

                'Carga el usuario logueado en memoria
                Current.Usuario = Servicios.GesUsuarios.Obtener(Me.UserName.Text)

                'Carga los permisos del usuario
                Servicios.GesPermisos.CargarPermisos(Current.Usuario.Perfil)

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

                Me.Session("CountFails") = 0
                GesBitacoras.Guardar("Login", "Logueo exitoso ({0})", New String() {Current.Usuario.Nick})

                'Redirecciona a la pagina a la que se intentó ingresar
                If Not String.IsNullOrEmpty(Request.QueryString("ReturnUrl")) Then
                    Response.Redirect(Request.QueryString("ReturnUrl").ToString, False)
                End If
                Response.Redirect("~/", False)

            Catch ex As Exception
                Me.Session("CountFails") += 1
                My.Application.HandlerException(Me, ex, "LoginUserValidationGroup")
            End Try
        End If
    End Sub
End Class