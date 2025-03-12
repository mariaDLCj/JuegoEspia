let fechaEvento = new Date(2025, 8, 28, 18, 30);

actualizarContador();
setInterval(actualizarContador, 1000);

function actualizarContador() {
    const ahora = new Date();
    const tiempoRestante = fechaEvento - ahora;

    if (tiempoRestante <= 0) {
        document.getElementById('tiempoRestante').textContent = "¡El evento fue un éxito!";
        return;
    }

    // Calcular días, horas, minutos y segundos restantes
    const dias = Math.floor(tiempoRestante / (1000 * 60 * 60 * 24));
    const horas = Math.floor((tiempoRestante % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutos = Math.floor((tiempoRestante % (1000 * 60 * 60)) / (1000 * 60));
    const segundos = Math.floor((tiempoRestante % (1000 * 60)) / 1000);

    document.getElementById('dias').textContent = dias;
    document.getElementById('horas').textContent = horas;
    document.getElementById('minutos').textContent = minutos;
    document.getElementById('segundos').textContent = segundos;

}

window.onload = function () {
    var audio = document.getElementById('audio');
    audio.play().catch(function (error) {
        console.log('El audio no se pudo reproducir automáticamente:', error);
    });
};
