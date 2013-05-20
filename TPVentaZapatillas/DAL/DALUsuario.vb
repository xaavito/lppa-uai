Imports BE
Public Class DALUsuario
    'Metodo para verificar si usuario existe en base de datos
    Public Function VerificarUsuario(ByVal UnUsuario As BEUsuario, ByVal usuario As String, ByVal pass As String) As Boolean
        Dim ds As New DataSet
        Dim existe As Boolean
        Dim NombreSp As String
        Dim ht As New Hashtable
        NombreSp = "pa_Usuarios_Get"
        ht.Add("@Usuario", usuario)
        ht.Add("@Password", pass.GetHashCode)
        BD.GetData(NombreSp, ds, ht)
        existe = ds.Tables(0).Rows.Count > 0
        If existe Then
            'Cargo las propiedades de la entidad usario con datos.
            CargarUsuarioDataRow(UnUsuario, ds.Tables(0).Rows(0))
        End If
        Return existe
    End Function
    'Metodo para obtener todos los usuarios cargados
    Public Function GetUsuarios() As DataTable
        Dim ds As New DataSet
        Dim existe As Boolean
        Dim NombreSp As String
        Dim ht As New Hashtable
        Dim dt As New DataTable
        NombreSp = "pa_Usuarios_Get"
        BD.GetData(NombreSp, ds, ht)
        existe = ds.Tables(0).Rows.Count > 0
        If existe Then
            dt = ds.Tables(0)
        End If
        Return dt
    End Function
    Public Function GetPermisos(ByVal unIdPerfil As Integer) As Generic.List(Of BEPermiso)
        Dim ds As New DataSet
        Dim List As New Generic.List(Of BEPermiso)
        Dim Per As BEPermiso
        Dim NombreSp As String
        Dim ht As New Hashtable
        Try
            NombreSp = "pa_PerfilPermisos_Get"
            ht.Add("@IdPerfil", unIdPerfil)
            BD.GetData(NombreSp, ds, ht)
            If ds.Tables(0).Rows.Count > 0 Then
                'Cargo las propiedades de la entidad permiso con datos. Para luego obtener lista de permisos
                For Each row As DataRow In ds.Tables(0).Rows
                    Per = New BEPermiso
                    Per.IdPermiso = row("IdPermiso")
                    Per.NombrePermiso = row("NombrePermiso")
                    Per.LinkPermiso = row("LinkPermiso")
                    List.Add(Per)
                Next
            End If
        Catch ex As Exception
            'registrar en bitacora
        End Try
        Return List
    End Function
    Public Sub CargarUsuarioDataRow(ByVal Unusuario As BEUsuario, ByVal UnDataRow As DataRow)
        With Unusuario
            .IdUsuario = UnDataRow("IdUsuario")
            .Nombre = UnDataRow("Nombre")
            .Apellido = UnDataRow("Apellido")
            .IdPerfil = UnDataRow("IdPerfil")
        End With
    End Sub
    'Metodo para obtener guardar usuarios
    Public Function GuardarUsuario(ByVal unUsuario As BEUsuario) As Boolean
        Dim ht As New Hashtable
        Dim NombreSp As String
        Dim result As Boolean = True
        Dim ParamSalida As Integer
        'Calculo digito verificador
        Dim TexttoACalcular As String = ""
        Dim DaoDv As New DALDV
        Try

            ht.Add("@IdUsuario", unUsuario.IdUsuario)
            ht.Add("@Nombre", unUsuario.Nombre)
            ht.Add("@Apellido", unUsuario.Apellido)
            ht.Add("@Usuario", unUsuario.Usuario)
            ht.Add("@Password", unUsuario.Password)
            ht.Add("@IdPerfil", unUsuario.IdPerfil)
            ht.Add("@ParamSalidaId", 0)
            NombreSp = "pa_Usuarios_Save"
            result = BD.ExecStoredProcedure(NombreSp, ht, True, ParamSalida)
            If result Then
                If ParamSalida <> 0 Then
                    unUsuario.IdUsuario = ParamSalida
                    'Registrar en bitacora ingreso
                Else
                    'Regisrar en biacora modificacion
                End If
                TexttoACalcular = DaoDv.ConcatenarValoresPropiedades(unUsuario)
                DaoDv.AlmacenarDVH("Usuarios", "IdUsuario", unUsuario.IdUsuario, DaoDv.CalcularDVH(TexttoACalcular))
                DaoDv.AlmacenarDVV("Usuarios")
            End If
        Catch ex As Exception
            result = False
            Throw ex
        End Try
        Return result
    End Function
    'Metodo para obtener Eliminar  usuarios
    Public Function EliminarUsuario(ByVal IdUsuario As Integer, ByVal IdPerfil As Integer) As Boolean
        Dim ht As New Hashtable
        Dim NombreSp As String
        Dim result As Boolean = True
        'Calculo digito verificador
        Dim TexttoACalcular As String = ""
        Dim DaoDv As New DALDV
        Try

            ht.Add("@IdUsuario", IdUsuario)
            ht.Add("@IdPerfil", IdPerfil)
            NombreSp = "pa_Usuarios_Save"
            result = BD.ExecStoredProcedure(NombreSp, ht)
            If result Then
                DaoDv.AlmacenarDVV("Usuarios")
                DaoDv.AlmacenarDVV("PerfilPermisos")
            End If
        Catch ex As Exception
            result = False
            Throw ex
        End Try
        Return result
    End Function
End Class
