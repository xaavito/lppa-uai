Public Class CustomException
    Inherits Exception

    Private _code As String = "00"
    Private _modulo As String = ""
    Private _type As Windows.Forms.MessageBoxIcon = Windows.Forms.MessageBoxIcon.Exclamation

    Public Sub New(code As String, message As String)
        MyBase.New(message)
        _code = code
    End Sub

    Public Sub New(code As String, message As String, tipo As Windows.Forms.MessageBoxIcon)
        Me.New(code, message)
        _type = tipo
    End Sub

    Public Sub New(modulo As String, code As String, message As String, tipo As Windows.Forms.MessageBoxIcon)
        Me.New(code, message)
        _type = tipo
        _modulo = modulo
    End Sub



    Public Property Code() As String
        Get
            Return _code
        End Get
        Set(ByVal value As String)
            _code = value
        End Set
    End Property

    Public Property Type() As Windows.Forms.MessageBoxIcon
        Get
            Return _type
        End Get
        Set(ByVal value As Windows.Forms.MessageBoxIcon)
            _type = value
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
