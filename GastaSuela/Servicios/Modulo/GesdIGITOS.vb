Imports Negocio
Imports DataLayer
Imports Excepciones
Public Class GesDigitos

    'Recalcula los digitos verificadores
    Public Shared Sub Recalcular()
        Dim repository As IRepository = RepositoryFactory.Create()
        Try
            repository.Nombre = "DVH_UPDATE"
            repository.ExecuteNonQuery()
        Catch ex As Exception
            repository.Dispose()
        End Try
    End Sub

    Public Shared Function Verificar() As DataTable

        Try
            Dim repository As IRepository = RepositoryFactory.Create()
            repository.Nombre = "VERIFICA_DIGITOS"

            Return repository.ExecuteDataTable()

        Catch ex As Exception
            Throw New DigitoVerificadorGetException()
        End Try

    End Function

End Class
