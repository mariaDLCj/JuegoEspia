// Array de URLs de los sonidos
const sounds = [
    "AUDIO/KeySound1.mp3",
    "AUDIO/KeySound2.mp3",
    "AUDIO/KeySound3.mp3",
    "AUDIO/KeySound4.mp3",
    "AUDIO/KeySound5.mp3",
    "AUDIO/KeySound6.mp3"
];

// Función para reproducir un sonido aleatorio
function playRandomSound() {
    const randomIndex = Math.floor(Math.random() * sounds.length);
    const sound = new Audio(sounds[randomIndex]); // Crea un objeto de audio con el sonido aleatorio
    sound.play(); // Reproduce el sonido
}

// Escuchar el evento de presionar una tecla
document.addEventListener("keydown", playRandomSound);
