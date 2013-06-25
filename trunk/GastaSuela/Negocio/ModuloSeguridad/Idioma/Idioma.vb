Imports System.Xml
Imports Excepciones
Imports System.Xml.Serialization
'TODO: Patron Prototype -> Prototipo Concreto
<Serializable()> _
Public Class Idioma
    Inherits BasePersistencia
    Implements IPrototype(Of Idioma)

    Private _nombre As String
    Private _archivo As String = ""
    Private _contenedores As New List(Of Contenedor)
    Private _mensajes As New List(Of Mensaje)

    Sub New()
        MyBase.Persistencia = EstadoPersistencia.INSERT
    End Sub


    Public Property Nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property

    Public Property Archivo() As String
        Get
            Return _archivo
        End Get
        Set(ByVal value As String)
            _archivo = value
        End Set
    End Property

    Public ReadOnly Property Contenedores() As List(Of Contenedor)
        Get
            Return _contenedores
        End Get
    End Property
    Public ReadOnly Property Mensajes() As List(Of Mensaje)
        Get
            Return _mensajes
        End Get
    End Property

    Public Function Contenedor(container As String) As Contenedor
        Dim r As New Contenedor()
        For Each cont As Contenedor In _contenedores
            If container = cont.Nombre Then
                r = cont.Clonar()
                Exit For
            End If
        Next

        For Each cont As Contenedor In _contenedores
            If "General" = cont.Nombre Then
                For Each ctrl As Control In cont.Clonar().Controles
                    r.Controles.Add(ctrl)
                Next
                Exit For
            End If
        Next

        Return r
    End Function

    Public Function TraduceMensaje(codigo As String) As Mensaje
        Dim r As Mensaje = New Mensaje()
        r.Codigo = codigo
        r.Caption = codigo
        For Each e As Mensaje In _mensajes
            If codigo = e.Codigo Then
                r = e
                Exit For
            End If
        Next
        Return r
    End Function

    Public Function Clonar() As Idioma Implements IPrototype(Of Idioma).Clonar
        Dim iclone As New Idioma()
        iclone.Archivo = ""
        iclone.Persistencia = EstadoPersistencia.INSERT
        iclone.OID = 0
        iclone.Nombre = ""
        For Each cont In _contenedores
            iclone.Contenedores.Add(cont.Clonar())
        Next
        For Each msg As Mensaje In _mensajes
            iclone.Mensajes.Add(msg.Clonar)
        Next
        Return iclone
    End Function

    Public Overrides Function ToString() As String
        Return Me.Nombre
    End Function
#Region "Codigo Comentado"
    'Parsea el xml
    'Sub Load()

    '    Dim xDoc As New XmlDocument()
    '    Try
    '        xDoc.Load(Me.Archivo)
    '    Catch ex As Exception
    '        Throw New LanguageFileNotFoundException()
    '    End Try

    '    Try

    '        Dim Contenedores As XmlNodeList = xDoc.SelectNodes("/language/Containers")
    '        If Contenedores.Count > 0 Then
    '            For Each node As XmlNode In Contenedores(0).ChildNodes
    '                Dim controlNameContainer As String = node.Name
    '                If controlNameContainer <> "#comment" Then
    '                    Dim caption As String = node.SelectSingleNode("/language/Containers/" & controlNameContainer & "/caption").InnerText

    '                    Dim CtrlFrm As New Contenedor()
    '                    'CtrlFrm.Contenedor = "Initial"
    '                    CtrlFrm.Nombre = controlNameContainer
    '                    CtrlFrm.Caption = caption
    '                    '_controles.Add(CtrlFrm)

    '                    _contenedores.Add(CtrlFrm)

    '                    Dim controls As XmlNodeList = node.SelectNodes("/language/Containers/" & controlNameContainer & "/controls")
    '                    If controls.Count > 0 Then
    '                        For Each nodeCtrl As XmlNode In controls(0).ChildNodes
    '                            Dim ControlName As String = nodeCtrl.Name
    '                            If ControlName <> "#comment" Then
    '                                Dim controlCaption As String = nodeCtrl.SelectSingleNode("/language/Containers/" & controlNameContainer & "/controls/" & ControlName & "/caption").InnerText
    '                                Dim Ctrl As New Control()
    '                                'Ctrl.Contenedor = controlNameContainer
    '                                Ctrl.Nombre = ControlName
    '                                Ctrl.Caption = controlCaption
    '                                CtrlFrm.Controles.Add(Ctrl)
    '                            End If
    '                        Next
    '                    End If
    '                End If
    '            Next
    '        End If

    '        Dim Mensajes As XmlNodeList = xDoc.SelectNodes("/language/Mensajes")
    '        If Mensajes.Count > 0 Then
    '            For Each node As XmlNode In Mensajes(0).ChildNodes
    '                Dim Code As String = node.Name
    '                If Code <> "#comment" Then
    '                    Dim Caption As String = node.SelectSingleNode("/language/Mensajes/" & Code & "/caption").InnerText
    '                    Dim err As New Mensaje()
    '                    err.Codigo = Code
    '                    err.Caption = Caption
    '                    _mensajes.Add(err)
    '                End If
    '            Next
    '        End If

    '    Catch ex As Exception
    '        Throw New LanguageFileIncorrectFormatException()
    '    End Try
    'End Sub
#End Region

End Class
