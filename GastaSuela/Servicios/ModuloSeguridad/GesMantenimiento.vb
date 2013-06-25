Imports Negocio
Imports DataLayer

Public Class GesMantenimiento

    Public Shared Sub RealizarBackUp(path As String)
        Try
            Dim repo As IRepository = RepositoryFactory.Create()
            repo.BackUp(path)
        Catch ex As Exception
            Throw ex
        End Try

        GesBitacoras.Guardar(EstadoPersistencia.INSERT, "ModBackUp", New String() {"BackUp", path})

    End Sub

    Public Shared Function ConsutarBackUp() As Backup()
        'Cada Objeto EstadoPersistencia.UPDATE
        Dim b As Backup()
        Return b
    End Function


    Public Shared Sub RealizarRestore(path As String)
        Try
            Dim repo As IRepository = RepositoryFactory.Create()
            repo.Restore(path)
        Catch ex As Exception
            Throw ex
        End Try

        GesBitacoras.Guardar(EstadoPersistencia.INSERT, "ModRestore", New String() {"Restore", path})
    End Sub

    Public Shared Function ConsutarRestore() As Restore()
        'Cada Objeto EstadoPersistencia.UPDATE
        Dim r As Restore()
        Return r
    End Function

End Class
