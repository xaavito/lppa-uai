<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="BackupRestore.aspx.vb" Inherits="PresentacionWeb.BackupRestore" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Backup / Restore
    </h2>
    <p>
    <asp:Button ID="btnBackUp" runat="server" Text="Realizar BackUp" />
    </p>
    <p>
    <asp:Button ID="btnRestore" runat="server" Text="Realizar Restore" />
    </p>
</asp:Content>
