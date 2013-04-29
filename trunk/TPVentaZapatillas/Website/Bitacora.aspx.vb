
Partial Class Bitacora
    Inherits System.Web.UI.Page
    Public Class PermisoEjemplo
        Public Evento As String
        Public Fecha As String
        Public usuario As String
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
        Dim Ej3 As PermisoEjemplo

        Ej = New PermisoEjemplo
        Ej.Evento = "Ingreso al sistema"
        Ej.Fecha = "10/03/2013"
        Ej.usuario = "Adrian Scarinci"
        ListaEjemplo.Add(Ej)


        Ej2 = New PermisoEjemplo
        Ej.Evento = "Ingreso al sistema"
        Ej.Fecha = "10/03/2013"
        Ej.usuario = "Gonzalo Dominguez"
        ListaEjemplo.Add(Ej2)

        Ej3 = New PermisoEjemplo
        Ej3.Evento = "Ingreso al sistema"
        Ej3.Fecha = "10/03/2013"
        Ej3.usuario = "Dario Garcia"
        ListaEjemplo.Add(Ej3)

        gvBitacora.DataSource = ListaEjemplo
        gvBitacora.DataBind()
    End Sub
    Protected Sub gvBitacora_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim Ej As PermisoEjemplo = CType(e.Row.DataItem, PermisoEjemplo)
            Dim lblEvento As Label = CType(e.Row.FindControl("LblEvento"), Label)
            Dim LblFecha As Label = CType(e.Row.FindControl("LblFecha"), Label)
            Dim LblUsuario As Label = CType(e.Row.FindControl("LblUsuario"), Label)

            lblEvento.Text = Ej.Evento
            LblFecha.Text = Ej.Fecha
            LblUsuario.Text = Ej.usuario

        End If
    End Sub

End Class
