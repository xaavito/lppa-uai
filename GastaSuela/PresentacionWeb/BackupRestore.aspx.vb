Imports Servicios

Public Class BackupRestore
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub btnBackUp_Click(sender As Object, e As System.EventArgs) Handles btnBackUp.Click
        Try
            Dim pathBkp As String = System.Configuration.ConfigurationManager.AppSettings("RutaBackUp")
            GesMantenimiento.RealizarBackUp(pathBkp)
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try
    End Sub

    Private Sub btnRestore_Click(sender As Object, e As System.EventArgs) Handles btnBackUp.Click
        Try
            Dim pathBkp As String = System.Configuration.ConfigurationManager.AppSettings("RutaBackUp")
            pathBkp = pathBkp & "nombrebackup.bkp"
            GesMantenimiento.RealizarRestore(pathBkp)
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try
    End Sub
End Class