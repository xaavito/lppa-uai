Imports Negocio
Imports Excepciones

Public Class Site
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Permissions()
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