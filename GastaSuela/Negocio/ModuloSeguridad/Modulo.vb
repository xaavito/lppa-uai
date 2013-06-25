Public Class Modulo
    Inherits BasePersistencia

    Private _codigo As String
    Private _nombre As String
    Private _padre As Modulo
    Private _modulosaccion As List(Of ModuloAccion)
    Private _permitido As Boolean

    Public Sub New()

    End Sub

    Public Sub New(codigo As String)
        _codigo = codigo
        _nombre = Nothing
    End Sub

    Public Sub New(codigo As String, nombre As String)
        Me.New(codigo)
        _nombre = nombre
    End Sub

    Public Property Codigo() As String
        Get
            Return _codigo
        End Get
        Set(ByVal value As String)
            _codigo = value
        End Set
    End Property

    Public Property Nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property

    Public Property Padre() As Modulo
        Get
            Return _padre
        End Get
        Set(ByVal value As Modulo)
            _padre = value
        End Set
    End Property

    Public Property ModulosAccion() As List(Of ModuloAccion)
        Get
            Return _modulosaccion
        End Get
        Set(ByVal value As List(Of ModuloAccion))
            _modulosaccion = value
        End Set
    End Property

    Public Function Consultar() As Modulo()
        Dim modu As Modulo()
        Return modu
    End Function

    Public Property Permitido() As Boolean
        Get
            Return _permitido
        End Get
        Set(ByVal value As Boolean)
            _permitido = value
        End Set
    End Property

End Class
