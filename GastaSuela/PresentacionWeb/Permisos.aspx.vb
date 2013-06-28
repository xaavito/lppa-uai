Imports Servicios

Public Class Permisos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            Dim perfiles As New List(Of Negocio.Perfil)
            perfiles = GesPerfiles.Consultar(Nothing)
            dgPermisos.DataSource = perfiles
            dgPermisos.DataBind()
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try
    End Sub

End Class