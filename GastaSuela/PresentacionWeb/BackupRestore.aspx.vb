Imports Servicios

Public Class BackupRestore
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FillTables()
    End Sub

    Sub FillTables()
        Try

            Dim backups As New List(Of Negocio.Backup)
            backups = GesMantenimiento.ConsutarBackUp()
            dgBackUps.DataSource = backups
            dgBackUps.DataBind()
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try

        Try

            Dim restores As New List(Of Negocio.Restore)
            restores = GesMantenimiento.ConsutarRestore()
            dgRestores.DataSource = restores
            dgRestores.DataBind()
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try
    End Sub

    Private Sub btnBackUp_Click(sender As Object, e As System.EventArgs) Handles btnBackUp.Click
        Try
            Dim pathBkp As String = System.Configuration.ConfigurationManager.AppSettings("RutaBackUp")
            pathBkp = pathBkp + "GastaSuela_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".bkp"
            GesMantenimiento.RealizarBackUp(pathBkp)

            Dim validator As CustomValidator = New CustomValidator()
            validator.IsValid = False
            validator.ErrorMessage = "Backup realizado correctamente"
            validator.ValidationGroup = "BackUpRestoreValidationGroup"
            Page.Validators.Add(validator)

            FillTables()

        Catch ex As Exception
            My.Application.HandlerException(Me, ex, "BackUpRestoreValidationGroup")
        End Try
    End Sub

    Protected Sub dgBackUps_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Restore" Then
            Dim ruta = Convert.ToString(e.CommandArgument)
            Restore(ruta)
        End If
    End Sub

    Sub Restore(ruta)
        Try
            GesMantenimiento.RealizarRestore(ruta)

            Dim validator As CustomValidator = New CustomValidator()
            validator.IsValid = False
            validator.ErrorMessage = "Restore realizado correctamente"
            validator.ValidationGroup = "BackUpRestoreValidationGroup"
            Page.Validators.Add(validator)

            FillTables()

        Catch ex As Exception
            My.Application.HandlerException(Me, ex, "BackUpRestoreValidationGroup")
        End Try
    End Sub
End Class