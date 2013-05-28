Imports BE
Imports BLL
Partial Class Usuarios
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            FillGridUsuario()
        End If
    End Sub
    Private Sub FillGridUsuario()
        Dim Usuario As New Usuario
        Try
            grdUsuarios.DataSource = Usuario.GetUsuarios
            grdUsuarios.DataBind()
        Catch ex As Exception
            'Registrar en bitacora
        End Try
    End Sub
    Protected Sub btnGuardar_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim NewUsuario As New BEUsuario
        Dim Usuario As New Usuario
        Try
            NewUsuario.IdUsuario = 0
            NewUsuario.Nombre = txtNombre.Text
            NewUsuario.Apellido = txtApellido.Text
            NewUsuario.Usuario = txtUsuario.Text
            NewUsuario.Password = txtContrasenia.Text.GetHashCode
            NewUsuario.IdPerfil = ddlFamilia.SelectedValue
            If Usuario.GuardarUsuario(NewUsuario) Then
                Me.Page.ClientScript.RegisterStartupScript(Me.GetType(), "Message", "alert('Usuario guardado correctamente');", True)
                FillGridUsuario()
            End If
        Catch ex As Exception
            'Registrar en bitacora
        End Try
    End Sub


End Class
