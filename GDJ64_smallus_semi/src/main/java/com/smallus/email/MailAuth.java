package com.smallus.email;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{

    PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "smallus404@gmail.com";
        String mail_pw = "uvcyqntwueddbtpi";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
