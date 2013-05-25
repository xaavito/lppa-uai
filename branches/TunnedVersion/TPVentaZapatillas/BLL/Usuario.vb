Imports DAL
Imports BE
Public Class Usuario
#Region "Metodos"
    'Metodo para Cargar usuario de base de datos 
    Public Function CargarUsuario(ByRef unIdUsuario As Integer, ByVal usr As String, ByVal Pass As String) As BEUsuario
        Dim dalusuario As New DALUsuario
        Dim unsuario As New BEUsuario
        Dim IdUsuario As Integer = 0
        Try
            If dalusuario.VerificarUsuario(unsuario, usr, Pass) Then
                'Si usuario existe en base de datos lo cargo usuario con datos
                IdUsuario = unsuario.IdUsuario
                ' Registrar en bitacora el logueo de usuario
            End If
            unIdUsuario = IdUsuario 'Guardo el IdUsuario para luego comprobar si existe
        Catch ex As Exception
            'registrar en bitacora
        End Try
        Return unsuario
    End Function
    'Metodo que Obtiene los permisos de usuario
    Public Function GetPermisos(ByVal IdPerfil As Integer) As Generic.List(Of BEPermiso)
        Dim unDalUsuario As New DALUsuario
        Return unDalUsuario.GetPermisos(IdPerfil)
    End Function
    'Metodo que para guardar el usuario
    Public Function GuardarUsuario(ByVal Usuario As BEUsuario) As Boolean
        Dim unDalUsuario As New DALUsuario
        Return unDalUsuario.GuardarUsuario(Usuario)
    End Function
    'Metodo que para Eliminar los usuarios
    Public Function EliminarUsuario(ByVal IdUsuario As Integer, ByVal IdPerfil As Integer) As Boolean
        Dim unDalUsuario As New DALUsuario
        Return unDalUsuario.EliminarUsuario(IdUsuario, IdPerfil)
    End Function
    'Metodo que para Obtener todos los usuarios
    Public Function GetUsuarios() As DataTable
        Dim unDalUsuario As New DALUsuario
        Return unDalUsuario.GetUsuarios
    End Function

#End Region
End Class
