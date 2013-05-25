Public Class BEPerfil
    ' Clase Perfil 
#Region "Atributos"
    Dim _IdPerfil As Integer
    Dim _NombrePerfil As String
#End Region
#Region "Propiedades"
    Public Property IdPerfil() As Integer
        Get
            Return _IdPerfil
        End Get
        Set(ByVal value As Integer)
            _IdPerfil = value
        End Set
    End Property
    Public Property NombrePerfil() As String
        Get
            Return _NombrePerfil
        End Get
        Set(ByVal value As String)
            _NombrePerfil = value
        End Set
    End Property
#End Region
End Class
