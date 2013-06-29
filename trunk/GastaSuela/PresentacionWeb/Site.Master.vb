Imports Negocio
Imports Excepciones
Imports Servicios

Public Class Site
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        VerificaDigitos()
        Permissions()
    End Sub

    Protected Sub HeadLoginStatus_LoggedOut(sender As Object, e As EventArgs)
        If Not Current.Usuario Is Nothing Then GesBitacoras.Guardar("Login", "Logout exitoso ({0})", New String() {Current.Usuario.Nick})
        System.Web.Security.FormsAuthentication.SignOut()
        Negocio.Current.Usuario = Nothing
        Session.Abandon()
        Response.Redirect("~/")
    End Sub

    Sub VerificaDigitos()

        If Utilidades.Pages.GetCurrentPageName().ToLower <> "digitoverificador.aspx" _
            And Utilidades.Pages.GetCurrentPageName().ToLower <> "message.aspx" _
            And Utilidades.Pages.GetCurrentPageName().ToLower <> "login.aspx" Then

            Try
                If GesDigitos.Verificar().Rows.Count > 0 Then
                    If Context.User.IsInRole("WebMaster") Then
                        Response.Redirect("/DigitoVerificador.aspx", False)
                    Else
                        Response.Redirect("~/Message.aspx?title=Mensaje&text=Disculpe las molestias, tenemos un problema, vuelva pronto", False)
                    End If
                End If
            Catch ex As Exception
                My.Application.HandlerException(ex)
            End Try


        End If


    End Sub

    ''' <summary>
    ''' Verifica los permisos del módulo y los controles
    ''' </summary>
    ''' <remarks></remarks>
    Protected Sub Permissions()
        Try
            If Current.Usuario Is Nothing Then
                Return
            End If
            If Current.Usuario.Perfil Is Nothing Then
                Return
            End If

            Dim modu As New Modulo(Utilidades.Pages.GetCurrentPageName().ToLower, "")
            If Not Current.Usuario.Perfil.validarPermiso(modu, String.Empty) Then
                My.Application.HandlerException(New AccessDeniedModuleException(modu.Codigo))
            End If


            For Each m As Modulo In Current.Usuario.Perfil.Modulos
                If "Site.Master" = m.Codigo Then
                    For Each acc As ModuloAccion In m.ModulosAccion

                        Dim ObjCtrl As Control = Me.FindControl(acc.Accion)
                        If Not ObjCtrl Is Nothing Then
                            If acc.Permitido Then ObjCtrl.Visible = True
                        End If
                    Next
                End If
            Next

        Catch ex As Exception
            My.Application.HandlerException(ex)
        End Try

    End Sub

End Class