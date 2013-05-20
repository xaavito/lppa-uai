Imports BLL
Imports BE
Partial Class Site
    Inherits System.Web.UI.MasterPage
    'Pagina "Master" Principal utilizada para la configuracion de permisos.Esta pagina va ser heredada por las otras paginas de operaciones
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Valido integridad de datos si no hay asignada pagina principal unicamente . Seria por primera vez
            If Me.Session("PaginaActual") Is Nothing Then
                VerificarIntegridadBase()
            End If
        End If
        'En esta funcion se valida la variable de sesion del Usuario logueado para actualizar los permisos cada vez que 
        'realiza un "PostBack" por las paginas heredadas 
        If (Me.Session("LoginOK") = "True") Then
            If Not Me.Session("UsrLogueado") Is Nothing Then
                'Actualizo el nombre del usuario logueado
                LblUsr.Text = "Bienvenido  " + CType(Me.Session("UsrLogueado"), BEUsuario).Nombre
                'Actualizo los permisos del usuario logueado
                CargarPermisos()
            Else
                Me.Session("PaginaActual") = ""
                lnkSalir.Text = "Salir"
                'Oculta todos los links(Accesos a pagina por Javascript
                HideLinks()
            End If
        End If
    End Sub
    Private Sub VerificarIntegridadBase()
        Dim Nombretabla As String = ""
        If Not (DVV.VerificarIntegridadDatos(Nombretabla)) Then 'Lamado a validacion de verificar integridad de datos
            Me.Session("LoginOK") = "False"
            'Peticion de cerrado de pagina
            Me.Response.Write("<script type='text/javascript'>alert('" + "La base de datos esta corrupta en la tabla  " + Nombretabla + " Contactese con administrador " + "');window.close();</script>")
            Me.Page.ClientScript.RegisterStartupScript(Me.GetType(), "Ocultartodo", "OcultarTodo();", True)
            lnkSalir.Text = "Salir"
        Else
            Me.Session("LoginOK") = "True"
        End If
    End Sub
    Private Sub HideLinks()
        Me.Page.ClientScript.RegisterStartupScript(Me.GetType(), "OcultarDivs", "OcultarDivs();", True)
    End Sub
    Protected Sub LnkInicio_Click(ByVal sender As Object, ByVal e As EventArgs)
        'Variable utilizada para indicar la pagina actual en la cual hizo click el usuario
        Me.Session("PaginaActual") = "Inicio.aspx"
        Response.Redirect("Inicio.aspx")
    End Sub
    Protected Sub LnkProducto_Click(ByVal sender As Object, ByVal e As EventArgs)
        Me.Session("PaginaActual") = "Productos.aspx"
        Response.Redirect("Productos.aspx")
    End Sub
    Protected Sub lnkAdmUsuarios_Click(ByVal sender As Object, ByVal e As EventArgs)
        Me.Session("PaginaActual") = "Adminstracion.aspx"
        Response.Redirect("Adminstracion.aspx")
    End Sub
    Protected Sub LnkPermisos_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Permisos.aspx")
    End Sub
    Protected Sub lnkBitacora_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Bitacora.aspx")
    End Sub
    Protected Sub lnkBackupRestored_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("BackupRestored.aspx")
    End Sub
    Protected Sub lnkAdmProductos_Click(ByVal sender As Object, ByVal e As EventArgs)
        Me.Session("PaginaActual") = "AdministracionProductos.aspx"
        Response.Redirect("AdministracionProductos.aspx")
    End Sub
    Protected Sub LnkUsuarios_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Usuarios.aspx")
    End Sub
    Protected Sub lnkSalir_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Si ningun usuario esta logueado cierro pagina
        If Me.Session("UsrLogueado") Is Nothing Then
            Me.Response.Write("<script type='text/javascript'>window.close();</script>")
            Exit Sub
        End If
        Me.Session("PaginaActual") = "Inicio.aspx"
        Me.Session("UsrLogueado") = Nothing
        Me.Session("PermisosUsrLogueado") = Nothing
        Response.Redirect("Inicio.aspx")
    End Sub
    Protected Sub btnIngresar_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim UsuarioLogueado As New BEUsuario
        Dim Usuario As New Usuario
        Dim IdUsuario As Integer
        Dim ListPermisos As Generic.List(Of BEPermiso)
        Try
            'Luego de las validaciones que se hicieron del lado del cliente . Se valida en base de datos su existencia
            UsuarioLogueado = Usuario.CargarUsuario(IdUsuario, txtUsuario.Text.Trim, txtContrasenia.Text.Trim)
            If (IdUsuario > 0) Then
                ' Si existe el usuario se actualiza la variable de sesion
                Me.Session("UsrLogueado") = UsuarioLogueado
                ListPermisos = Usuario.GetPermisos(UsuarioLogueado.IdPerfil)
                ' Si existe el usuario se cargan los permisos y se actualiza las variables de sesion
                Me.Session("PermisosUsrLogueado") = ListPermisos
                CargarPermisos()
                ' Se actualiza el usuario logueado 
                LblUsr.Text = "Bienvenido  " + CType(Me.Session("UsrLogueado"), BEUsuario).Nombre
                'Se actualiza pagina actual
                Me.Session("PaginaActual") = "Inicio.aspx"
            Else
                lblError.Text = "Usuario no habilitado para utilizar el sistema"
            End If
        Catch ex As Exception
            'Registrar en bitacora
        End Try
    End Sub
    Private Sub CargarPermisos()
        Dim ListPermisos As Generic.List(Of BEPermiso)
        Dim ArrayPerm As String = ""
        'Hidden fields utilizados para Mostrar/Ocultar los contenedores(divs) por javascript
        hdnPermisosUsr.Value = "" ' hidden field para guardar los permisos del usuario
        hdnPaginaActual.Value = " " ' hidden field para guardar la pagina actual
        ' Se obtiene los permisos actuales del usuario logueado
        ListPermisos = CType(Me.Session("PermisosUsrLogueado"), Generic.List(Of BEPermiso))

        'Se recorre los permisos para  actualizar hidden field de permisos
        For Each P As BEPermiso In ListPermisos
            ArrayPerm = ArrayPerm + P.LinkPermiso + "|"
        Next
        ' Actualizo Hidden field de Permisos de usuario
        hdnPermisosUsr.Value = ArrayPerm.Substring(0, ArrayPerm.Length - 1)
        'Actualizo hidden field de pagina actual
        hdnPaginaActual.Value = Me.Session("PaginaActual")
        'Realizo a llamada de funcion havascript para Mostrar/Ocultar Divs
        Page.ClientScript.RegisterStartupScript(Page.GetType, "CargarPermisos", "CargarDivsPermisos();", True)
    End Sub
End Class
