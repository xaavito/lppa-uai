Imports System
Imports Negocio

Public Class CartItem
    Implements IEquatable(Of CartItem)

#Region "Properties"

    Public Property Cantidad() As Integer
        Get
            Return m_Cantidad
        End Get
        Set(value As Integer)
            m_Cantidad = value
        End Set
    End Property
    Private m_Cantidad As Integer

    Public Property Foto() As String
        Get
            Return m_Foto
        End Get
        Set(value As String)
            m_Foto = value
        End Set
    End Property
    Private m_Foto As String

    Private _productId As Integer
    Public Property ProductId() As Integer
        Get
            Return _productId
        End Get
        Set(value As Integer)
            _product = Nothing
            _productId = value
        End Set
    End Property

    Private _product As Producto = Nothing
    Public ReadOnly Property Prod() As Producto
        Get
            If _product Is Nothing Then
                _product = GesProductos.Consultar(ProductId).First()
            End If
            Return _product
        End Get
    End Property

    Public ReadOnly Property Descripcion() As String
        Get
            Return Prod.Nombre
        End Get
    End Property

    Public ReadOnly Property PrecioUnitario() As Decimal
        Get
            Return Prod.PrecioUnitario
        End Get
    End Property

    Public ReadOnly Property PrecioTotal() As Decimal
        Get
            Return PrecioUnitario * Cantidad
        End Get
    End Property

#End Region

    Public Sub New(productId As Integer)
        Me.ProductId = productId
    End Sub


    Public Overloads Function Equals(item As CartItem) As Boolean Implements System.IEquatable(Of CartItem).Equals
        Return item.ProductId = Me.ProductId
    End Function

End Class
