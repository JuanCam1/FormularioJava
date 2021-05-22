//Validaciones

const datos = {
    nombre: "",
    apellido: "",
    fechanac: "",
    email: "",
    universidad: "",
    carrera: "",
    sugerencia: "",
};

const nombre = document.querySelector("#nombre");
const apellido = document.querySelector("#apellido");
const fechanac = document.querySelector("#fechanac");
const email = document.querySelector("#email");
const universidad = document.querySelector("#universidad");
const carrera = document.querySelector("#carrera");
const sugerencia = document.querySelector("#sugerencia");
const formulario = document.querySelector("#formularioInsercion");
expresion = /\w+@\w+\.+[a-z]/;

nombre.addEventListener("input", leerTexto);
apellido.addEventListener("input", leerTexto);
fechanac.addEventListener("input", leerTexto);
email.addEventListener("input", leerTexto);
universidad.addEventListener("input", leerTexto);
carrera.addEventListener("input", leerTexto);
sugerencia.addEventListener("input", leerTexto);

formulario.addEventListener("submit", function (evento) {
    evento.preventDefault();

        
//Validación de confirmación
    //Validación
    const {nombre, apellido, fechanac, email, universidad, carrera, sugerencia} = datos;

    if (nombre === "" || apellido === "" || fechanac === "" || email === "" || universidad === "" || carrera === "" || sugerencia === "") {
        mostrarAlerta("Todos los campos son obligatorios", "error");
        return;
    } else if (nombre.length > 30) {
        alert("El nombre es muy largo");
        return;
    } else if (apellido.length > 30) {
        alert("El apellido es muy largo");
        return;
    } else if (email.length > 60) {
        alert("El email es muy largo");
        return;
    } else if (!expresion.test(email)) {
        alert("el correo no es valido");
        return;
    } else if (universidad.length > 40) {
        alert("EL nombre de la Universidad es muy largo");
        return;
    } else if (carrera.length > 60) {
        alert("Nombre de la carrera muy largo");
        return;
    } else if (sugerencia.length > 200) {
        alert("Maximo 200 caracteres de sugerencia");
        return;
    } else {
        mostrarAlerta("Enviando formulario");
        formulario.submit();
    }

   

});

function leerTexto(e) {
    datos[e.target.id] = e.target.value;
    console.log(datos);
}

function mostrarAlerta(mensaje, error = null) {
    const alerta = document.createElement("p");
    alerta.textContent = mensaje;

    if (error) {
        alerta.classList.add("error");
    } else {
        alerta.classList.add("correcto");
    }
    formulario.appendChild(alerta);
    setTimeout(() => {
        alerta.remove();
    }, 2000);
}



