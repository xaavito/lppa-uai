Imports Seguridad

Public Class Producto
    Inherits BasePersistencia

    Private _nombre As String
    Private _preciounit As Decimal
    Private _foto As String

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
    Public Property PrecioUnitario() As Decimal
        Get
            Return _preciounit
        End Get
        Set(ByVal value As Decimal)
            _preciounit = value
        End Set
    End Property

    Public Property Foto() As String
        Get
            Return _foto
        End Get
        Set(ByVal value As String)
            _foto = value
        End Set
    End Property
 

End Class
