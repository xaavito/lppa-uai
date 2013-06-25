Imports System.Windows.Forms
Imports System.Drawing

Public Class Output
    Private Shared _textbox As New RichTextBox()

    Public Shared Sub setTextBox(txt As RichTextBox)
        _textbox = txt
    End Sub

    Public Shared Sub Print(txt As String)
        Try

            If txt.StartsWith("#") Then
                AppendText(txt.Substring(1), Color.White, Color.Black, True)
            ElseIf txt.StartsWith("@") Then
                AppendText(txt.Substring(1), Color.Red, Color.White, False)
            ElseIf txt.StartsWith("@@") Then
                AppendText(txt.Substring(2), Color.White, Color.Red, True)
            ElseIf txt.StartsWith("%") Then
                AppendText(txt.Substring(1), Color.Black, Color.White, True)
            ElseIf txt.StartsWith("/") Then
                AppendText(txt.Substring(1), Color.Blue, Color.White, False)
            Else
                _textbox.AppendText(txt)
            End If
            _textbox.AppendText(Environment.NewLine)
        Catch ex As Exception

        End Try

    End Sub


    Private Shared Sub AppendText(ByVal text As String, ByVal ForegroundColor As Color, ByVal BackgroundColor As Color, ByVal BoolBold As Boolean)

        Dim start As Integer = _textbox.TextLength
        _textbox.AppendText(text)
        Dim [end] As Integer = _textbox.TextLength
        _textbox.[Select](start, [end] - start)
        If True Then
            If BoolBold Then
                _textbox.SelectionFont = New Font(_textbox.Font, FontStyle.Bold)
            Else
                _textbox.SelectionFont = New Font(_textbox.Font, FontStyle.Regular)
            End If

            _textbox.SelectionColor = ForegroundColor
            _textbox.SelectionBackColor = BackgroundColor
        End If
        _textbox.SelectionLength = 0
        _textbox.ScrollToCaret()
        _textbox.Refresh()
    End Sub

    Public Shared Sub Clear()
        Try
            _textbox.Clear()
        Catch ex As Exception

        End Try
    End Sub

End Class
