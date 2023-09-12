package com.jomariabejo.jakartaeewebappims.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updatestock/stock")
public class UpdateStock extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        req.setAttribute("dataID", req.getParameter("dataID"));
        req.setAttribute("dateEntered", req.getParameter("date").trim());
        req.setAttribute("stockLabel", req.getParameter("stocklbl").trim());
        req.setAttribute("brand", req.getParameter("brand").trim());
        req.setAttribute("engineNumber", req.getParameter("engineNumber").trim());
        req.setAttribute("status", req.getParameter("status").trim());

        req.getRequestDispatcher("/updatestock.jsp").forward(req, resp);
    }
}
