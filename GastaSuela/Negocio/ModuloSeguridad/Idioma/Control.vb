Imports System.Xml.Serialization
'TODO: Patron Prototype -> Prototipo Concreto
<Serializable()> _
Public Class Control
    Implements IPrototype(Of Control)

    Private _nombre As String
    Private _caption As String

    Public Property Nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
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

    Public Overloads Function Clonar() As Control Implements IPrototype(Of Control).Clonar
        Dim ctrl As New Control()
        ctrl.Nombre = _nombre
        ctrl.Caption = _caption
        Return ctrl
    End Function
End Class
