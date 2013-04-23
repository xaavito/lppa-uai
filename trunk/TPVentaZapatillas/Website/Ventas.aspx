<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="Ventas.aspx.vb" Inherits="Inicio" %>

<asp:Content ID="ctnContenido" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
       <br />
        <br />
        <asp:GridView runat="server" ID="gvShoppingCart" AutoGenerateColumns="false" EmptyDataText="There is nothing in your shopping cart."
            GridLines="None" Width="100%" CellPadding="5" ShowFooter="true" DataKeyNames="ProductId">
            <HeaderStyle HorizontalAlign="Left" BackColor="#3D7169" ForeColor="#FFFFFF" />
            <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
            <AlternatingRowStyle BackColor="#F8F8F8" />
            <Columns>
                 <asp:TemplateField HeaderText="Producto">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImgProducto" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <asp:Label ID="LblDescription" runat="server" Text="Label"></asp:Label> <br />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="BtnAgregarCarro" runat="server" Text="Agregar a carrito " />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>  
        </asp:GridView>
        <br />
    </div>
</asp:Content>
