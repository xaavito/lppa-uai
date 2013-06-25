Public Class BitacoraGetException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModBitacora", "ExB001", "Ocurrió un error al obtener la bitacora", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub
End Class
