
Public Class DigitoVerificadorGetException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModDigitoVerificador", "ExPDV004", "Ocurrió un error al obtener el Digito Verificador.", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub
End Class


