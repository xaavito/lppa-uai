<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="BackupRestored.aspx.vb" Inherits="BackupRestored" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="cndBackupRestored" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divAsignarPermisos">
        <div style="text-align: center">
            <asp:Label ID="LblBackup" runat="server" Text="Backups" CssClass="arial12verdebold"></asp:Label>
        </div>
        <div>
            <div style="width: 30%; margin-left: 12px; margin-top: 2px; float: left">
                <asp:GridView ID="grdBackups" runat="server" CellPadding="0" CellSpacing="0" BorderColor="Black"
                    BorderStyle="Solid" AutoGenerateColumns="false" Width="100%" UseAccessibleHeader="true"
                    Style="cursor: pointer" OnRowDataBound="grdBackups_RowDataBound">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="3%" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px"
                            ItemStyle-BorderColor="#000000" HeaderText="Descripcion">
                            <ItemTemplate>
                               <asp:Label ID="lblDescripcion" runat="server" Text="Algo"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="3%" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px"
                            ItemStyle-BorderColor="#000000" HeaderText="Fecha" HeaderStyle-Width="33%">
                            <ItemTemplate>
                                <asp:Label ID="LblFecha" runat="server" Text="Algo"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="3%" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px"
                            ItemStyle-BorderColor="#000000" HeaderText="Usuario" HeaderStyle-Width="45%">
                            <ItemTemplate>
                                <asp:Label ID="LblUsuario" runat="server" Text="Algo"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div style="margin-left: 20px;">
            <asp:FileUpload ID="FileBackup" runat="server" Width="398px" size="50" />
            <asp:Button ID="btnRealizarBackup" style="margin-left:22px"  runat="server" Text="Realizar Backup"/>
        </div>
        <br />
         <div style="text-align: center">
            <asp:Label ID="LblRestored" runat="server" Text="Restored" CssClass="arial12verdebold"></asp:Label>
        </div>
        <br />
        <div style="margin-left: 20px;">
            <asp:FileUpload ID="FileRestored" runat="server" Width="398px" size="50" />
              <asp:Button ID="BtnRestored" style="margin-left:22px"  runat="server" Text="Restaurar Restored"/>
        </div>
    </div>
</asp:Content>
