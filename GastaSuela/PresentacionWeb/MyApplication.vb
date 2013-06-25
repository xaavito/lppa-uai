Imports Excepciones
Imports Servicios


Namespace My
    Partial Friend Class MyApplication


        ''' <summary>
        ''' Maneja las excepciones de la aplicación
        ''' </summary>
        ''' <param name="ex">Exception ocurrida</param>
        ''' <remarks></remarks>
        Public Sub HandlerException(page As System.Web.UI.Page, ex As Exception)

            If TypeOf ex Is CustomException Then
                Dim cex As CustomException = DirectCast(ex, CustomException)

                GesBitacoras.Guardar(cex.Modulo, "({0}) {1}", New String() {cex.Code, cex.Message})

                'Response.Write(String.Format("{0}", cex.Message))
                'Response.End()

                'Dim cstype As Type = Me.[GetType]()

                'Page.ClientScript.RegisterStartupScript( me.gettype(), "PopupScript", alertScript );


                ScriptManager.RegisterStartupScript(page, page.GetType(), "Mensaje", "alert('" + String.Format("{0}", cex.Message) + "');", True)

                'If cex.Type = MessageBoxIcon.Error Then
                'MsgBox("Ocurrió un error crítico en la aplicación, la misma se cerrará", MsgBoxStyle.Critical)
                'System.Environment.Exit(1)
                'End If
            Else

                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Mensaje", "alert('Ocurrió un error no controlado en la aplicación');", True)

            End If
        End Sub


    End Class
End Namespace
