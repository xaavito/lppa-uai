Public Class InputRequiredException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExP001", "El campo es obligatorio.", MsgBoxStyle.Exclamation)
    End Sub
End Class

Public Class InputWhiteSpaceException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExP002", "El campo no debe contener espacios en blanco.", MsgBoxStyle.Exclamation)
    End Sub
End Class

Public Class InputNumbersRequiredException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExP003", "El campo solo permite números.", MsgBoxStyle.Exclamation)
    End Sub
End Class

Public Class ItemSelectRequiredException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExP004", "Debe seleccionar un item.", MsgBoxStyle.Exclamation)
    End Sub
End Class

Public Class InputNotEquals
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExP005", "Los valores deben ser iguales.", MsgBoxStyle.Exclamation)
    End Sub
End Class

Public Class InputEmailException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExP006", "El email es incorrecto.", MsgBoxStyle.Exclamation)
    End Sub
End Class

Public Class InputAlphaNumericException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExP007", "La cadena no tiene el formato correcto, solo se permiten valores alfanuméricos.", MsgBoxStyle.Exclamation)
    End Sub
End Class

Public Class InputDateException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExP008", "El formato de fecha es incorrecto, utilice dd/mm/yyyy.", MsgBoxStyle.Exclamation)
    End Sub
End Class

Public Class InputDateRangeException
    Inherits CustomException

    Public Sub New()
        MyBase.New("ExP009", "La fecha esta fuera de rango. desde 01/01/1753 a 31/12/999.", MsgBoxStyle.Exclamation)
    End Sub
End Class