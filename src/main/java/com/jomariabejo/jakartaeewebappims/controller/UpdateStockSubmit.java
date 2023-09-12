package com.jomariabejo.jakartaeewebappims.controller;

import com.jomariabejo.jakartaeewebappims.model.InventoryData;
import com.jomariabejo.jakartaeewebappims.repository.InventoryRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/UpdateStockSubmit")
public class UpdateStockSubmit extends HttpServlet {
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            InventoryData data = createInventoryData(req);
            InventoryRepository.updateStock(Long.valueOf(req.getParameter("id").trim()), data);
            System.out.println("Success");
        } catch (Exception e) {
            System.out.println("Failed");
            e.printStackTrace();
        } finally {
            resp.sendRedirect("/inventory.jsp");
        }
    }

    private Date parseDate(String dateString) {
        try {
            return DATE_FORMAT.parse(dateString);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    private InventoryData createInventoryData(HttpServletRequest req) {
        return new InventoryData(
                parseDate(req.getParameter("dateEntered")),
                InventoryData.StockLabel.valueOf(req.getParameter("stockLabel")),
                InventoryData.Brand.valueOf(req.getParameter("brand")),
                req.getParameter("engineNumber"),
                InventoryData.Status.valueOf(req.getParameter("status"))
        );
    }
}
