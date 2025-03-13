// Función para reproducir el audio
function reproducirAudio() {
    const audio = document.getElementById("audio");
    audio.muted = false; // Asegura que el audio no esté en silencio
    audio.play(); // Reproduce el audio
}

// Ejecutar la función cuando la página haya cargado completamente
window.onload = reproducirAudio();