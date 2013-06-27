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
            HandlerException(page, ex, Nothing)
        End Sub
        Public Sub HandlerException(ex As Exception)
            HandlerException(Nothing, ex, Nothing)
        End Sub
        Public Sub HandlerException(page As System.Web.UI.Page, ex As Exception, ValidationGroup As String)

            If TypeOf ex Is CustomException Then
                Dim cex As CustomException = DirectCast(ex, CustomException)

                GesBitacoras.Guardar(cex.Modulo, "({0}) {1}", New String() {cex.Code, cex.Message})

                If cex.Type = Windows.Forms.MessageBoxIcon.Error Or page Is Nothing Then
                    Response.Redirect("~/Message.aspx?title=ERROR&text=" & cex.Message, False)
                Else
                    If Not ValidationGroup Is Nothing Then
                        Dim validator As CustomValidator = New CustomValidator()
                        validator.IsValid = False
                        validator.ErrorMessage = ex.Message
                        validator.ValidationGroup = ValidationGroup
                        page.Validators.Add(validator)
                    Else
                        ScriptManager.RegisterStartupScript(page, page.GetType(), "Mensaje", "alert('" + String.Format("{0}", cex.Message) + "');", True)
                    End If
                End If

            Else
                Response.Redirect("~/Message.aspx?title=ERROR&text=Ocurrió un error no controlado en la aplicación: " & HttpUtility.HtmlEncode(ex.Message), False)
            End If
        End Sub


    End Class
End Namespace
