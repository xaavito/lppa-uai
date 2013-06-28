Imports System.Collections.Generic
Imports System.Web


Public Class ShoppingCart
#Region "Properties"

    Public Property Items() As List(Of CartItem)
        Get
            Return m_Items
        End Get
        Private Set(value As List(Of CartItem))
            m_Items = Value
        End Set
    End Property
    Private m_Items As List(Of CartItem)

#End Region

#Region "Singleton"
    Public Shared ReadOnly Instance As ShoppingCart


    Shared Sub New()        
        If HttpContext.Current.Session("ASPNETShoppingCart") Is Nothing Then
            Instance = New ShoppingCart()
            Instance.Items = New List(Of CartItem)()
            HttpContext.Current.Session("ASPNETShoppingCart") = Instance
        Else
            Instance = DirectCast(HttpContext.Current.Session("ASPNETShoppingCart"), ShoppingCart)
        End If
    End Sub

    Protected Sub New()
    End Sub

#End Region

#Region "Item Modification Methods"

    'Agrega el item al carrito
    Public Sub AgregarItem(productId As Integer, cantidad As Integer)
        ' Crea un nuevo item
        Dim newItem As New CartItem(productId)

        ' Si ya existe, modifica la cantidad
        If Items.Contains(newItem) Then
            For Each item As CartItem In Items
                If item.Equals(newItem) Then
                    item.Cantidad += cantidad
                    Return
                End If
            Next
        Else
            newItem.Cantidad = cantidad
            Items.Add(newItem)
        End If
    End Sub

    'Cambia la cantidad de un item del carrito
    Public Sub SetItemCantidad(productId As Integer, cantidad As Integer)
        If cantidad = 0 Then
            QuitarItem(productId)
            Return
        End If

        Dim updatedItem As New CartItem(productId)

        For Each item As CartItem In Items
            If item.Equals(updatedItem) Then
                item.Cantidad = cantidad
                Return
            End If
        Next
    End Sub

    'Quita un item del carrito
    Public Sub QuitarItem(productId As Integer)
        Dim removedItem As New CartItem(productId)
        Items.Remove(removedItem)
    End Sub
#End Region

#Region "Reporting Methods"
    'Obtiene el precio total
    Public Function GetSubTotal() As Decimal
        Dim subTotal As Decimal = 0
        For Each item As CartItem In Items
            subTotal += item.PrecioTotal
        Next

        Return subTotal
    End Function
#End Region
End Class
