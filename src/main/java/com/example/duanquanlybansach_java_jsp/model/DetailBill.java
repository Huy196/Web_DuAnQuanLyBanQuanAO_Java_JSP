package com.example.duanquanlybansach_java_jsp.model;

import java.math.BigDecimal;

public class DetailBill {
    private int IdBill;
    private int productId;
    private int quantity;
    private String size;
    private BigDecimal price;
    private BigDecimal total;

    public int getIdBill() {
        return IdBill;
    }

    public void setIdBill(int idBill) {
        IdBill = idBill;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public DetailBill() {
    }

    public DetailBill(int idBill, int productId, int quantity, String size, BigDecimal price, BigDecimal total) {
        IdBill = idBill;
        this.productId = productId;
        this.quantity = quantity;
        this.size = size;
        this.price = price;
        this.total = total;
    }
}
