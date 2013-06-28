Imports Seguridad

Public Class Usuario
    Inherits BasePersistencia

    Private _nombre As String
    Private _apellido As String
    Private _email As String
    Private _nick As String
    Private _clave As String
    Private _perfil As Perfil

    Sub New()
        MyBase.Persistencia = EstadoPersistencia.INSERT
    End Sub

    Public Property Nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property
    Public Property Apellido() As String
        Get
            Return _apellido
        End Get
        Set(ByVal value As String)
            _apellido = value
        End Set
    End Property

    Public Property Email() As String
        Get
            Return _email
        End Get
        Set(ByVal value As String)
            _email = value
        End Set
    End Property
    Public Property Nick() As String
        Get
            Return _nick
        End Get
        Set(ByVal value As String)
            _nick = value
        End Set
    End Property
    Public Property Clave() As String
        Get
            Return Seguridad.Seguridad.Desencriptar(_clave, _nick)
        End Get
        Set(ByVal value As String)
            _clave = Seguridad.Seguridad.Encriptar(value, _nick)
        End Set
    End Property

    Public Property Perfil() As Perfil
        Get
            Return _perfil
        End Get
        Set(ByVal value As Perfil)
            _perfil = value
        End Set
    End Property
    Public Overrides Function ToString() As String
        Return Me.Apellido + ", " + Me.Nombre
    End Function

End Class
