Imports Negocio
Imports DataLayer
Imports Excepciones

Public Class GesPermisos

    Public Shared Sub CargarPermisos(ByRef perfil As Perfil)

        Try
            Dim modulos As New List(Of Modulo)

            Dim repo As IRepository = RepositoryFactory.Create()
            repo.Nombre = "PERMISOS_SP"
            repo.AddParameter("@ACCION", "GET")
            repo.AddParameter("@IDPERFIL", perfil.OID)
            Dim dt As DataTable = repo.ExecuteDataTable()
            repo = Nothing

            Dim drModulos As DataRow() = dt.Select("pmIDMODULOACCION IS NULL")

            For Each drMod As DataRow In drModulos

                Dim id As Integer = Convert.ToInt32(drMod.Item("modID"))
                Dim codigo As String = drMod.Item("modCODIGO").ToString()
                Dim nombre As String = drMod.Item("modNOMBRE").ToString()
                Dim permitido As Boolean = Convert.ToBoolean(drMod.Item("pmPERMITIDO"))

                Dim modu As New Modulo(codigo, nombre)
                modu.OID = id
                modu.Permitido = permitido
                modulos.Add(modu)

                Dim acciones As New List(Of ModuloAccion)

                Dim drAcciones As DataRow() = dt.Select(String.Format("pmIDMODULOACCION IS NOT NULL AND pmIDMODULO = {0}", id))
                For Each drAccion As DataRow In drAcciones
                    id = Convert.ToInt32(drAccion.Item("maID"))
                    nombre = drAccion.Item("maACCION").ToString()
                    permitido = Convert.ToBoolean(drAccion.Item("pmPERMITIDO"))

                    Dim acc As New ModuloAccion()
                    acc.OID = id
                    acc.Accion = nombre
                    acc.Permitido = permitido
                    acciones.Add(acc)

                Next
                modu.ModulosAccion = acciones

            Next
            perfil.Modulos = modulos
        Catch ex As Exception
            Throw New LoadPermissionsException()
        End Try


    End Sub

    Public Shared Function LoadPermisos(ByRef perfil As Perfil) As List(Of Modulo)
        Dim modulos As New List(Of Modulo)
        Try

            Dim repo As IRepository = RepositoryFactory.Create()
            repo.Nombre = "PERMISOS_SP"
            repo.AddParameter("@ACCION", "MOD")
            repo.AddParameter("@IDPERFIL", perfil.OID)
            Dim dt As DataTable = repo.ExecuteDataTable()
            repo = Nothing


            Dim drModulos As DataRow() = dt.Select("maIDMODULO IS NULL")

            For Each drMod As DataRow In drModulos

                Dim id As Integer = Convert.ToInt32(drMod.Item("modID"))
                Dim codigo As String = drMod.Item("modCODIGO").ToString()
                Dim nombre As String = drMod.Item("modNOMBRE").ToString()
                Dim permitido As Boolean = Convert.ToBoolean(drMod.Item("pmPERMITIDO"))

                Dim modu As New Modulo(codigo, nombre)
                modu.OID = id
                modu.Permitido = permitido
                modulos.Add(modu)

                Dim acciones As New List(Of ModuloAccion)

                Dim drAcciones As DataRow() = dt.Select(String.Format("maIDMODULO IS NOT NULL AND modID = {0}", id))
                For Each drAccion As DataRow In drAcciones
                    id = Convert.ToInt32(drAccion.Item("maID"))
                    nombre = drAccion.Item("maACCION").ToString()
                    permitido = Convert.ToBoolean(drAccion.Item("pmPERMITIDO"))

                    Dim acc As New ModuloAccion()
                    acc.OID = id
                    acc.Accion = nombre
                    acc.Permitido = permitido
                    acciones.Add(acc)

                Next
                modu.ModulosAccion = acciones
            Next            
        Catch ex As Exception
            Throw New PermisoGetException()
        End Try
        Return modulos

    End Function

    Public Shared Sub Guardar(perfil As Perfil, modulos As List(Of Modulo))


        Try
            Dim repo As IRepository = RepositoryFactory.CreateTransactional()
            For Each modu As Modulo In modulos
                repo.Nombre = "PERMISOS_SP"
                repo.AddParameter("@ACCION", "1")
                repo.AddParameter("@IDPERFIL", perfil.OID)
                repo.AddParameter("@IDMODULO", modu.OID)
                repo.AddParameter("@IDMODULOACCION", Nothing)
                repo.AddParameter("@PERMITIDO", modu.Permitido)
                repo.ExecuteNonQuery()

                For Each acc As ModuloAccion In modu.ModulosAccion
                    repo.Nombre = "PERMISOS_SP"
                    repo.AddParameter("@ACCION", "1")
                    repo.AddParameter("@IDPERFIL", perfil.OID)
                    repo.AddParameter("@IDMODULO", modu.OID)
                    repo.AddParameter("@IDMODULOACCION", acc.OID)
                    repo.AddParameter("@PERMITIDO", acc.Permitido)
                    repo.ExecuteNonQuery()
                Next
            Next
            repo.Commit()
        Catch ex As Exception
            Throw New PermisoSaveException()
        End Try
    End Sub
End Class
