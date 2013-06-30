<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="BackupRestore.aspx.vb" Inherits="PresentacionWeb.BackupRestore" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Backup / Restore
    </h2>
    <p>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="BackUpRestoreValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="BackUpRestoreValidationGroup" />    
    </p>
    <p>
    <asp:GridView ID="dgBackUps" runat="server" AutoGenerateColumns="False" 
    PageSize="15" Width="700px"
    CssClass="table table-striped table-bordered table-condensed" CellPadding="4" 
            ForeColor="#333333" GridLines="None" EmptyDataText="No hay backups realizados"
             OnRowCommand="dgBackUps_RowCommand">
        <AlternatingRowStyle BackColor="White" />
    <Columns> 
    <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
    <asp:BoundField DataField="Usuario" HeaderText="Usuario" />
    <asp:BoundField DataField="Ruta" HeaderText="Ruta" />
	<asp:TemplateField HeaderText=" ">
		<ItemTemplate>			
			<asp:LinkButton runat="server" ID="btnRestoreRow" Text="Restaurar" CommandName="Restore" CommandArgument='<%# Eval("Ruta") %>' style="font-size:12px;"></asp:LinkButton>
		</ItemTemplate>
	</asp:TemplateField>
    </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    </p>
    <p>
    <asp:Button ID="btnBackUp" runat="server" Text="Realizar BackUp" />
    </p>

    <h2>
        Restore
    </h2>

    <p>
    <asp:GridView ID="dgRestores" runat="server" AutoGenerateColumns="False" 
    PageSize="15" Width="700px"
    CssClass="table table-striped table-bordered table-condensed" CellPadding="4" 
            ForeColor="#333333" GridLines="None" EmptyDataText="No hay restores realizados">
        <AlternatingRowStyle BackColor="White" />
    <Columns> 
    <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
    <asp:BoundField DataField="Usuario" HeaderText="Usuario" />
    <asp:BoundField DataField="Ruta" HeaderText="Ruta" />
    </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    </p>
</asp:Content>
