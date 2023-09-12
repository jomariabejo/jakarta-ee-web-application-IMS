package com.jomariabejo.jakartaeewebappims.repository;

import com.jomariabejo.jakartaeewebappims.model.InventoryData;
import com.jomariabejo.jakartaeewebappims.util.jakartapersistence.db;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class InventoryRepository {
    public List<InventoryData> getInventoryData() {
        EntityManager entityManager = db.getInstance().getEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        return entityManager.createQuery("SELECT c FROM InventoryData c ", InventoryData.class).getResultList();
    }

    public static void insertData(InventoryData stock) {
        EntityManager entityManager = db.getInstance().getEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        entityManager.persist(stock);
        entityTransaction.commit();
        System.out.println("" +
                "Stock registered successfully...\n\n\n" +
                "ID            : " + stock.getDataID() + "\n" +
                "Date          : " + stock.getDateEntered() + " \n" +
                "Stock Label   : " + stock.getStockLabel() + "\n" +
                "Brand         : " + stock.getBrand() + "\n" +
                "Engine Number : " + stock.getEngineNumber() + "\n" +
                "Status        : " + stock.getStatus());
        entityManager.close();
    }

    public static void deleteStock(Long ID) {
        EntityManager entityManager = db.getInstance().getEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        InventoryData stock = entityManager.find(InventoryData.class, ID);
        if (stock != null) {
            entityTransaction.begin();
            entityManager.remove(stock);
            entityTransaction.commit();
        }
        entityManager.close();
    }

    public static void updateStock(Long ID,InventoryData updatedStock) {
        EntityManager entityManager = db.getInstance().getEntityManager();

        InventoryData stock = entityManager.find(InventoryData.class, ID);

        try {
            if (stock != null) {
                stock.setBrand(updatedStock.getBrand());
                stock.setStatus(updatedStock.getStatus());
                stock.setStockLabel(updatedStock.getStockLabel());
                stock.setEngineNumber(updatedStock.getEngineNumber());
                stock.setDateEntered(updatedStock.getDateEntered());

                entityManager.getTransaction().begin();
                entityManager.getTransaction().commit();
                System.out.println("UPDATE SUCCESS");
            }
        }
        catch (Exception e) {
            System.out.println("UPDATE FAILED");
            e.printStackTrace();
        }
        finally {
            entityManager.close();
        }
    }
}
