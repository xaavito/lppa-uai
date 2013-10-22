<%@ Page Title="Página principal" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="PresentacionWeb._Default" %>

<%@ Import Namespace="Negocio" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

	

<div id="dmiddlesector">
        <table width="700" align="center" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td valign="top" style="padding-right: 10px;" class="style1">
                        <div align="left">
                            <p align="justify">
                                <font color="#ffffff" face="Verdana, Arial, Helvetica, sans-serif" size="3"><strong>
                                    <font color="#666666">QUIENES SOMOS</font></strong><font color="#666666"><br />
                                        <br />
                                        <font size="2">Nuestra empresa comenzó su actividad en el año 2003, apostando al futuro
                                            del país. </font></font></font>
                            </p>
                            <p align="justify">
                                <font color="#666666" face="Verdana, Arial, Helvetica, sans-serif" size="2">Fue un duro
                                    desafío, con empresas históricas ya posicionadas en el mercado.<br />
                                    <br />
                                    Con mucho trabajo, dedicación, y excelencia en la atención al cliente, lentamente
                                    nos fuimos haciendo nuestro espacio hasta llegar a donde estamos hoy, una cadena
                                    deportiva en expansión en</font>
                            </p>
                        </div>
                    </td>
                    <td width="395">
                        <div align="right">
                        <canvas id="logo" width="350px" height="250px"></canvas>
                           <!-- <img width="394" height="218" alt="" src="images/Gasta%20Suela.jpg" />-->
                        </div>
                    </td>
                </tr>
                <tr valign="top">
                    <td colspan="2">
                        <p align="justify">
                            <font color="#333333" face="Verdana, Arial, Helvetica, sans-serif" size="2"><font
                                color="#666666">Capital Federal y Buenos Aires, con locales en Zárate, La Plata
                                y Moreno.<br />
                                <br />
                            </font></font><font color="#666666" face="Verdana, Arial, Helvetica, sans-serif"
                                size="2">Pero estamos lejos de sentirnos conformes. Nuestro proyecto es de crecimiento
                                y reconocimiento constante, planificando nuevas aperturas, ampliando nuestra gama
                                de productos y canales modernos de venta, mejorando continuamente nuestras ofertas.</font></p>
                        <p align="justify">
                            <font color="#666666" face="Verdana, Arial, Helvetica, sans-serif" size="2">Por eso,
                                les decimos gracias por acompañarnos y anímense a descubrirnos.</font>
                        </p>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

<script type="text/javascript">


    window.addEventListener("load", init);

    var counter = 0; 
		
	var TO_RADIANS = Math.PI / 180;


    var canvas = document.getElementById('logo');
    var context = canvas.getContext('2d');
    var logoImage = new Image()
    logoImage.src = '/Images/GastaSuelaLogo.png';
    context.shadowOffsetX = -30;
    context.shadowOffsetY = 5;
    context.shadowBlur = 10;
    context.shadowColor = "rgba(100, 100, 100, 0.2)";

    var interval;
    var xin = -100;
    function init() {
        interval = setInterval(loopIn, 1000 / 30);

    }

    function loopIn() {
        InImage(120, logoImage);
    }
    function loopOut() {
        OutImage(120, logoImage);
    }

    function loopRotate() {

        if (counter == 360) {
            clearInterval(interval);
            xin = 200;
            interval = setInterval(loopOut, 1000 / 30);
        }
        context.clearRect(0, 0, canvas.width, canvas.height);
        drawRotatedImage(logoImage, 200, 120, counter);
        counter += 2;

    }

    function drawRotatedImage(image, x, y, angle) {
        context.save();
        context.translate(x, y);
        context.rotate(angle * TO_RADIANS);
        context.drawImage(image, -(image.width / 2), -(image.height / 2));
        context.restore();
    }


    function InImage(y, image) {
        if (xin < 200) {
            context.clearRect(0, 0, canvas.width, canvas.height);
            context.save();
            context.translate(xin, y);
            context.drawImage(image, -(image.width / 2), -(image.height / 2));
            context.restore();
        }
        else {
            clearInterval(interval);
            interval = setInterval(loopRotate, 1000 / 30);
        }
        xin += 10;
    }


    function OutImage(y, image) {
        if (xin < 500) {
            context.clearRect(0, 0, canvas.width, canvas.height);
            context.save();
            context.translate(xin, y);
            context.drawImage(image, -(image.width / 2), -(image.height / 2));
            context.restore();
        }
        else {
            clearInterval(interval);
            xin = -100;
            init();
        }
        xin += 10;
    }
	</script>
</asp:Content>
