Public Class Current

    Private Shared user As Usuario

    Public Shared Property Usuario() As Usuario
        Get
            Return user
        End Get
        Set(ByVal value As Usuario)
            user = value
        End Set
    End Property


End Class
