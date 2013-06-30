Public Class BackupGetException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModBackup", "ExBKP001", "Ocurrió un error al obtener los backup", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub
End Class
Public Class RestoreGetException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ModRestore", "ExRES001", "Ocurrió un error al obtener los restore", Windows.Forms.MessageBoxIcon.Exclamation)
    End Sub
End Class