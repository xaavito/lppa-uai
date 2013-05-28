Public Class BEUsuario
    ' Clase Usuario 
#Region "Atributos"
    Dim _IdUsuario As Integer
    Dim _Nombre As String
    Dim _Apellido As String
    Dim _Usuario As String
    Dim _Password As String
    Dim _IdPerfil As Integer
#End Region
#Region "Propiedades"
    Public Property IdUsuario() As Integer
        Get
            Return _IdUsuario
        End Get
        Set(ByVal value As Integer)
            _IdUsuario = value
        End Set
    End Property
    Public Property Nombre() As String
        Get
            Return _Nombre
        End Get
        Set(ByVal value As String)
            _Nombre = value
        End Set
    End Property
    Public Property Apellido() As String
        Get
            Return _Apellido
        End Get
        Set(ByVal value As String)
            _Apellido = value
        End Set
    End Property
    Public Property Usuario() As String
        Get
            Return _Usuario
        End Get
        Set(ByVal value As String)
            _Usuario = value
        End Set
    End Property
    Public Property Password() As String
        Get
            Return _Password
        End Get
        Set(ByVal value As String)
            _Password = value
        End Set
    End Property
    Public Property IdPerfil() As String
        Get
            Return _IdPerfil
        End Get
        Set(ByVal value As String)
            _IdPerfil = value
        End Set
    End Property

#End Region
End Class
