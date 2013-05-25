Public Class BEBitacora
    Private _id As Integer
    Public Property id() As Integer
        Get
            Return _id
        End Get
        Set(ByVal value As Integer)
            _id = value
        End Set
    End Property
    Private _idUsr As Integer
    Public Property idUsr() As Integer
        Get
            Return _idUsr
        End Get
        Set(ByVal value As Integer)
            _idUsr = value
        End Set
    End Property
    Private _usr As String
    Public Property usr() As String
        Get
            Return _usr
        End Get
        Set(ByVal value As String)
            _usr = value
        End Set
    End Property
    Private _evento As String
    Public Property evento() As String
        Get
            Return _evento
        End Get
        Set(ByVal value As String)
            _evento = value
        End Set
    End Property
    Private _fecha As Date
    Public Property fecha() As Date
        Get
            Return _fecha
        End Get
        Set(ByVal value As Date)
            _fecha = value
        End Set
    End Property
   


End Class
