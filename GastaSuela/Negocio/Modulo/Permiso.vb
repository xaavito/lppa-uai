Public Class Permiso
    Inherits BasePersistencia

    Private _moduloaccion As ModuloAccion
    Private _permitido As Boolean


    Public Property ModuloAccion() As ModuloAccion
        Get
            Return _moduloaccion
        End Get
        Set(ByVal value As ModuloAccion)
            _moduloaccion = value
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
