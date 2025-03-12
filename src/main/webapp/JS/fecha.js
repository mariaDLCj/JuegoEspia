let tiempoRestante = 3;
const autodestruccion = document.getElementById("autodestruir");

let intervalo = setInterval(function() {
    autodestruccion.textContent=tiempoRestante;
    tiempoRestante--;
    
    if (tiempoRestante < 0) {
        clearInterval(intervalo);
    }
}, 1000);
