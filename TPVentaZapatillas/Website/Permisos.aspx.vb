
Partial Class Permisos
    Inherits System.Web.UI.Page
    Public Class PermisoEjemplo
        Public Descripcion As String
    End Class
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarLista()
            Dim LnkPermisos As LinkButton = CType(Master.FindControl("LnkPermisos"), LinkButton)
            Dim LinkBitacora As LinkButton = CType(Master.FindControl("LinkBitacora"), LinkButton)
            Dim lnkBackupRestored As LinkButton = CType(Master.FindControl("lnkBackupRestored"), LinkButton)
            LnkPermisos.Visible = True
            LinkBitacora.Visible = True
            lnkBackupRestored.Visible = True
        End If
    End Sub
    Private Sub CargarLista()
        Dim ListaEjemplo As New Generic.List(Of PermisoEjemplo)
        Dim Ej As PermisoEjemplo
        Dim Ej2 As PermisoEjemplo
        'Dim Ej3 As PermisoEjemplo

        Ej = New PermisoEjemplo
        Ej.Descripcion = "Productos"
        ListaEjemplo.Add(Ej)

        Ej2 = New PermisoEjemplo
        Ej2.Descripcion = "Administracion"
        ListaEjemplo.Add(Ej2)


        'Ej3 = New PermisoEjemplo
        'Ej3.Descripcion = "Administrar Productos"
        'ListaEjemplo.Add(Ej3)

        grdPermisos.DataSource = ListaEjemplo
        grdPermisos.DataBind()
    End Sub
    Protected Sub grdPermisos_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim Ej As PermisoEjemplo = CType(e.Row.DataItem, PermisoEjemplo)
            Dim lblDescripcion As Label = CType(e.Row.FindControl("lblDescripcion"), Label)
            lblDescripcion.Text = Ej.Descripcion
        End If
    End Sub

End Class
