
Partial Class Site
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub
    Protected Sub LnkInicio_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Inicio.aspx")
    End Sub
    Protected Sub LnkProducto_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Productos.aspx")
    End Sub
    Protected Sub lnkAdmUsuarios_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Adminstracion.aspx")
    End Sub
    Protected Sub LnkPermisos_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Permisos.aspx")
    End Sub
    Protected Sub lnkBitacora_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Bitacora.aspx")
    End Sub
    Protected Sub lnkBackupRestored_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("BackupRestored.aspx")
    End Sub
    Protected Sub lnkAdmProductos_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Adminstracion.aspx")
    End Sub
    Protected Sub lnkSalir_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Login.aspx?Logout=true")
    End Sub
End Class

