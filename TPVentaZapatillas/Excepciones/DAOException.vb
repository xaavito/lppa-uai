Public Class CannotOpenConnectionDataBaseException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExDAO001", "No se pudo abrir la conexión con la base de datos.")
    End Sub
End Class

Public Class ExecuteQueryException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExDAO002", "Ocurrió un error al ejecutar el query.")
    End Sub
End Class

Public Class BackUpException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExDAO003", "Ocurrió un error al generar el backup.")
    End Sub
End Class

Public Class RestoreException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExDAO004", "Ocurrió un error al generar el restore.")
    End Sub
End Class
