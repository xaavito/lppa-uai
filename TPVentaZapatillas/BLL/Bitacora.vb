Public Class Bitacora
    Public Shared Function setBitacora(ByVal usr As BE.BEUsuario,
                                       ByVal mensaje As String,
                                       ByVal codigo As Integer) As Boolean

        DAL.DALBitacora.agregarBitacora(usr,
                                        mensaje,
                                        codigo)
        Return True
    End Function

    Public Shared Function getBitacoras() As List(Of BE.BEBitacora)

        Return DAL.DALBitacora.GetBitacoras

    End Function
End Class
