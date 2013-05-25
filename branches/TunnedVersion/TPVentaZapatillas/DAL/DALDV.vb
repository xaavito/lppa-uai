Public Class DALDV
#Region "Metodos"
    Public Function SumarizarDVH(ByVal Nombretabla As String) As Integer
        Dim TotalDVV As Integer = 0
        Dim ds As New DataSet
        Dim ht As New Hashtable
        Dim NombreSp As String
        Try
            NombreSp = "pa_Dv_TotalizarDVH"
            ht.Add("@NombreTabla", Nombretabla)
            BD.GetData(NombreSp, ds, ht)
        Catch ex As Exception
            'registrar en bitacora
        End Try
        TotalDVV = ds.Tables(0).Rows(0)(0)
        Return TotalDVV
    End Function
    Public Function CalcularDVH(ByVal stringObject As String) As Integer
        Dim multi As Integer
        Dim sumador As Long
        Dim result As Integer = 0
        'Se obtiene la longitud de la suma de atributos del objeto y se Suma "1"
        multi = stringObject.Length + 1
        For Each obj As Char In stringObject
            ' Por cada caracter se multiplica por el multiplicador calculado anteriormente y 
            'se va acumulando en un sumador
            sumador += multi * Convert.ToInt16(obj)
            multi = multi - 1
        Next
        ' Finalmente se multiplica el resultado por 10 y se saca resto de division por 11.
        result = (sumador * 10) Mod 11
        Return result
    End Function
    Public Function ConcatenarValoresPropiedades(ByVal Objecto As Object) As String
        Dim TextoACacular As String = ""
        Dim unDatetime As DateTime
        For Each pro In Objecto.GetType.GetProperties 'Como toda clase hereda de object obtenemos sus propiedades'
            If TypeOf (pro.GetValue(Objecto, Nothing)) Is DateTime Then
                unDatetime = pro.GetValue(Objecto, Nothing)
                TextoACacular += unDatetime.ToString("MM/dd/yyyy hh:mm:ss")
            Else
                TextoACacular += pro.GetValue(Objecto, Nothing).ToString 'obtenemos el valor de cada propiedad y lo convertimos a String para concatenar los valores'
            End If
        Next
        Return TextoACacular
    End Function
    Public Sub AlmacenarDVH(ByVal Nombretabla As String, ByVal NombreIdtabla As String, ByVal IdTabla As Integer, ByVal DVH As Integer)
        Dim result As Boolean = True
        Dim ht As New Hashtable
        Dim NombreSp As String
        Try
            NombreSp = "pa_Dv_ActualizarDVH"
            ht.Add("@NombreTabla", Nombretabla)
            ht.Add("@NombreIdTabla", NombreIdtabla)
            ht.Add("@IdTabla", IdTabla)
            ht.Add("@DVH", DVH)
            BD.ExecStoredProcedure(NombreSp, ht)
        Catch ex As Exception
            'registrar en bitacora
        End Try
    End Sub
    Public Sub AlmacenarDVV(ByVal Nombretabla As String)
        Dim TotalDVH As Integer = 0
        Dim result As Boolean = True
        Dim ht As New Hashtable
        Dim NombreSp As String
        Try

            TotalDVH = SumarizarDVH(Nombretabla)
            NombreSp = "pa_Dv_ActualizarDVV"
            ht.Add("@NombreTabla", Nombretabla)
            ht.Add("@DVV", TotalDVH)
            BD.ExecStoredProcedure(NombreSp, ht)
        Catch ex As Exception
        End Try
    End Sub
    Public Function LeerRegistros(ByVal Nombretabla As String) As DataTable
        Dim TotalDVV As Integer = 0
        Dim ds As New DataSet
        Dim ht As New Hashtable
        Dim NombreSp As String
        Dim dt As New DataTable
        Try
            NombreSp = "pa_Dv_Getrecords"
            ht.Add("@NombreTabla", Nombretabla)
            BD.GetData(NombreSp, ds, ht)
            If ds.Tables(0).Rows.Count > 0 Then
                dt = ds.Tables(0)
            End If
        Catch ex As Exception
            'registrar en bitacora
        End Try
        Return dt
    End Function
#End Region
End Class
