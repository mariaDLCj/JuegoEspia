let tiempoRestante = 3;

let intervalo = setInterval(function () {
    document.getElementById("autodestruir").textContent = tiempoRestante;
    tiempoRestante--;

    if (tiempoRestante === 0) {
        document.getElementById("gif").classList.remove("hidden");
        document.getElementById("autodestruir").textContent = 0;
        clearInterval(intervalo);
    }
}, 1000);  