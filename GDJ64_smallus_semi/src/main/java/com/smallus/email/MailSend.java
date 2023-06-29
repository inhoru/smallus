package com.smallus.email;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;



public class MailSend {
    
    public String MailSend(String email) {
        Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.trust", "smtp.gmail.com");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        
        Authenticator auth = new MailAuth();
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);
        
        String epw=createKey();
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("smallus404@gmail.com", "smallus"));
            InternetAddress to = new InternetAddress(email);         
            msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject("안녕하세요 smallus 입니다.", "UTF-8");
           
            msg.setText("안녕하세요 smallus 입니다. 요청하신 인증번호는 : "+epw+"입니다.", "UTF-8");                        
            Transport.send(msg);
            
        } catch(AddressException ae) {            
            System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException : " + e.getMessage());
        } 
        return epw;
    }
    
    public String createKey() {
        String key = String.valueOf((int)(Math.random()*1000000)+1);
        System.out.println("생성된 랜덤 인증번호"+ key);
        return key;
}
}