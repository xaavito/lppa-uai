Public Class Perfil
    Inherits BasePersistencia

    Private _nombre As String
    Private _modulos As List(Of Modulo)
    Private _permisos As Permiso()

    Sub New()
        MyBase.Persistencia = EstadoPersistencia.INSERT
    End Sub

    Public Property Nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property

    Public ReadOnly Property Permisos() As Permiso()
        Get
            Return _permisos
        End Get
    End Property

    Public Property Modulos() As List(Of Modulo)
        Get
            Return _modulos
        End Get
        Set(ByVal value As List(Of Modulo))
            _modulos = value
        End Set
    End Property



    Public Function validarPermiso(ByVal modulo As Modulo, ByVal accion As String) As Boolean

        If modulo Is Nothing Then Return False

        If accion = String.Empty Then
            For Each modu As Modulo In _modulos
                If modulo.Codigo = modu.Codigo Then Return modu.Permitido
            Next
            Return True
        End If

        If accion <> String.Empty Then
            For Each modu As Modulo In _modulos
                If modulo.Codigo = modu.Codigo Then
                    For Each acc As ModuloAccion In modu.ModulosAccion
                        If accion = acc.Accion Then Return acc.Permitido
                    Next
                    Return True
                End If
            Next
        End If
        Return False
    End Function

    Public Overrides Function ToString() As String
        Return Me.Nombre
    End Function

End Class
