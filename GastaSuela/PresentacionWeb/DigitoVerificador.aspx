﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DigitoVerificador.aspx.vb" Inherits="PresentacionWeb.DigitoVerificador" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Digito Verificador
    </h2>
    <p>
    <asp:GridView ID="dgDigitosVerificadores" runat="server" AutoGenerateColumns="True" 
    PageSize="15" Width="700px"
    CssClass="table table-striped table-bordered table-condensed" CellPadding="4" 
            ForeColor="#333333" GridLines="None" EmptyDataText="Todos los dígitos verificadores son correctos">
        <AlternatingRowStyle BackColor="White" />
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
    <asp:Button runat="server" ID="btnRecalcular" Text="Recalcular Digitos Verificadores" OnClick="btnRecalcular_Click" />
    </p>
</asp:Content>

