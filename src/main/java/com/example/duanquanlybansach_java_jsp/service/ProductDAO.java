package com.example.duanquanlybansach_java_jsp.service;

import com.example.duanquanlybansach_java_jsp.ConnectionData;
import com.example.duanquanlybansach_java_jsp.model.Bill;
import com.example.duanquanlybansach_java_jsp.model.DetailBill;
import com.example.duanquanlybansach_java_jsp.model.Product;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IDProduct {


    private static final String Select_All_Products = "select * from product order by IDproduct desc";
    private static final String Search_Products = "select * from product where Name like ?";

    private static final String Select_Product_By_ID = "select * from product where IDproduct = ?";

    private static final String Inser_into_Product = "INSERT INTO Product (Name, Price, Size, Quantity, Description, Image, Status) VALUES (?,?,?,?,?,?, IF(Quantity > 0, 1, 0))";

    private static final String Update_Product_By_ID = "update product set Name = ?, Price = ?, Size = ?, Quantity = ?, Description = ?, Image =? where IDproduct =?";

    public ProductDAO() throws SQLException, ClassNotFoundException {
    }

    @Override
    public void insertProduct(Product product) throws SQLException {
        try {
            Connection connection = ConnectionData.connection();

            PreparedStatement preparedStatement = connection.prepareStatement(Inser_into_Product);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setBigDecimal(2, product.getPrice());
            preparedStatement.setString(3, product.getSize());
            preparedStatement.setInt(4, product.getQuantity());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setString(6, product.getImage());

            int row = preparedStatement.executeUpdate();
            if (row > 0) {
                System.out.println("Thành công");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public Product selectProduct(int id) {
        Product product = null;
        try {
            Connection connection = ConnectionData.connection();

            PreparedStatement preparedStatement = connection.prepareStatement(Select_Product_By_ID);
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String image = resultSet.getString("Image");
                String names = resultSet.getString("Name");
                BigDecimal price = resultSet.getBigDecimal("Price");
                String size = resultSet.getString("Size");
                int quantity = resultSet.getInt("Quantity");
                String description = resultSet.getString("Description");

                product = new Product(id, image, names, price, size, quantity, description);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return product;
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
            preparedStatement.setString(1, "%" + name + "%");
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
    public boolean updateProduct(Product product) throws SQLException, ClassNotFoundException {
        boolean row = false;
        try {
            Connection connection = ConnectionData.connection();

            PreparedStatement preparedStatement = connection.prepareStatement(Update_Product_By_ID);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setBigDecimal(2, product.getPrice());
            preparedStatement.setString(3, product.getSize());
            preparedStatement.setInt(4, product.getQuantity());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setString(6, product.getImage());
            preparedStatement.setInt(7, product.getId());


            row = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    @Override
    public int inserintoBill(Bill bill) throws SQLException {
        String SQL = "insert into bill (IDuser,Datetime,TotalPrice,PTTT,Status) values (?,now(),?,?,'Chưa giao hàng')";

        int id = 0;
        try {
            Connection connection = ConnectionData.connection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, bill.getUserId());
            preparedStatement.setBigDecimal(2, bill.getTotal());
            preparedStatement.setString(3, bill.getPTTT());

            preparedStatement.executeUpdate();

            try (ResultSet resultSet = preparedStatement.getGeneratedKeys()) {
                if (resultSet.next()) {
                    id = resultSet.getInt(1);
                } else {
                    System.out.println("No generated keys returned.");
                }

            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public void inserintoDetailBill(DetailBill detailBill) throws SQLException {
        String SQL_detail = "insert into detailbill (IDbill,IDproduct,Quantity,Size,UnitPrice) values (?,?,?,?,?)";

        try {
            Connection connection = ConnectionData.connection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL_detail);
            preparedStatement.setInt(1, detailBill.getIdBill());
            preparedStatement.setInt(2, detailBill.getProductId());
            preparedStatement.setInt(3, detailBill.getQuantity());
            preparedStatement.setString(4, detailBill.getSize());
            preparedStatement.setBigDecimal(5, detailBill.getPrice());

            preparedStatement.execute();


        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
