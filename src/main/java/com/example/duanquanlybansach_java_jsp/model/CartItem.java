package com.example.duanquanlybansach_java_jsp.model;

import java.math.BigDecimal;

public class CartItem {
    private int productId;
    private String urlImage;
    private String name;
    private BigDecimal price;
    private String size;
    private int quantity;
    private int maxQuantity;

    @Override
    public String toString() {
        return "CartItem{" +
                "productId=" + productId +
                ", urlImage='" + urlImage + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", size='" + size + '\'' +
                ", quantity=" + quantity +
                '}';
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    public CartItem(int productId, String urlImage, String name, BigDecimal price, String size, int quantity, int maxQuantity) {
        this.productId = productId;
        this.urlImage = urlImage;
        this.name = name;
        this.price = price;
        this.size = size;
        this.quantity = quantity;
        this.maxQuantity = maxQuantity;
    }

    public int getMaxQuantity() {
        return maxQuantity;
    }

    public void setMaxQuantity(int maxQuantity) {
        this.maxQuantity = maxQuantity;
    }
}
