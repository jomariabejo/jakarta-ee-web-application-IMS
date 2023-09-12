package com.jomariabejo.jakartaeewebappims.controller;

import com.jomariabejo.jakartaeewebappims.model.InventoryData;
import com.jomariabejo.jakartaeewebappims.repository.InventoryRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/InsertStock")
public class InsertStock extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dateEnteredStr = request.getParameter("dateEntered");
        String stockLabelStr = request.getParameter("stockLabel");
        String brandStr = request.getParameter("brand");
        String engineNumber = request.getParameter("engineNumber");
        String statusStr = request.getParameter("status");

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = dateFormat.parse(dateEnteredStr);
            InventoryData.StockLabel stockLabel = InventoryData.StockLabel.valueOf(stockLabelStr);
            InventoryData.Brand brand = InventoryData.Brand.valueOf(brandStr);
            InventoryData.Status status = InventoryData.Status.valueOf(statusStr);

            InventoryRepository.insertData(new InventoryData(date, stockLabel, brand, engineNumber, status));
            response.sendRedirect("inventory.jsp");
            System.out.println("GREEN");
        } catch (Exception e) {
            System.out.println("RED");
            e.printStackTrace();
        } finally {
            System.out.println("ORANGE");
        }
    }
}
