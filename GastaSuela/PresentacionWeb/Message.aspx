<%@ Page Title="Mensaje" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Message.aspx.vb" Inherits="PresentacionWeb.Message" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <%=Server.HtmlEncode(Request.QueryString("title"))%>
    </h2>
    <p style="color:Red">
        <%=Server.HtmlEncode(Request.QueryString("text"))%>
    </p>


    
</asp:Content>
