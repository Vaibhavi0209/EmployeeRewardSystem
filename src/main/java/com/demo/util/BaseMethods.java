package com.demo.util;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Component
public class BaseMethods {

    public String generatePassword() {
        int length = 10;
        String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
        String specialCharacters = "!@#$";
        String numbers = "1234567890";
        String combinedChars = capitalCaseLetters + lowerCaseLetters + specialCharacters + numbers;
        Random random = new Random();
        char[] password = new char[length];

        password[0] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
        password[1] = capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
        password[2] = specialCharacters.charAt(random.nextInt(specialCharacters.length()));
        password[3] = numbers.charAt(random.nextInt(numbers.length()));
        StringBuilder passwordString = new StringBuilder();
        for (int i = 4; i < length; i++) {
            password[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
            passwordString.append(password[i]);
        }
        return passwordString.toString();
    }

    public static String getUser() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return user.getUsername();
    }

    public static String getUserRole() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        List<String> roleList = user.getAuthorities().stream().map(grantedAuthority ->
                grantedAuthority.getAuthority()).collect(Collectors.toList());

        return roleList.get(0);
    }

    public static void sendMail(String email, String subject, String content) {
        java.util.Properties properties = new java.util.Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        javax.mail.Session mailSession = javax.mail.Session.getInstance(properties);
        try {
            MimeMessage message = new MimeMessage(mailSession);
            message.setContent(content, "text/html");
            message.setSubject(subject);
            InternetAddress sender = new InternetAddress("******@gmail.com", "Employee Reward System");
            InternetAddress receiver = new InternetAddress(email);
            message.setFrom(sender);
            message.setRecipient(Message.RecipientType.TO, receiver);
            message.saveChanges();
            javax.mail.Transport transport = mailSession.getTransport("smtp");
            transport.connect("smtp.gmail.com", 587, "*****@gmail.com", "*********");
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public String getEmployeeId(String employeeId) {
        String[] s1 = employeeId.split("RS");
        String s = this.setZeroValue(Integer.parseInt(s1[s1.length - 1]) + 1);
        return "RS" + s;
    }

    public String setZeroValue(Integer i) {
        String ith = String.valueOf(i);

        switch (ith.length()) {
            case 1:
                ith = "000" + ith;
                break;
            case 2:
                ith = "00" + ith;
                break;
            case 3:
                ith = "0" + ith;
                break;

            default:
                return ith;
        }
        return ith;
    }

}
