package com.jomariabejo.jakartaeewebappims.model;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

@Entity
@Table(name = "inventory_data")
public class InventoryData {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long data_id;

    @Temporal(TemporalType.DATE)
    private Date date_entered;

    @Enumerated(EnumType.STRING)
    private StockLabel stock_label;

    @Enumerated(EnumType.STRING)
    private Brand brand;

    private String engine_number;

    @Enumerated(EnumType.STRING)
    private Status status;

    public enum StockLabel {
        Old, New
    }

    public enum Brand {
        Honda, Kawasaki, Kymco, Suzuki, Yamaha
    }

    public enum Status {
        Onhand, Sold
    }

    public Long getDataID() {
        return data_id;
    }

    public void setData_id(Long data_id) {
        this.data_id = data_id;
    }

    public Date getDateEntered() {
        return date_entered;
    }

    public void setDateEntered(Date date_entered) {
        this.date_entered = date_entered;
    }

    public StockLabel getStockLabel() {
        return stock_label;
    }

    public void setStockLabel(StockLabel stock_label) {
        this.stock_label = stock_label;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public String getEngineNumber() {
        return engine_number;
    }

    public void setEngineNumber(String engine_number) {
        this.engine_number = engine_number;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public InventoryData() {
    }

    public InventoryData(Date date_entered, StockLabel stock_label, Brand brand, String engine_number, Status status) {
        this.date_entered = date_entered;
        this.stock_label = stock_label;
        this.brand = brand;
        this.engine_number = engine_number;
        this.status = status;
    }

    @Override
    public String toString() {
        return "InventoryData{" +
                "data_id=" + data_id +
                ", date_entered=" + date_entered +
                ", stock_label=" + stock_label +
                ", brand=" + brand +
                ", engine_number='" + engine_number + '\'' +
                ", status=" + status +
                '}';
    }
}
