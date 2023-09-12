package com.jomariabejo.jakartaeewebappims.controller;

import com.jomariabejo.jakartaeewebappims.repository.InventoryRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteStockConfirmed")
public class DeleteStock extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        InventoryRepository.deleteStock(Long.valueOf(req.getParameter("id")));
        resp.sendRedirect("/inventory.jsp");
    }
}
