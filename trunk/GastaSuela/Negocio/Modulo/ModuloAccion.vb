Public Class ModuloAccion
    Inherits BasePersistencia

    Private _accion As String
    Private _permitido As Boolean

    Public Property Accion() As String
        Get
            Return _accion
        End Get
        Set(ByVal value As String)
            _accion = value
        End Set
    End Property

    Public Property Permitido() As Boolean
        Get
            Return _permitido
        End Get
        Set(ByVal value As Boolean)
            _permitido = value
        End Set
    End Property

End Class
