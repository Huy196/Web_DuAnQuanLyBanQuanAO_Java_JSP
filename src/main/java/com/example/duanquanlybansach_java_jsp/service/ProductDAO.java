package com.example.duanquanlybansach_java_jsp.service;

import com.example.duanquanlybansach_java_jsp.ConnectionData;
import com.example.duanquanlybansach_java_jsp.model.Product;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IDProduct {


    private static final String Select_All_Products = "select * from product order by IDproduct desc";
    private static final String Search_Products = "select * from product where Name like ?";
    private static final String Update_Product_By_Id = "update product set Status = false where IDproduct = ?";

    public ProductDAO() throws SQLException, ClassNotFoundException {
    }

    @Override
    public void insertProduct(Product product) throws SQLException {

    }

    @Override
    public Product selectProduct(int id) {
        return null;
    }

    @Override
    public List<Product> selectAllProduct() {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = ConnectionData.connection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(Select_All_Products);

            while (resultSet.next()) {
                int id = resultSet.getInt("IDproduct");
                String image = resultSet.getString("Image");
                String name = resultSet.getString("Name");
                BigDecimal price = resultSet.getBigDecimal("Price");
                int quantity = resultSet.getInt("Quantity");
                String description = resultSet.getString("Description");
                Boolean status = resultSet.getBoolean("Status");

                products.add(new Product(id, image, name, price, quantity, description, status));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    @Override
    public List<Product> searchName(String name) {

        List<Product> products = new ArrayList<>();
        try {
            Connection connection = ConnectionData.connection();
            PreparedStatement preparedStatement = connection.prepareStatement(Search_Products);
            preparedStatement.setString(1,"%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("IDproduct");
                String image = resultSet.getString("Image");
                String names = resultSet.getString("Name");
                BigDecimal price = resultSet.getBigDecimal("Price");
                int quantity = resultSet.getInt("Quantity");
                String description = resultSet.getString("Description");
                Boolean status = resultSet.getBoolean("Status");

                products.add(new Product(id, image, names, price, quantity, description, status));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return products;

    }

    @Override
    public boolean updateStatusProduct(int id) throws SQLException, ClassNotFoundException {
        try {
            Connection connection = ConnectionData.connection();

            PreparedStatement preparedStatement = connection.prepareStatement(Update_Product_By_Id);
            preparedStatement.setInt(1, id);

            int row = preparedStatement.executeUpdate();
            if (row > 0) {
                System.out.println("uehhe");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException, ClassNotFoundException {
        return false;
    }
}
