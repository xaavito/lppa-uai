Imports System.Xml.Serialization
'TODO: Patron Prototype -> Prototipo Concreto
<Serializable()> _
Public Class Mensaje
    Implements IPrototype(Of Mensaje)

    Private _codigo As String
    Private _caption As String

    Public Property Codigo() As String
        Get
            Return _codigo
        End Get
        Set(ByVal value As String)
            _codigo = value
        End Set
    End Property

    Public Property Caption() As String
        Get
            Return _caption
        End Get
        Set(ByVal value As String)
            _caption = value
        End Set
    End Property

    Public Overrides Function ToString() As String
        Return _caption
    End Function

    Public Function Clonar() As Mensaje Implements IPrototype(Of Mensaje).Clonar
        Dim msg As New Mensaje()
        msg.Caption = _caption
        msg.Codigo = _codigo
        Return msg
    End Function
End Class
