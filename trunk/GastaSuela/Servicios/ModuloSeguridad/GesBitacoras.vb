Imports Negocio
Imports DataLayer
Imports Excepciones
Public Class GesBitacoras

    Public Shared Sub Guardar(bitacora As Bitacora)
        Dim repository As IRepository = RepositoryFactory.Create()
        Try
            repository.Nombre = "BITACORAS_PROC"
            repository.AddParameter("@ACCION", bitacora.Persistencia)
            repository.AddParameter("@ID", bitacora.OID)
            repository.AddParameter("@IDUSUARIO", bitacora.Usuario.OID)
            repository.AddParameter("@MODULO", bitacora.Modulo)
            repository.AddParameter("@DESCRIPCION", bitacora.Descripcion)
            repository.AddParameter("@ARGUMENTOS", String.Join(";", bitacora.Argumentos))
            repository.ExecuteNonQuery()
        Catch ex As Exception
            repository.Dispose()
        End Try
    End Sub

    Public Shared Sub Guardar(modulo As String, descripcion As String, argumentos As String())
        Dim bit As New Bitacora()
        bit.Usuario = Current.Usuario
        bit.Modulo = modulo
        bit.Descripcion = descripcion
        bit.Argumentos = argumentos
        Guardar(bit)
    End Sub

    Public Shared Sub Guardar(estado As EstadoPersistencia, modulo As String, arg As String())
        Dim desc As String = ""
        Dim argumentos As String()
        argumentos = arg
        If estado = EstadoPersistencia.DELETE Then
            desc = "Se eliminó {0} {1}."
        ElseIf estado = EstadoPersistencia.UPDATE Then
            desc = "Se modificó {0} {1}."
        ElseIf estado = EstadoPersistencia.INSERT Then
            desc = "Se generó  {0} {1}."
        End If
        Guardar(modulo, desc, argumentos)
    End Sub

    Public Shared Function Consultar() As List(Of Bitacora)

        Dim bitacoras As New List(Of Bitacora)
        Try
            Dim repository As IRepository = RepositoryFactory.Create()
            repository.Nombre = "BITACORAS_PROC"
            repository.AddParameter("@ACCION", "4")

            Dim dtBitacora As DataTable = repository.ExecuteDataTable()

            For Each dr As DataRow In dtBitacora.Rows
                Dim b As New Bitacora()
                b.Persistencia = EstadoPersistencia.UPDATE
                b.OID = Convert.ToInt32(dr.Item("bitID"))
                b.Fecha = Convert.ToDateTime(dr.Item("bitFECHA"))
                b.Modulo = dr.Item("bitMODULO").ToString()
                b.Descripcion = dr.Item("bitDESCRIPCION").ToString()
                b.Argumentos = dr.Item("bitARGUMENTOS").ToString().Split(";")
                Try
                    b.Descripcion = String.Format(b.Descripcion.ToString(), b.Argumentos)
                Catch ex As Exception

                End Try

                Dim usu As New Usuario()
                usu.Nick = dr.Item("usuNICK").ToString()
                usu.Apellido = dr.Item("usuAPELLIDO").ToString()
                usu.Nombre = dr.Item("usuNOMBRE").ToString()
                b.Usuario = usu

                bitacoras.Add(b)
            Next

        Catch ex As Exception
            Throw New BitacoraGetException()
        End Try

        Return bitacoras

    End Function

End Class
