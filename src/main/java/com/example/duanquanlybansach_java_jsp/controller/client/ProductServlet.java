package com.example.duanquanlybansach_java_jsp.controller.client;

import com.example.duanquanlybansach_java_jsp.model.Product;
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

@WebServlet(value = "/user")
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
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
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null || action.trim().isEmpty()) {
            action = " ";
        }

        switch (action) {

            default:
                showListHomeUser(req, resp);
                break;
        }
    }

    private void showCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect("/view/Cart.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null || action.trim().isEmpty()) {
            action = " ";
        }

        switch (action){
            case "showDetailProduct":
                    showDetailProductByID(req,resp);
                break;

            case "showCart":
                showCart(req,resp);
                break;
        }
    }

    private void showListHomeUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productDAO.selectAllProductUser();
        req.setAttribute("products", products);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/HomeUser.jsp");
        dispatcher.forward(req, resp);

    }

    private void showDetailProductByID(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        Product product = productDAO.selectProduct(id);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/DetailProduct.jsp");
        req.setAttribute("product", product);

        dispatcher.forward(req, resp);

    }
}
