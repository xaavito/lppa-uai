'TODO: Patron Prototype -> Prototipo Concreto
Public Class Contenedor
    Inherits Control
    Implements IPrototype(Of Contenedor)

    Private _controles As New List(Of Control)

    Public Property Controles() As List(Of Control)
        Get
            Return _controles
        End Get
        Set(value As List(Of Control))
            _controles = value
        End Set
    End Property

    Public Overloads Function Clonar() As Contenedor Implements IPrototype(Of Contenedor).Clonar
        Dim cont As New Contenedor()
        cont.Caption = Me.Caption
        cont.Nombre = Me.Nombre
        For Each c As Control In _controles
            cont.Controles.Add(c.Clonar())
        Next
        Return cont
    End Function
End Class
