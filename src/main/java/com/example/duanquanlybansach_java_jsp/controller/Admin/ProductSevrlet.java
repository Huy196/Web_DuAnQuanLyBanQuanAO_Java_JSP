package com.example.duanquanlybansach_java_jsp.controller.Admin;

import com.example.duanquanlybansach_java_jsp.model.Product;
import com.example.duanquanlybansach_java_jsp.model.User;
import com.example.duanquanlybansach_java_jsp.service.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null || action.trim().isEmpty()) {
            action = " ";
        }

        switch (action) {
            case "add":
                System.out.println("hehe");
                break;
            case "home":
                req.getRequestDispatcher("/view/HomeAdmin.jsp").forward(req, resp);
                break;
            case "delete":
                try {
                    updateStatusProductById(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                listAllProduct(req, resp);
                break;
        }
    }

    private void updateStatusProductById(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        productDAO.updateStatusProduct(id);

        listAllProduct(req, resp);
    }

    private void listAllProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productDAO.selectAllProduct();
        req.setAttribute("products", products);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/ListProduct.jsp");
        dispatcher.forward(req, resp);
    }
}
