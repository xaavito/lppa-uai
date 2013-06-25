Public Class ConnectionStringNotFoundException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExCONF001", "No se encontró la cadena de conexión al repositorio", Windows.Forms.MessageBoxIcon.Error)
    End Sub
End Class
