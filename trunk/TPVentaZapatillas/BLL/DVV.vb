Imports DAL
Imports System.ComponentModel
Public Class DVV
#Region "Metodos"
    ' Calcula el digito verificador por cadena de atributos
    Public Shared Function CalcularDVH(ByVal stringObject As String) As Integer
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
    Public Shared Function VerificarDigitos(ByVal tabla As DataTable, ByVal totaldvv As Integer, ByVal totalDvh As Integer) As Boolean
        Dim valido As Boolean = False
        valido = VerificarDigitoVerificadorHorizontales(tabla) 'valido reegistro por registro'
        If valido Then
            valido = VerificarDigitoVerificadorVertical(totaldvv, totalDvh) ' valido el total sumarizado de registros por el total de tabla auxiliar'
        End If
        Return valido
    End Function
    Public Shared Function VerificarDigitoVerificadorHorizontales(ByVal tabla As DataTable) As Boolean
        Dim valido As Boolean = True
        Dim CadenaDB As String
        For Each row As DataRow In tabla.Rows
            CadenaDB = ConcatenarValoresPropiedades(row) 'por cada registro se vuelve a calcular el DVH'
            If Not IsDBNull(row("DVH")) Then
                If Not VerificarDigitoVerificadorHorizontal(CadenaDB, row("DVH")) Then 'si es distinto digito quiere decir que se corrompio un registro'
                    valido = False
                    Exit For
                End If
            End If
        Next
        Return valido
    End Function
    Public Shared Function VerificarDigitoVerificadorVertical(ByVal totaldvv As Integer, ByVal totalDvh As Integer) As Boolean
        Dim valido As Boolean
        valido = (totaldvv = totalDvh) 'si son distinto los totales quiere decir que se corrompio la tabla'
        Return valido
    End Function
    Public Shared Function VerificarDigitoVerificadorHorizontal(ByVal StrCadena As String, ByVal UnDVH As Integer) As Boolean
        Dim valido As Boolean
        If CalcularDVH(StrCadena) = UnDVH Then
            valido = True
        Else
            valido = False
        End If
        Return valido
    End Function
    'Metodo para concatener las propiedades de un datarow
    Public Shared Function ConcatenarValoresPropiedades(ByVal unDatarow As DataRow) As String
        Dim result As String = ""
        Dim Stritem As String = ""
        For i = 0 To unDatarow.ItemArray.Count - 2
            Stritem = unDatarow.ItemArray(i).ToString
            If TypeOf (unDatarow.ItemArray(i)) Is DateTime Then
                Stritem = CType(unDatarow.ItemArray(i), DateTime).ToString("MM/dd/yyyy hh:mm:ss")
            End If
            result = result + Stritem
        Next
        Return result
    End Function
    Public Shared Function VerificarIntegridadDatos(ByRef NombreTabla As String) As Boolean
        Dim valido As Boolean = True
        Dim Dt As New DataTable
        Dim Ds As New DataSet
        Dim totaldvh As Integer
        Dim ht As New Hashtable
        Dim NombreSp As String
        Dim i As Integer = 0
        Dim DalDvv As New DALDV
        Try
            NombreSp = "pa_Dv_GetTables"
            BD.GetData(NombreSp, Ds, ht)
            'CantRecords = Ds.Tables(0).Rows.Count - 1
            'recorro tabla auxiliar de verificacion y por cada una de ellas calculo digitos verificadores
            For Each row As DataRow In Ds.Tables(0).Rows
                Dt = DalDvv.LeerRegistros(row("NombreTabla")) 'leo todos los registros de cada una de las tablas'
                totaldvh = DalDvv.SumarizarDVH(row("NombreTabla")) ''totaliza los digitos verificadores en tabla
                valido = VerificarDigitos(Dt, row("DVV"), totaldvh) 'calculo digitos verificadores
                If Not valido Then
                    NombreTabla = row("NombreTabla")
                    Exit For
                End If
                NombreTabla = row("NombreTabla")
                ' UnHiloBackground.ReportProgress(i)
                i += 1
                'System.Threading.Thread.Sleep(300)
            Next
        Catch ex As Exception
            'registrar en bitacora
        End Try
        Return valido
    End Function


#End Region
End Class
