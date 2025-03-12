const nombre = document.getElementById("nombre");
const apellido1 = document.getElementById("apellido1");
const apellido2 = document.getElementById("apellido2");
const telefono = document.getElementById("telefono");
const error = document.getElementById("errorJs");
const btn = document.getElementById("botonValidar");

const regexNombre = /^[A-Za-záéíóúÁÉÍÓÚñÑ]+$/; 
const regexTelefono = /^([67])[0-9]{8}$/;

function validarCampo(input, regex, mensaje) {
    const errorMessage = document.getElementById("errorJs");
    if (!regex.test(input.value.trim())) {
        errorMessage.textContent = mensaje;
        return false;
    } else {
        errorMessage.textContent = "";
        return true;
    }
}

function validarFormulario() {
    const nombreValido = validarCampo(nombre, regexNombre, "El nombre debe contener sólo letras y tildes válidas");
    const apellido1Valido = validarCampo(apellido1, regexNombre, "El apellido debe contener sólo letras y tildes válidas");
    const telefonoValido = validarCampo(telefono, regexTelefono, "El teléfono debe ser válido (comienza con 6 o 7 y tiene 9 dígitos)");

    btn.disabled = !(nombreValido && apellido1Valido && telefonoValido);
}

[nombre, apellido1, telefono].forEach(input => {
    input.addEventListener('blur', validarFormulario);
});
