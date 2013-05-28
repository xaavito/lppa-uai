//Funcion para ocultar todos los divs de pagina.
function OcultarDivs() {
    var divLnkAdmUsuarios = document.getElementById("divLnkAdmUsuarios");
    var divLnkAdmProductos = document.getElementById("divLnkAdmProductos");
    var LnkPermisos = document.getElementById("divLinkPermisos");
    var LinkBitacora = document.getElementById("divLinkBitacora");
    var lnkBackupRestored = document.getElementById("divBackupRestored");
    var divLinkUsuarios = document.getElementById("divLinkUsuarios");

    divLnkAdmUsuarios.style.display = "none";
    divLnkAdmProductos.style.display = "none";

    LnkPermisos.style.display = "none";
    LinkBitacora.style.display = "none";
    lnkBackupRestored.style.display = "none";
    divLinkUsuarios.style.display = "none";
}

//Oculto todos los divs

function OcultarTodo() {
    OcultarDivs();
    var divLnkInicio = document.getElementById("divLnkInicio");
    var divLnkProductos = document.getElementById("divLnkProductos");
    var dmiddlesector = document.getElementById("dmiddlesector");

    divLnkInicio.style.display = "none";
    divLnkProductos.style.display = "none";
    dmiddlesector.style.display = "none";
    DeshabilitarLink("divLogin");
}


//Funcion para Mostrar un Div individual
function HabilitarLink(link) {
    var divlink = document.getElementById(link);
    divlink.style.display = "block";
}

//Funcion para ocultar un Div individual
function DeshabilitarLink(link) {
    var divlink = document.getElementById(link);
    if (divlink) {
        divlink.style.display = "none";
    }
}

//Funcion para validar la entrada de login por cliente
function ValidarLogin() {
    var lblUsr = document.getElementById("ContentPlaceHolder2_txtUsuario");
    var lblPass = document.getElementById("ContentPlaceHolder2_txtContrasenia");
    var LblError = document.getElementById("ContentPlaceHolder2_lblError");

    if (lblUsr.value.trim() == "") {
        LblError.innerHTML = "El campo USUARIO no puede ser vacío";
        return false;
    }

    if (lblPass.value.trim() == "") {
        LblError.innerHTML = "El campo CONTRASEÑA no puede ser vacío";
        return false;
    }
}

//Funcion para Mostrar/Ocultar divs (Contenedores)
function CargarDivsPermisos() {
    //Obtengo de los valores de Hidden fields cargados por funciones del servidor
    var hdnPermisosUsr = document.getElementById("hdnPermisosUsr");
    var hdnPaginaActual = document.getElementById("hdnPaginaActual");
    //Formo un arreglo de permisos con los valores cargados por servidor separados por "|"
    var arrayPermisosUsr = hdnPermisosUsr.value.split("|");
    OcultarDivs(hdnPaginaActual);
    //desahibilito el contenedor de login ya que el usuario se encuentra logueado
    DeshabilitarLink("divLogin");

    //Se habilitan uno a uno los links otorgados por el usuario
    for (var i = 0; i < arrayPermisosUsr.length; i++) {
        HabilitarLink(arrayPermisosUsr[i]);
    }

    //Se desahibiltan los links pertenecientes a administracion para que no se solapen y se habiliten cuando es en 
    if (hdnPaginaActual.value != "Adminstracion.aspx" &&
            hdnPaginaActual.value != "Usuarios.aspx" &&
            hdnPaginaActual.value != "BackupRestored.aspx" &&
            hdnPaginaActual.value != "Bitacora.aspx" &&
            hdnPaginaActual.value != "Permisos.aspx") {
        DeshabilitarLink("divLinkPermisos");
        DeshabilitarLink("divLinkBitacora");
        DeshabilitarLink("divBackupRestored");
        DeshabilitarLink("divLinkUsuarios");
    }


}