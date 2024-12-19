package com.example.duanquanlybansach_java_jsp.controller.Admin;

import com.example.duanquanlybansach_java_jsp.ConnectionData;
import com.example.duanquanlybansach_java_jsp.model.Product;
import com.example.duanquanlybansach_java_jsp.model.User;
import com.example.duanquanlybansach_java_jsp.service.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductSevrlet", value = "/products")
public class ProductSevrlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        try {
            productDAO = new ProductDAO();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null || action.trim().isEmpty()) {
            action = " ";
        }
        switch (action) {
            case "search":
                try {
                    searchProductByName(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "logout":
                HttpSession session = req.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                req.getRequestDispatcher("/view/InterfaceLogin.jsp").forward(req, resp);
                break;
            case "logoutHomeUser":
                HttpSession session1 = req.getSession(false);
                if (session1 != null) {
                    session1.removeAttribute("IDuser");

                    System.out.println("Khi đăng xuất" + session1.getAttribute("IDuser"));
                }
                req.getRequestDispatcher("/view/InterfaceLogin.jsp").forward(req, resp);
                break;
            case "edit":
                try {
                    editProductById(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "add":
                try {
                    addProduct(req, resp);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "interfaceAdd":
                req.getRequestDispatcher("/view/AddProduct.jsp").forward(req, resp);
                break;
        }
    }

    private void editProductById(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        BigDecimal price = new BigDecimal(req.getParameter("price"));
        String size = req.getParameter("size");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String description = req.getParameter("description");
        String urlImage = req.getParameter("image");

        productDAO.updateProduct(new Product(id, name, price, size, quantity, description, urlImage));

        listAllProduct(req, resp);

        System.out.println(id);


    }

    private void addProduct(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException, ClassNotFoundException {
        String name = req.getParameter("name");
        BigDecimal price = new BigDecimal(req.getParameter("price"));
        String size = req.getParameter("size");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String description = req.getParameter("description");
        String urlImage = req.getParameter("image");

        Product product = new Product(name, price, size, quantity, description, urlImage);

        productDAO.insertProduct(product);

        listAllProduct(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if (action == null || action.trim().isEmpty()) {
            action = " ";
        }

        switch (action) {
            case "home":
                req.getRequestDispatcher("/view/HomeAdmin.jsp").forward(req, resp);
                break;

            case "edit":
                showProductByIDEdit(req, resp);
                break;
            default:
                try {
                    listAllProduct(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void showProductByIDEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        Product product = productDAO.selectProduct(id);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/EditProduct.jsp");
        req.setAttribute("product", product);

        dispatcher.forward(req, resp);
    }

    private void searchProductByName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String name = req.getParameter("text");

        List<Product> products = productDAO.searchName(name);
        req.setAttribute("products", products);
        if (name == null) {
            listAllProduct(req, resp);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/ListProduct.jsp");
        dispatcher.forward(req, resp);
    }


    private void listAllProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        List<Product> products = productDAO.selectAllProduct();
        req.setAttribute("products", products);


        String sql = "{CALL update_status_when_quantity_zero()}";

        Connection connection = ConnectionData.connection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.executeUpdate(sql);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/ListProduct.jsp");
        dispatcher.forward(req, resp);
    }
}
