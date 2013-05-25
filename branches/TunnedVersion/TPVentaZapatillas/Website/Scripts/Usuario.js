//Funcion para validar la entrada de usuario por cliente
function ValidarUsuario() {
    var txtNombre = document.getElementById("ContentPlaceHolder1_txtNombre");
    var txtApellido = document.getElementById("ContentPlaceHolder1_txtApellido");
    var txtUsuario = document.getElementById("ContentPlaceHolder1_txtUsuario");
    var txtContrasenia = document.getElementById("ContentPlaceHolder1_txtContrasenia");
    var ddlFamilia = document.getElementById("ContentPlaceHolder1_ddlFamilia");

    if (txtNombre.value.trim() == "") {
        alert("Debe ingresar un nombre");
        return false;
    }

    if (txtApellido.value.trim() == "") {
        alert("Debe ingresar un apellido");
        return false;
    }

    if (txtUsuario.value.trim() == "") {
        alert("Debe ingresar un usuario");
        return false;
    }

    if (txtContrasenia.value.trim() == "") {
        alert("Debe ingresar un password");
        return false;
    }
}