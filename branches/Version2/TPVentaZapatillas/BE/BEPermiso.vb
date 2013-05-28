Public Class BEPermiso
    ' Clase Permiso
#Region "Atributos"
    Dim _IdPermiso As Integer
    Dim _NombrePermiso As String
    Dim _LinkPermiso As String
#End Region
#Region "Propiedades"
    Public Property IdPermiso() As Integer
        Get
            Return _IdPermiso
        End Get
        Set(ByVal value As Integer)
            _IdPermiso = value
        End Set
    End Property
    Public Property NombrePermiso() As String
        Get
            Return _NombrePermiso
        End Get
        Set(ByVal value As String)
            _NombrePermiso = value
        End Set
    End Property
    Public Property LinkPermiso() As String
        Get
            Return _LinkPermiso
        End Get
        Set(ByVal value As String)
            _LinkPermiso = value
        End Set
    End Property
#End Region
End Class
