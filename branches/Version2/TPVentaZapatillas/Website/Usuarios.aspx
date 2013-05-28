<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="Usuarios.aspx.vb" Inherits="Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="Scripts/Usuario.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divDatosUsuario" style="border-color: Red">
        <div style="width: 85%; float: left; padding: 2em 0 0 0">
            <div class="divLabel">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="arial12verdebold"></asp:Label>
            </div>
            <div style="padding: 0 1em 1em 0; float: left">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="arial12negro" ReadOnly="false"
                    Width="200px"></asp:TextBox>
            </div>
        </div>
        <div style="width: 85%; float: left">
            <div class="divLabel">
                <asp:Label ID="lblApellido" runat="server" Text="Apellido" CssClass="arial12verdebold"></asp:Label>
            </div>
            <div style="padding: 0 1em 1em 0; float: left">
                <asp:TextBox ID="txtApellido" runat="server" CssClass="arial12negro" ReadOnly="false"
                    Width="200px"></asp:TextBox>
            </div>
        </div>
        <div style="width: 85%; float: left">
            <div class="divLabel">
                <asp:Label ID="LblUsuario" runat="server" Text="Usuario" CssClass="arial12verdebold"></asp:Label>
            </div>
            <div style="padding: 0 1em 1em 0; float: left">
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="arial12negro" ReadOnly="false"
                    Width="132px"></asp:TextBox>
            </div>
        </div>
        <div style="width: 85%; float: left">
            <div class="divLabel">
                <asp:Label ID="LblPassword" runat="server" Text="Password" CssClass="arial12verdebold"></asp:Label>
            </div>
            <div style="padding: 0 1em 1em 0; float: left">
                <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password" Width="147px"></asp:TextBox>
            </div>
        </div>
        <div style="width: 85%; float: left">
            <div class="divLabel">
                <asp:Label ID="LblPerfil" runat="server" Text="Perfil" CssClass="arial12verdebold"></asp:Label>
            </div>
            <div style="padding: 0 1em 1em 0; float: left">
                <asp:DropDownList ID="ddlFamilia" Style="width: 160px;" runat="server">
                    <asp:ListItem Text="Administrador" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Operador" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Invitado" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div style="width: 85%; float: left">
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="BtGuardar" runat="server" OnClientClick="return ValidarUsuario();" OnClick="btnGuardar_Click" Text="Guardar" />
                </td>
                <td>
                    <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" />
                </td>
            </tr>
        </table>
        <br />
        <%--<div style="padding: 0 1em 1em 0; float: left; height: 11px; width: 55px;">
            <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" />
        </div>--%>
        <asp:GridView ID="grdUsuarios" CssClass="pagination sorter tableFilter" runat="server"
            CellPadding="0" CellSpacing="0" BorderColor="Black" BorderStyle="Solid" AutoGenerateColumns="false"
            Width="100%" UseAccessibleHeader="true" Style="cursor: pointer">
            <HeaderStyle CssClass="tablesorter" />
            <Columns>
               <%-- <asp:TemplateField ItemStyle-Width="3%" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px"
                    ItemStyle-BorderColor="#000000">
                    <ItemTemplate>
                        <asp:CheckBox ID="ChkSeleccionado" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" HeaderStyle-Width="33%"
                    ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="#000000" ControlStyle-BorderStyle="Solid"
                    ItemStyle-BorderWidth="1px" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" HeaderStyle-Width="33%" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-CssClass="arial12negro" ItemStyle-BorderColor="#000000" ControlStyle-BorderStyle="Solid"
                    ItemStyle-BorderWidth="1px" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
