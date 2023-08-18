package com.jomariabejo.jakartaeewebappims.controller;

import com.jomariabejo.jakartaeewebappims.model.Client;
import com.jomariabejo.jakartaeewebappims.util.hibernate.HibernateUtil;
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/loginSubmitController", name = "loginSubmitController")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        EntityManager entityManager = HibernateUtil.getInstance().getEntityManager();

        try {
            System.out.println("Start verifying login...");

            TypedQuery<Client> query = entityManager.createQuery(
                            "SELECT c FROM Client c WHERE c.userName = :username", Client.class)
                    .setParameter("username", username)
                    .setMaxResults(1);

            Client client = query.getResultStream().findFirst().orElse(null);

            if (client != null) {
                Argon2 argon2 = Argon2Factory.create();
                try {
                    if (argon2.verify(client.getPassword(), password)) {
                        System.out.println("Login successful for user: " + client.getUserName());
                        // Redirect using JavaScript
                        response.getWriter().write("VERIFIED GO TO HOMEPAGE NOW");
                    } else {
                        System.out.println("Login failed for user: " + username);
                        response.getWriter().write("false");
                    }
                } finally {
                    System.out.println("Done Verifying...");
                }
            } else {
                System.out.println("User not found: " + username);
                response.getWriter().write("false");
            }
        } catch (Exception e) {
            System.out.println("Error verifying login: " + e.getMessage());
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
    }
}
