<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>
  
    <xsl:template match="/">
      <link href="/Styles/Site.css" rel="stylesheet" type="text/css" />
      <table class="table table-striped table-bordered table-condensed" cellspacing="0" cellpadding="4" style="color:#333333;width:100%;border-collapse:collapse;">
        <tr  style="color:White;background-color:#1C5E55;font-weight:bold;">
          <td>Fecha</td>
          <td>Descripcion</td>
          <td>Usuario</td>
        </tr>
        <xsl:for-each select="ArrayOfBitacora/Bitacora">
          <xsl:sort select="Fecha"/>
          <tr style="background-color:White;">
            <td>
              <xsl:value-of select="Fecha"/>
            </td>
            <td>
              <xsl:value-of select="Descripcion"/>
            </td>
            <td>
              <xsl:value-of select="Usuario/Apellido"/>, <xsl:value-of select="Usuario/Nombre"/>
            </td>          
          </tr>
        </xsl:for-each>
      </table>
    </xsl:template>
</xsl:stylesheet>
