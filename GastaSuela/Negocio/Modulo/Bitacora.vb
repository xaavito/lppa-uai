<Serializable()> _
Public Class Bitacora
    Inherits BasePersistencia
    Private _usuario As Usuario
    Private _fecha As System.Nullable(Of Date)
    Private _modulo As String
    Private _descripcion As String
    Private _args As String()

    Sub New()
        MyBase.Persistencia = EstadoPersistencia.INSERT
    End Sub

    Public Property Usuario() As Usuario
        Get
            Return _usuario
        End Get
        Set(ByVal value As Usuario)
            _usuario = value
        End Set
    End Property

    Public Property Fecha() As System.Nullable(Of Date)
        Get
            Return _fecha
        End Get
        Set(ByVal value As System.Nullable(Of Date))
            _fecha = value
        End Set
    End Property


    Public Property Modulo() As String
        Get
            Return _modulo
        End Get
        Set(ByVal value As String)
            _modulo = value
        End Set
    End Property

    Public Property Descripcion() As String
        Get
            Return _descripcion
        End Get
        Set(ByVal value As String)
            _descripcion = value
        End Set
    End Property

    Public Property Argumentos() As String()
        Get
            Return _args
        End Get
        Set(ByVal value As String())
            _args = value
        End Set
    End Property


End Class
