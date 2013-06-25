Public Class UserNotFoundException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModUsuario", "ExU001", "El usuario y/o password no es valido.", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub

End Class
Public Class UserGetException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModUsuario", "ExU002", "Ocurrió un error al obtener el usuario.", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub

End Class

Public Class UsuarioSaveException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModUsuario", "ExU003", "Ocurrió un error al guardar el usuario.", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub

End Class

