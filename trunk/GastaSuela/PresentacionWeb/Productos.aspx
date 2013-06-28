<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Productos.aspx.vb" Inherits="PresentacionWeb.Productos" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Productos
    </h2>
	<p>
        <asp:GridView runat="server" ID="gvShoppingCart" AutoGenerateColumns="false" GridLines="None"
            Width="100%" CellPadding="4" ShowFooter="true" OnRowDataBound="gvShoppingCart_RowDataBound">
            <HeaderStyle HorizontalAlign="Left" BackColor="#3D7169" ForeColor="#FFFFFF" />
            <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
            <AlternatingRowStyle BackColor="#F8F8F8" />
            <Columns>
                <asp:TemplateField HeaderText="Producto">
                    <ItemTemplate>
                        <asp:Image ID="ImgProducto" Style="max-width: 142px; max-height: 118px;" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descripcion">
                    <ItemTemplate>
                        <div style="margin-left: 27px;">
                            <asp:Label ID="LblDescription" runat="server" Text="Label"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad">
                    <ItemTemplate>
                        <div style="margin-left: 50px">
                            <asp:DropDownList ID="DDCantidad" Style="width: 60px" runat="server">
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Precio">
                    <ItemTemplate>
                        <div style="margin-left: 27px;">
                            <asp:Label ID="LblPrecio" runat="server" Text=""></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="BtnAgregarCarro" runat="server" Text="Agregar a carrito" OnClientClick="alert('Hola');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
	</p>
    
</asp:Content>
