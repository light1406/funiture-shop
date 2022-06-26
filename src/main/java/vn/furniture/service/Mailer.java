package vn.furniture.service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class Mailer {
    private static String username = "dtb751@gmail.com";
    private static String password = "afnkolehqbikvmvu";

    public static boolean sendMail(String to, String subject, String text) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        //send
        try {
            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress("dtb751@gmail.com", "Web furniture"));
            InternetAddress[] toAddresses = {new InternetAddress(to)};
            message.setRecipients(Message.RecipientType.TO, toAddresses);
            message.setSubject(subject);
            message.setText(text);

//            Tạo phần gửi message
//            BodyPart messagePart = new MimeBodyPart();
//            messagePart.setText("This is message body");
//
//            Tạo phần gửi file
//            BodyPart filePart = new MimeBodyPart();
//            File file = new File("C://a.txt");
//            DataSource source = new FileDataSource(file);
//            filePart.setDataHandler(new DataHandler(source));
//            filePart.setFileName(file.getName());
//
//            Gộp message và file vào để gửi đi
//            Multipart multipart = new MimeMultipart();
//            multipart.addBodyPart(messagePart);
//            multipart.addBodyPart(filePart);
//            mailMessage.setContent(multipart);
            Transport.send(message);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}