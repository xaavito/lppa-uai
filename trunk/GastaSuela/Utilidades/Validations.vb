Imports Excepciones
Imports System.Text.RegularExpressions
Imports System.Globalization

Public Class Validations

    Public Shared Sub Validate(tipo As ValidationType, text As String)

        Select Case tipo
            Case ValidationType.Required
                Required(text)
            Case ValidationType.NotWhiteSpace
                NotWhiteSpace(text)
            Case ValidationType.Numeric
                IsNumeric(text)
            Case ValidationType.Email
                IsEmail(text)
            Case ValidationType.AlphaNumeric
                IsAlphaNumeric(text)
            Case ValidationType.Date
                IsDate(text)
        End Select

    End Sub

    Public Shared Sub Required(text As String)

        If String.IsNullOrEmpty(text.Trim) Then
            Throw New InputRequiredException()
        End If

    End Sub

    Public Shared Sub NotWhiteSpace(text As String)

        If Regex.IsMatch(text, "\s") Then
            Throw New InputWhiteSpaceException()
        End If

    End Sub

    Public Shared Sub IsNumeric(text As String)
        If Not String.IsNullOrEmpty(text) Then
            If Not Regex.IsMatch(text, "^[0-9]+$") Then
                Throw New InputNumbersRequiredException()
            End If
        End If
    End Sub
    Public Shared Sub ValueEquals(text As String, text2 As String)

        If Not text.Equals(text2) Then
            Throw New InputNotEquals()
        End If

    End Sub

    Public Shared Sub IsEmail(text As String)
        If Not String.IsNullOrEmpty(text) Then
            If Not Regex.IsMatch(text, "^[_a-z0-9-]+(.[a-z0-9-]+)@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$") Then
                Throw New InputEmailException()
            End If
        End If
    End Sub

    Public Shared Sub IsAlphaNumeric(text As String)
        If Not String.IsNullOrEmpty(text) Then
            If Not Regex.IsMatch(text, "^[A-Z0-9 a-z]*$") Then
                Throw New InputAlphaNumericException()
            End If
        End If
    End Sub


    Public Shared Sub IsDate(text As String)        
        If Not String.IsNullOrEmpty(text) Then
            Dim fecha As Date
            If Not Date.TryParseExact(text, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, fecha) Then
                Throw New InputDateException()
            Else
                Dim minDateTime As New DateTime(1753, 1, 1)
                Dim maxDateTime As New DateTime(9999, 12, 31, 23, 59, 59, 997)

                If fecha < minDateTime Or fecha > maxDateTime Then
                    Throw New InputDateRangeException()
                End If
            End If
        End If
    End Sub

End Class
