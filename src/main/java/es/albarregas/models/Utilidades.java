package es.albarregas.models;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.mail.*;
import javax.mail.internet.*;


/**
 *
 * @author Maria
 */
public class Utilidades {

    public static Boolean campoVacio(Enumeration<String> nombres, List<String> camposOpcionales, HttpServletRequest request) {
        Boolean vacio = false;
        while (nombres.hasMoreElements()) {
            String nombre = nombres.nextElement();
            String valor = request.getParameter(nombre);
            if (valor.isEmpty() && !camposOpcionales.contains(nombre)) {
                vacio = true;
            }
        }

        return vacio;
    }

    public static String devolverCifradoCesar(String mensajeACifrar) {
        char[] alfabeto = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
        StringBuilder mensajeCifrado = new StringBuilder();

        for (int i = 0; i < mensajeACifrar.length(); i++) {
            char letra = mensajeACifrar.charAt(i);

            if (letra == ' ' || !Character.isLetter(letra)) {
                mensajeCifrado.append(letra);
            } else {
                letra = Character.toUpperCase(letra);

                int indiceOriginal = letra - 'A';
                int indiceCifrado = (indiceOriginal + 3) % 26;
                mensajeCifrado.append(alfabeto[indiceCifrado]);
            }
        }

        return mensajeCifrado.toString();
    }

    // Función para reemplazar una palabra cifrada por su palabra original en la frase
    public static String reemplazarPalabraConOriginal(String fraseCifrada, String fraseOriginal) {
        String[] palabrasCifradas = fraseCifrada.split(" ");
        String[] palabrasOriginales = fraseOriginal.split(" ");
        List<String> posicionesUsadas = new ArrayList<>();

        List<String> palabrasCifradasList = new ArrayList<>();
        for (String palabra : palabrasCifradas) {
            palabrasCifradasList.add(palabra);
        }

        if (palabrasCifradasList.isEmpty()) {
            return fraseOriginal;
        }

        // Elegimos una palabra aleatoria de las palabras cifradas
        Random rand = new Random();
        String palabraCifradaAleatoria = palabrasCifradasList.get(rand.nextInt(palabrasCifradasList.size()));

        while (palabraCifrada(posicionesUsadas, palabraCifradaAleatoria)) {
            rand = new Random();
            palabraCifradaAleatoria = palabrasCifradasList.get(rand.nextInt(palabrasCifradasList.size()));
        }

        String palabraOriginal = buscarPalabraOriginal(palabraCifradaAleatoria, palabrasCifradas, palabrasOriginales);

        // Reemplazamos la palabra cifrada por su palabra original
        StringBuilder nuevaFrase = new StringBuilder();
        for (int i = 0; i < palabrasCifradas.length; i++) {
            if (palabrasCifradas[i].equals(palabraCifradaAleatoria)) {
                nuevaFrase.append(palabraOriginal.toUpperCase()).append(" ");

                posicionesUsadas.add(palabraCifradaAleatoria);
            } else {
                nuevaFrase.append(palabrasCifradas[i]).append(" ");
            }
        }

        return nuevaFrase.toString().trim();
    }

    // Función que busca la palabra original correspondiente a la palabra cifrada
    private static String buscarPalabraOriginal(String palabraCifrada, String[] palabrasCifradas, String[] palabrasOriginales) {
        for (int i = 0; i < palabrasCifradas.length; i++) {
            if (palabrasCifradas[i].equals(palabraCifrada)) {
                return palabrasOriginales[i];
            }
        }
        return palabraCifrada;
    }

    private static boolean palabraCifrada(List<String> posicionesUsadas, String palabraCifrada) {
        for (int i = 0; i < posicionesUsadas.size(); i++) {
            if (posicionesUsadas.get(i).equalsIgnoreCase(palabraCifrada)) {
                return true;
            }
        }
        return false;
    }

    public static void enviarMensaje(final String emailMensajero, final String contrasenia, final String emailDestinatario, String mensaje) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(emailMensajero, contrasenia);
                    }
                });

        try {
            Message mensajeManager = new MimeMessage(session);
            mensajeManager.setFrom(new InternetAddress(emailMensajero));
            mensajeManager.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailDestinatario));
            mensajeManager.setSubject("MENSAJE CLASIFICADO");
            mensajeManager.setText(mensaje);

            Transport.send(mensajeManager);

            System.out.println("Correo enviado correctamente.");

        } catch (MessagingException e) {
            throw new RuntimeException("Error al enviar el correo: " + e.getMessage(), e);
        }
    }

}
