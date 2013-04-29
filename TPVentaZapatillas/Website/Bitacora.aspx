<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Bitacora.aspx.vb" Inherits="Bitacora" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="cndBitacora" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <br />
        <br />
        <asp:GridView runat="server" ID="gvBitacora" AutoGenerateColumns="false" GridLines="None"
            Width="100%" CellPadding="4" ShowFooter="true"  OnRowDataBound="gvBitacora_RowDataBound">
            <HeaderStyle HorizontalAlign="Left" BackColor="#3D7169" ForeColor="#FFFFFF" />
            <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
            <AlternatingRowStyle BackColor="#F8F8F8" />
            <Columns>
                <asp:TemplateField HeaderText="Evento">
                    <ItemTemplate>
                          <asp:Label ID="LblEvento" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha">
                    <ItemTemplate>
                         <asp:Label ID="LblFecha" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Usuario">
                    <ItemTemplate>
                          <asp:Label ID="LblUsuario" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
    </div>
</asp:Content>

