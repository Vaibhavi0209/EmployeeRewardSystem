package com.demo.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomizeAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        // set our response to OK status
        response.setStatus(HttpServletResponse.SC_OK);

        boolean admin = false;
        boolean hr = false;
        boolean employee = false;

        System.out.println("AT onAuthenticationSuccess(...) function!");

        for (GrantedAuthority auth : authentication.getAuthorities()) {
            if ("ROLE_ADMIN".equals(auth.getAuthority())) {
                admin = true;
            } else if ("ROLE_HR".equals(auth.getAuthority())) {
                hr = true;
            } else if ("ROLE_EMPLOYEE".equals(auth.getAuthority())) {
                employee = true;
            } else {

            }
        }

        if (admin) {
            System.out.println("user is admin");
            response.sendRedirect("/admin/index");
        } else if (hr) {
            System.out.println("user is hr");
            response.sendRedirect("/hr/index");
        } else if (employee) {
            System.out.println("user is employee");
            response.sendRedirect("/employee/index");
        } else {
            System.out.println("user is anonymous");
            response.sendRedirect("/403");
        }
    }
}
