Imports Servicios
Imports System.Xml
Imports System.Xml.Xsl

Public Class Bitacora
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("Lista") <> "" Then
            ViewXSLT()
        Else
            ViewGrid()
        End If
    End Sub

    Sub ViewGrid()

        Try
            Dim bitacoras As New List(Of Negocio.Bitacora)
            bitacoras = GesBitacoras.Consultar()
            dgvBitacoras.DataSource = bitacoras
            dgvBitacoras.DataBind()
        Catch ex As Exception
            My.Application.HandlerException(Me, ex)
        End Try

    End Sub
    Sub ViewXSLT()
        Dim xml As String
        xml = GesBitacoras.ConsultarXML()

        Dim xdoc As New XmlDocument()
        xdoc.LoadXml(xml)

        Dim xslarg As New XsltArgumentList()
        xslarg.AddParam("pageid", "", "page_1")
        Dim sw As New IO.StringWriter()
        Dim xslt As New XslTransform()

        xslt.Load(HttpContext.Current.Server.MapPath("~/") & "/Bitacora.xslt")
        xslt.Transform(xdoc, xslarg, sw)

        Dim result As String
        result = sw.ToString()
        sw.Close()

        Response.Write(result)
        Response.End()
        'Dim ctrl As New Control
        'ctrl = Page.ParseControl(result)
        'Page.Controls.Add(ctrl)

    End Sub

    Private Sub dgvBitacoras_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles dgvBitacoras.PageIndexChanging
        dgvBitacoras.PageIndex = e.NewPageIndex
    End Sub
End Class