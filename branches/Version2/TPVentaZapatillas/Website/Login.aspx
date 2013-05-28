<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="Styles/Login.css" rel="stylesheet" type="text/css" />
    <title>Venta de Zapatillas</title>
</head>
<body>
    <form id="form1" runat="server">

    <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            cargarBoton();
        });
    </script>

    <asp:ScriptManager ID="smScriptManager" runat="server">
        <Scripts>
        </Scripts>
    </asp:ScriptManager>
    <asp:HiddenField ID="hdnFoco" runat="server" />
    <div style="width: 100%; height: 600px; padding: 15em 0 0 0" align="center">
        <div style="width: 350px; height: 210px;">
            <div id="divEncabezado" class="header" style="width: 100%; border: solid 1px #439172">
                <div style="float: left; padding: 5px 0 0 10px; font-weight: bold; font-size: 14px;
                    color: White;">
                    <asp:Label ID="lblEncabezadoLogin" runat="server" Text="Venta de Zapatillas"></asp:Label>
                </div>
                <div style="float: right; padding: 0 5px 0 0">
                    <img src="Images/users.png" alt="" />
                </div>
            </div>
            <div class="contenidologin" style="width: 100%; height: 190px">
                <div style="width: 300px; float: left; padding: 3em 0 0 3em;" align="left">
                    <div style="width: 25%; float: left">
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario" CssClass="arial12verdebold"></asp:Label>
                    </div>
                    <div style="float: left">
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="arial12negrobold" Width="140px"></asp:TextBox>
                    </div>
                </div>
                <div style="width: 300px; float: left; padding: 0.5em 0 0 3em" align="left">
                    <div style="width: 25%; float: left">
                        <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña" CssClass="arial12verdebold"></asp:Label>
                    </div>
                    <div style="float: left">
                        <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password" Width="140px"></asp:TextBox>
                    </div>
                </div>
                <div style="width: 140px; float: left; padding: 0.5em 0 0.5em 10.5em">
                    <div id="divBtnIngresar" style="width: 70px">
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" />
                    </div>
                </div>
                <div style="width: 100%; float: left">
                    <div style="color: red; font-size: 11px; padding: 1em 0 1em 0" align="center">
                        <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>