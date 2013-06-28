
Public Class ProductoGetException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModProducto", "ExPP004", "Ocurrió un error al obtener el producto.", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub
End Class


