package com.example.duanquanlybansach_java_jsp.service;

import com.example.duanquanlybansach_java_jsp.model.Bill;
import com.example.duanquanlybansach_java_jsp.model.DetailBill;
import com.example.duanquanlybansach_java_jsp.model.Product;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public interface IDProduct {
    void insertProduct(Product product) throws SQLException;

    Product selectProduct(int id);

    List<Product> selectAllProduct();
    List<Product> selectAllProductUser();

    List<Product> searchName(String name);

    void updateQuantityProductWhenSuccess(int id, int quantity);


    boolean updateProduct(Product product) throws SQLException, ClassNotFoundException;

    int inserintoBill(Bill bill) throws SQLException;

    void inserintoDetailBill(DetailBill detailBill) throws SQLException;
}
