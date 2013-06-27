Imports Negocio
Imports DataLayer
Imports Excepciones

Public Class GesUsuarios

    Public Shared Function Obtener(nick As String) As Usuario
        Return Obtener(nick, False)
    End Function
    Public Shared Function Obtener(nick As String, simplex As Boolean) As Usuario

        Dim u As New Usuario()
        Try
            Dim repository As IRepository = RepositoryFactory.Create()
            repository.Nombre = "USUARIOS_SP"
            repository.AddParameter("@ACCION", "byNICK")
            repository.AddParameter("@ID", Nothing)
            repository.AddParameter("@NICK", nick)
            Dim dtUser As DataTable = repository.ExecuteDataTable()

            If dtUser.Rows.Count = 1 Then
                For Each dr As DataRow In dtUser.Rows
                    u.OID = Convert.ToInt32(dr.Item("usuID"))
                    u.Persistencia = EstadoPersistencia.UPDATE
                    u.Nombre = dr.Item("usuNOMBRE").ToString()
                    u.Apellido = dr.Item("usuAPELLIDO").ToString()
                    u.Nick = dr.Item("usuNICK").ToString()
                    u.Clave = dr.Item("usuCLAVE").ToString()
                    u.Email = dr.Item("usuEMAIL").ToString()

                    If Not simplex Then
                        GesPerfiles.Asignar(u, GesPerfiles.Obtener(u))
                    End If

                Next
            Else
                Throw New UserNotFoundException()
            End If
        Catch ex As Exception
            Throw New UserNotFoundException()
        End Try

        Return u

    End Function

    Public Shared Sub Guardar(user As Usuario)

        Try
            Dim repository As IRepository = RepositoryFactory.CreateTransactional()
            repository.Nombre = "USUARIOS_PROC"
            repository.AddParameter("@ACCION", user.Persistencia)
            repository.AddParameter("@ID", user.OID)
            repository.AddParameter("@NOMBRE", user.Nombre)
            repository.AddParameter("@APELLIDO", user.Apellido)
            repository.AddParameter("@EMAIL", user.Email)
            repository.AddParameter("@NICK", user.Nick)
            repository.AddParameter("@CLAVE", user.Clave)
            repository.AddParameter("@IDPERFIL", user.Perfil.OID)
            repository.ExecuteNonQuery()
            repository.Commit()
        Catch ex As Exception
            Throw New UsuarioSaveException()
        End Try
        GesBitacoras.Guardar(user.Persistencia, "ModUsuario", New String() {"Usuario", user.Nick})

    End Sub

    Public Shared Sub Eliminar(user As Usuario)
        user.Persistencia = EstadoPersistencia.DELETE
        Guardar(user)
    End Sub

    Public Shared Sub CambiarClave(user As Usuario, oldclave As String, newClave As String)

    End Sub

    Public Shared Sub Bloquear(user As Usuario)

    End Sub

    Public Shared Sub Desbloquear(user As Usuario)

    End Sub

    Public Shared Function Consultar(nick As String, nombre As String, apellido As String, simplex As Boolean) As List(Of Usuario)

        If String.IsNullOrWhiteSpace(nick) Then
            nick = Nothing
        End If
        If String.IsNullOrWhiteSpace(nombre) Then
            nombre = Nothing
        End If
        If String.IsNullOrWhiteSpace(apellido) Then
            apellido = Nothing
        End If

        Dim usuarios As New List(Of Usuario)
        Try
            Dim repository As IRepository = RepositoryFactory.Create()
            repository.Nombre = "USUARIOS_SP"
            repository.AddParameter("@ACCION", "byNICK")
            repository.AddParameter("@ID", Nothing)
            repository.AddParameter("@NICK", nick)
            Dim dtUsuario As DataTable = repository.ExecuteDataTable()

            For Each dr As DataRow In dtUsuario.Rows
                Dim u As New Usuario()
                u.OID = Convert.ToInt32(dr.Item("usuID"))
                u.Persistencia = EstadoPersistencia.UPDATE
                u.Nombre = dr.Item("usuNOMBRE").ToString()
                u.Apellido = dr.Item("usuAPELLIDO").ToString()
                u.Nick = dr.Item("usuNICK").ToString()
                u.Clave = dr.Item("usuCLAVE").ToString()
                u.Email = dr.Item("usuEMAIL").ToString()

                If Not simplex Then
                    GesPerfiles.Asignar(u, GesPerfiles.Obtener(u))
                End If
                usuarios.Add(u)
            Next
        Catch ex As Exception
            Throw New UserGetException()
        End Try

        Return usuarios

    End Function

    Public Shared Function Consultar(nick As String, dni As String, nombre As String, apellido As String) As List(Of Usuario)
        Return Consultar(nick, nombre, apellido, False)
    End Function
    Public Shared Function Consultar(nick As String, simplex As Boolean) As List(Of Usuario)
        Return Consultar(nick, Nothing, Nothing, simplex)
    End Function
    Public Shared Function Consultar(nick As String) As List(Of Usuario)
        Return Consultar(nick, Nothing, Nothing, False)
    End Function

    Public Shared Function Consultar() As List(Of Usuario)
        Return Consultar(Nothing, Nothing, Nothing, False)
    End Function

End Class

