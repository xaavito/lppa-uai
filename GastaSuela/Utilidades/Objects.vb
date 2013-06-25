Public Class Objects

    ''' <summary>
    ''' Verifica si un objeto tiene un metodo
    ''' </summary>
    ''' <param name="objectToCheck"></param>
    ''' <param name="methodName"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function HasMethod(objectToCheck As Object, methodName As String) As Boolean
        Dim tipo As Type = objectToCheck.GetType()
        If Not tipo.GetMethod(methodName) Is Nothing Then
            Return True
        End If
        Return False
    End Function

End Class
