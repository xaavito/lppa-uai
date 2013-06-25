Imports Negocio

Public Class Site
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Context.User.IsInRole("Administrador")) Then
            Response.Write("SIIIIIII")
        End If
    End Sub

End Class