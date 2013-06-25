Public Class AccessDeniedModuleException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModPerfil", "ExPF001", "No tiene acceso al módulo ingresado", Windows.Forms.MessageBoxIcon.Information)
    End Sub

    Public Sub New(modulo As String)
        Me.New()
        Me.Modulo = modulo
    End Sub
End Class

Public Class LoadPermissionsException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModPerfil", "ExPF002", "Ha ocurrido un error al cargar los permisos", Windows.Forms.MessageBoxIcon.Error)
    End Sub
End Class

Public Class PerfilSaveException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModPerfil", "ExPF003", "Ocurrió un error al guardar el perfil.", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub
End Class

Public Class PefilGetException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModPerfil", "ExPF004", "Ocurrió un error al obtener el perfil.", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub
End Class


Public Class PermisoGetException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModPerfil", "ExPF005", "Ocurrió un error al obtener los permisos.", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub
End Class

Public Class PermisoSaveException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModPerfil", "ExPF006", "Ocurrió un error al guardar los permisos.", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub
End Class