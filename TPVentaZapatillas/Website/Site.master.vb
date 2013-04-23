
Partial Class Site
    Inherits System.Web.UI.MasterPage
    Protected Sub LnkInicio_Click(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub LnkProducto_Click(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub lnkAdmUsuarios_Click(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub LnkPermisos_Click(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub lnkBitacora_Click(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub lnkBackupRestored_Click(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub lnkSalir_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Login.aspx?Logout=true")
    End Sub
End Class

