<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Productos.aspx.vb" Inherits="PresentacionWeb.Productos" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Productos (<a href="ViewCart.aspx">Ver Carrito</a>)
    </h2>
	<p>
        
    Moneda: <asp:DropDownList ID="ddlMoneda" runat="server" 
            OnSelectedIndexChanged="ddlMoneda_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
    <asp:GridView ID="gvShoppingCart" runat="server" AutoGenerateColumns="False" 
    PageSize="15" Width="700px"
    CssClass="table table-striped table-bordered table-condensed" CellPadding="4" 
            ForeColor="#333333" GridLines="None"  OnRowDataBound="gvShoppingCart_RowDataBound" OnRowCommand="gvShoppingCart_RowCommand">
        <AlternatingRowStyle BackColor="White" />
<Columns>

                <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                    <asp:HiddenField ID="OID" runat="server" Value='<%# Eval("OID") %>' />
                  </ItemTemplate>
                </asp:TemplateField>    
                            
                <asp:ImageField DataImageUrlField="Foto" ControlStyle-Height="118px" ControlStyle-Width="142px"></asp:ImageField>

                <asp:BoundField DataField="Nombre" HeaderText="Descripcion" />

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
                <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio" DataFormatString="{0:$ 0.00}"  />
                <asp:TemplateField>
                    <ItemTemplate>
                    <asp:Button ID="BtnAgregarCarro" runat="server" 
                          CommandName="AddToCart" 
                          CommandArgument="<%# Container.DataItemIndex %>"
                          Text="Agregar a carrito" />                        
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
</asp:Content>
