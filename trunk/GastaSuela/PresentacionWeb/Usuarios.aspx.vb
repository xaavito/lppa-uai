Imports Servicios

Public Class Usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            Dim usuarios As New List(Of Negocio.Usuario)
            usuarios = GesUsuarios.Consultar()
            dgvUsuarios.DataSource = usuarios
            dgvUsuarios.DataBind()
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try

    End Sub

End Class