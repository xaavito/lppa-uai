Public Class DALBitacora
    Shared Function agregarBitacora(ByVal usr As BE.BEUsuario, ByVal mensaje As String, ByVal codigo As Integer) As String
        Dim ht As New Hashtable
        Dim NombreSp As String
        Dim result As Boolean = True
        Dim ParamSalida As Integer
        'Calculo digito verificador
        Dim TexttoACalcular As String = ""
        Dim DaoDv As New DALDV
        Dim bit As New BE.BEBitacora
        Try
            If usr Is Nothing Then
                ht.Add("@IdUsuario", Nothing)
                bit.idUsr = 0
            Else
                ht.Add("@IdUsuario", usr.IdUsuario)
                bit.idUsr = usr.IdUsuario
                'bit.usr = usr.Nombre + " " + usr.Apellido
            End If
            bit.fecha = DateTime.Now.Date
            ht.Add("@Fecha", bit.fecha)
            ht.Add("@Mensaje", mensaje)
            bit.evento = mensaje
            ht.Add("@ParamSalidaId", 0)
            NombreSp = "pa_Bitacora_Save"
            result = BD.ExecStoredProcedure(NombreSp, ht, True, ParamSalida)
            If result Then
                If ParamSalida <> 0 Then
                    bit.id = ParamSalida
                Else
                End If
                TexttoACalcular = bit.id.ToString + bit.idUsr.ToString + bit.evento + bit.fecha.ToString("MM/dd/yyyy hh:mm:ss")
                DaoDv.AlmacenarDVH("Bitacora", "PK_bcraID", bit.id, DaoDv.CalcularDVH(TexttoACalcular))
                DaoDv.AlmacenarDVV("Bitacora")
            End If
        Catch ex As Exception
            result = False
            Throw ex
        End Try
        Return result
    End Function

    Public Shared Function GetBitacoras() As Generic.List(Of BE.BEBitacora)
        Dim ds As New DataSet
        Dim List As New Generic.List(Of BE.BEBitacora)
        Dim Per As BE.BEBitacora
        Dim NombreSp As String
        Dim ht As New Hashtable
        Try
            NombreSp = "pa_Bitacora_Get"
            BD.GetData(NombreSp, ds, ht)
            If ds.Tables(0).Rows.Count > 0 Then
                'Cargo las propiedades de la entidad permiso con datos. Para luego obtener lista de permisos
                For Each row As DataRow In ds.Tables(0).Rows
                    Per = New BE.BEBitacora
                    Per.id = row("PK_bcraID")
                    If Not IsDBNull(row("usuario")) Then
                        Per.usr = row("usuario")
                    Else
                        Per.usr = "----"
                    End If
                    Per.evento = row("bcoraDescripcion")
                    Per.fecha = row("bcoraFecha")
                    List.Add(Per)
                Next
            End If
        Catch ex As Exception
            'registrar en bitacora
        End Try
        Return List
    End Function
End Class
