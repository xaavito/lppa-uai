Imports System.Web

Public Class Current

    Private Shared user As Usuario

    Public Shared Property Usuario() As Usuario
        Get
            If Not HttpContext.Current.Session("Usuario") Is Nothing Then
                Return DirectCast(HttpContext.Current.Session("Usuario"), Usuario)
            End If
            Return Nothing
        End Get
        Set(ByVal value As Usuario)
            HttpContext.Current.Session("Usuario") = value
        End Set
    End Property


End Class
