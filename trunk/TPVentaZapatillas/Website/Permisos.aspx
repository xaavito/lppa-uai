<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="Permisos.aspx.vb" Inherits="Permisos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="cndPermisos" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divAsignarPermisos">
        <div style="margin-right: 11px; margin-top: 20px; float: left">
            <asp:Label ID="lblUsuarios" runat="server" Text="Familia:" CssClass="arial12verdebold"></asp:Label>
        </div>
        <div style="float:left;margin-top: 20px;margin-left:2px;" >
            &nbsp;
            <asp:DropDownList ID="ddFamilia" style="width:160px;" runat="server">
                  <asp:ListItem Text="Administradores" Value="1"></asp:ListItem>
                  <asp:ListItem Text="Usuarios" Value="2"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <br />
        <br />
        <div>
            <div style="margin-left: 2px; float: left">
                <asp:Label ID="lblPermisos" runat="server" Text="Permisos:" CssClass="arial12verdebold"></asp:Label>
            </div>
            <div style="width: 30%; margin-left:12px; margin-top:2px; float: left">
                <asp:GridView ID="grdPermisos" runat="server" CellPadding="0" CellSpacing="0" BorderColor="Black"
                    BorderStyle="Solid" AutoGenerateColumns="false" Width="100%" UseAccessibleHeader="true"
                    Style="cursor: pointer" OnRowDataBound="grdPermisos_RowDataBound">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="3%" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px"
                            ItemStyle-BorderColor="#000000">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkPermiso" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="3%" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px"
                            ItemStyle-BorderColor="#000000" HeaderText="Descripcion" HeaderStyle-Width="33%">
                            <ItemTemplate>
                                <asp:Label ID="lblDescripcion" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div class="button" style="float: right; padding: 0.5em 0 0 0; font-size: 11px">
                    <asp:Button ID="btnAsignar" runat="server" Text="Asignar" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
