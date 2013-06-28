Public Class Backup
    Inherits BasePersistencia

    Private _usuario As Usuario
    Private _fecha As System.Nullable(Of Date)
    Private _estado As Boolean
    Private _ruta As String

    Sub New()
        MyBase.Persistencia = EstadoPersistencia.INSERT
    End Sub

    Public Property Ruta() As String
        Get
            Return _ruta
        End Get
        Set(ByVal value As String)
            _ruta = value
        End Set
    End Property


    Public Property Estado() As Boolean
        Get
            Return _estado
        End Get
        Set(ByVal value As Boolean)
            _estado = value
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


    Public Property Usuario() As Usuario
        Get
            Return _usuario
        End Get
        Set(ByVal value As Usuario)
            _usuario = value
        End Set
    End Property

End Class
