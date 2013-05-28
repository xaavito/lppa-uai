Public Class CustomException
    Inherits Exception

    Private _code As String = "00"
    Private _modulo As String = ""


    Public Sub New(code As String, message As String)
        MyBase.New(message)
        _code = code
    End Sub



    Public Property Code() As String
        Get
            Return _code
        End Get
        Set(ByVal value As String)
            _code = value
        End Set
    End Property


    Public Property Modulo() As String
        Get
            Return _modulo
        End Get
        Set(ByVal value As String)
            _modulo = value
        End Set
    End Property

End Class
