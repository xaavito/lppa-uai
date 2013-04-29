
Partial Class Adminstracion
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim LnkPermisos As LinkButton = CType(Master.FindControl("LnkPermisos"), LinkButton)
            Dim LinkBitacora As LinkButton = CType(Master.FindControl("LinkBitacora"), LinkButton)
            Dim lnkBackupRestored As LinkButton = CType(Master.FindControl("lnkBackupRestored"), LinkButton)
            LnkPermisos.Visible = True
            LinkBitacora.Visible = True
            lnkBackupRestored.Visible = True
        End If
    End Sub
End Class
