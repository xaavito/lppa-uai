Imports Negocio
Imports Excepciones
Imports Servicios

Public Class Site
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Permissions()
    End Sub

    Protected Sub HeadLoginStatus_LoggedOut(sender As Object, e As EventArgs)
        If Not Current.Usuario Is Nothing Then GesBitacoras.Guardar("Login", "Logout exitoso ({0})", New String() {Current.Usuario.Nick})
        System.Web.Security.FormsAuthentication.SignOut()
        Negocio.Current.Usuario = Nothing
        Session.Abandon()
        Response.Redirect("~/")
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
                        'Dim values As String() = acc.Accion.Split("|")
                        'If values.Length = 2 Then

                        '    Dim ObjMenu As System.Web.UI.WebControls.Menu = Me.FindControl(values(0))

                        '    If Not ObjMenu Is Nothing Then
                        '        For Each i As System.Web.UI.WebControls.MenuItem In ObjMenu.Items
                        '            If i.Value = values(1) Then
                        '                If acc.Permitido Then
                        '                    i.Enabled = True
                        '                Else
                        '                    ObjMenu.Items.Remove(i)
                        '                End If

                        '            End If
                        '        Next
                        '    End If

                        'End If
                    Next
                End If
            Next




            'For Each ctrl As Windows.Forms.Control In Me.Controls
            '    If Not ctrl.Tag Is Nothing Then
            '        If Not Current.Usuario.Perfil.validarPermiso(Modulo, ctrl.Tag.ToString) Then
            '            ctrl.Enabled = False
            '        End If
            '    End If
            'Next

        Catch ex As Exception
            My.Application.HandlerException(ex)
        End Try

    End Sub

End Class