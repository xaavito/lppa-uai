Imports Negocio
Imports DataLayer
Imports Excepciones

Public Class GesPerfiles

    Public Shared Function Obtener(user As Usuario) As Perfil
        Dim p As New Perfil()
        Try
            Dim repository As IRepository = RepositoryFactory.Create()
            repository.Nombre = "PERFILES_PROC"
            repository.AddParameter("@ACCION", "byUSER")
            repository.AddParameter("@ID", Nothing)
            repository.AddParameter("@NOMBRE", user.Nick)
            Dim dtPerfil As DataTable = repository.ExecuteDataTable()

            For Each dr As DataRow In dtPerfil.Rows
                p.Persistencia = EstadoPersistencia.UPDATE
                p.OID = Convert.ToInt32(dr.Item("perID"))
                p.Nombre = dr.Item("perNOMBRE").ToString()
            Next

        Catch ex As Exception
            Throw New PefilGetException()
        End Try

        Return p

    End Function

    Public Shared Sub Asignar(user As Usuario, perfil As Perfil)
        user.Perfil = perfil
    End Sub

    Public Shared Sub Guardar(perfil As Perfil)
        Try

            Dim repository As IRepository = RepositoryFactory.CreateTransactional()
            repository.Nombre = "PERFILES_PROC"
            repository.AddParameter("@ACCION", perfil.Persistencia)
            repository.AddParameter("@ID", perfil.OID)
            repository.AddParameter("@NOMBRE", perfil.Nombre)
            repository.ExecuteNonQuery()
            repository.Commit()
        Catch ex As Exception
            Throw New PerfilSaveException()
        End Try
        GesBitacoras.Guardar(perfil.Persistencia, "ModPerfil", New String() {"Perfil", perfil.Nombre})
    End Sub

    Public Shared Sub Eliminar(perfil As Perfil)
        perfil.Persistencia = EstadoPersistencia.DELETE
        Guardar(perfil)
    End Sub

    Public Shared Sub GuardarPermiso(perfil As Perfil, permiso As Permiso)

    End Sub

    Public Shared Sub QuitarPermiso(perfil As Perfil, permiso As Permiso)

    End Sub


    Public Shared Function Consultar(nombre As String) As List(Of Perfil)

        Dim perfiles As New List(Of Perfil)
        Try
            Dim repository As IRepository = RepositoryFactory.Create()
            repository.Nombre = "PERFILES_PROC"
            repository.AddParameter("@ACCION", "4")
            repository.AddParameter("@ID", Nothing)
            repository.AddParameter("@NOMBRE", nombre)
            Dim dtPerfil As DataTable = repository.ExecuteDataTable()

            For Each dr As DataRow In dtPerfil.Rows
                Dim p As New Perfil()
                p.Persistencia = EstadoPersistencia.UPDATE
                p.OID = Convert.ToInt32(dr.Item("perID"))
                p.Nombre = dr.Item("perNOMBRE").ToString()
                perfiles.Add(p)
            Next

        Catch ex As Exception
            Throw New PefilGetException()
        End Try

        Return perfiles

    End Function

    Public Shared Sub CargarPermisos(perfil As Perfil)
        Servicios.GesPermisos.CargarPermisos(perfil)
    End Sub



End Class
