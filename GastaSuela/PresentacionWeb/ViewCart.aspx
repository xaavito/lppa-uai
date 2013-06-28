<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ViewCart.aspx.vb" Inherits="PresentacionWeb.ViewCart" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Carrito de Compras
    </h2>
    <p>
			<asp:GridView runat="server" ID="gvShoppingCart" AutoGenerateColumns="false" EmptyDataText="El carrito se encuentra vacio" GridLines="None" Width="700px" 
            CellPadding="5" ShowFooter="true" DataKeyNames="ProductId" OnRowDataBound="gvShoppingCart_RowDataBound" OnRowCommand="gvShoppingCart_RowCommand">
				<HeaderStyle HorizontalAlign="Left" BackColor="#3D7169" ForeColor="#FFFFFF" />
				<FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
				<AlternatingRowStyle BackColor="#F8F8F8" />
				<Columns>
					<asp:BoundField DataField="Descripcion" HeaderText="Nombre" />
					<asp:TemplateField HeaderText="Cantidad">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="txtCantidad" Columns="5" Text='<%# Eval("Cantidad") %>'></asp:TextBox><br />
							<asp:LinkButton runat="server" ID="btnRemove" Text="Quitar" CommandName="Remove" CommandArgument='<%# Eval("ProductId") %>' style="font-size:12px;"></asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:BoundField DataField="PrecioUnitario" HeaderText="Precio" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" DataFormatString="{0:$ 0.00}" />
					<asp:BoundField DataField="PrecioTotal" HeaderText="Total" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" DataFormatString="{0:$ 0.00}" />
				</Columns>
			</asp:GridView>
			<br />
			<asp:Button runat="server" ID="btnUpdateCart" Text="Actualizar Carrito" OnClick="btnUpdateCart_Click" />
    </p>
</asp:Content>