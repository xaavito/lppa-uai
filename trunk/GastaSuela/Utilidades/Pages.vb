Public Class Pages

    Public Shared Function GetCurrentPageName() As String
        Dim sPath As String = System.Web.HttpContext.Current.Request.Url.AbsolutePath
        Dim sPage As System.IO.FileInfo = New System.IO.FileInfo(sPath)
        Return sPage.Name
    End Function

End Class
