Imports Excepciones
Imports DataLayer

Public Class Seguridad

    Public Shared Function Login(username As String, clave As String) As Boolean
        Try
            Dim repository As IRepository = RepositoryFactory.Create()
            repository.Nombre = "LOGIN_PROC"
            repository.AddParameter("@USER", username)
            repository.AddParameter("@PASS", clave)
            Dim cant As Integer = Convert.ToInt32(repository.ExecuteScalar())
            If cant <> 1 Then
                Throw New UserNotFoundException()
            End If
        Catch ex As Exception
            Throw New UserNotFoundException()
        End Try

        Return True
    End Function

    Public Shared Function LogOut() As Boolean
        Return True
    End Function

    Public Shared Function Encriptar(texto As String, key As String) As String
        Return texto
    End Function

    Public Shared Function Desencriptar(texto As String, key As String) As String
        Return texto
    End Function

End Class
