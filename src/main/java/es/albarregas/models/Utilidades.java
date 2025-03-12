package es.albarregas.models;

import java.util.Enumeration;
import java.util.List;
import java.util.Properties;
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
