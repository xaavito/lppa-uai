Imports System.Data.SqlClient
Imports System.Configuration
Public Class BD
#Region "Attributes"
    Shared mcon As SqlConnection
    Public Shared mTr As SqlTransaction
#End Region
#Region "Stored Procedures"
    Shared StrConnection As String = System.Configuration.ConfigurationManager.AppSettings("connectionString")
    Public Shared Function GetData(ByVal unNombreSp As String, ByVal unDS As DataSet, ByVal UnHashTable As Hashtable) As Boolean
        Dim result As Boolean = True
        If (mTr Is Nothing) Then
            mcon = New SqlConnection(StrConnection)
        End If

        If mcon.State <> ConnectionState.Open Then
            mcon.Open()
        End If
        Try
            Dim MCommand As New SqlCommand(unNombreSp, mcon)
            MCommand.CommandType = CommandType.StoredProcedure
            MCommand.CommandText = unNombreSp
            If (Not mTr Is Nothing) Then 'Pregunto si estoy en una transaccion
                MCommand.Transaction = mTr
            End If
            For Each param In UnHashTable
                MCommand.Parameters.AddWithValue(param.Key, param.Value)
            Next

            Dim UnDa As New SqlDataAdapter()
            UnDa.SelectCommand = MCommand
            UnDa.Fill(unDS)
        Catch ex As Exception
            result = False
            Throw ex
        Finally
            If mcon.State <> ConnectionState.Closed Then
                If (mTr Is Nothing) Then 'Pregunto si estoy en una transaccion
                    mcon.Close()
                End If
            End If
        End Try
        Return result
    End Function
    Public Shared Function ExecStoredProcedure(ByVal unNombreSp As String, ByVal UnHashTable As Hashtable, Optional ByVal UsaParmSalida As Boolean = False, Optional ByRef ParamSalida As Integer = 0) As Boolean
        Dim result As Boolean = True

        If (mTr Is Nothing) Then
            mcon = New SqlConnection(StrConnection)
        End If

        If mcon.State <> ConnectionState.Open Then
            mcon.Open()
        End If

        Try
            Dim Mcommand As New SqlCommand(unNombreSp, mcon)
            Mcommand.CommandType = CommandType.StoredProcedure
            Mcommand.CommandText = unNombreSp
            If (Not mTr Is Nothing) Then 'Pregunto si estoy en una transaccion
                Mcommand.Transaction = mTr
            End If


            SqlCommandBuilder.DeriveParameters(Mcommand)

            For Each param In UnHashTable
                Mcommand.Parameters(param.key).value = param.value
            Next

            Mcommand.ExecuteNonQuery()

            If UsaParmSalida Then
                Mcommand.Parameters("@ParamSalidaId").Direction = ParameterDirection.Output
                ParamSalida = Mcommand.Parameters("@ParamSalidaId").Value
            End If

        Catch ex As Exception
            result = False
            Throw ex
        Finally
            If mcon.State <> ConnectionState.Closed Then
                If (mTr Is Nothing) Then 'Pregunto si estoy en una transaccion
                    mcon.Close()
                End If
            End If
        End Try
        Return result
    End Function
#End Region
#Region "Manejo de Trasacciones"
    Public Shared Sub IniciarTransaccion()
        mcon = New SqlConnection(StrConnection)
        If mcon.State <> ConnectionState.Open Then
            mcon.Open()
        End If
        If (mTr Is Nothing) Then
            mTr = mcon.BeginTransaction(IsolationLevel.Serializable)
        End If
    End Sub
    Public Shared Sub ConfirmarTransaccion()
        If (Not mTr Is Nothing) Then
            mTr.Commit()
        End If
        mTr = Nothing
    End Sub
    Public Shared Sub DeshacerTrasaccion()
        If (Not mTr Is Nothing) Then
            mTr.Rollback()
        End If
        mTr = Nothing
    End Sub
    Public Shared Sub CerrarConexion()
        If mcon.State <> ConnectionState.Closed Then
            mcon.Close()
        End If
    End Sub
    Public Shared Function IntArrayToStr(ByVal unArray() As Integer) As String
        Dim i As Integer
        Dim result As String = ""
        If Len(unArray) < 0 Then
            result = "()"
        Else
            result = "("
            For i = 0 To Len(unArray)
                result += CStr(unArray(i)) + ","
            Next

            result = result + ")"

        End If
        Return result
    End Function
#End Region
End Class
