<%@ Application Language="VB" %>
<%@ Import Namespace="System.Security.Principal" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
    
    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        
        Dim authCookie As HttpCookie = Context.Request.Cookies(FormsAuthentication.FormsCookieName)
        If Not authCookie Is Nothing Then
            Dim authTicket As FormsAuthenticationTicket = FormsAuthentication.Decrypt(authCookie.Value)
            Dim roles As String() = authTicket.UserData.Split(New Char() {","})
            Dim userPrincipal As GenericPrincipal = New GenericPrincipal(New GenericIdentity(authTicket.Name), roles)
            Context.User = userPrincipal
        End If
      
    End Sub
       
</script>