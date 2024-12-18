package com.example.duanquanlybansach_java_jsp.service;
import com.example.duanquanlybansach_java_jsp.model.Product;
import java.sql.SQLException;
import java.util.List;

public interface IDProduct {
    void insertProduct(Product product) throws SQLException;

    Product selectProduct(int id);

    List<Product> selectAllProduct();

    boolean updateStatusProduct(int id) throws SQLException, ClassNotFoundException;

    boolean updateProduct(Product product) throws SQLException, ClassNotFoundException;
}
