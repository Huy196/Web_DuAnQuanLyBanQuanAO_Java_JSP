package com.example.duanquanlybansach_java_jsp.controller.client;

import com.example.duanquanlybansach_java_jsp.model.CartItem;
import com.example.duanquanlybansach_java_jsp.model.Product;
import com.example.duanquanlybansach_java_jsp.service.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/product")
public class CartServlet extends HttpServlet {

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");


        if (action == null || action.trim().isEmpty()) {
            action = " ";
        }

        List<CartItem> cart = (List<CartItem>) req.getSession().getAttribute("cart");

        if (cart == null){
            cart = new ArrayList<>();
        }

        switch (action){
            case "addToCart":
                int id = Integer.parseInt(req.getParameter("id"));

                int quantity = Integer.parseInt(req.getParameter("quantity"));
                addToCart(req,resp,cart,id,quantity);
                break;
            case "removeFromCart":
                remoteByIDToCart(req, resp, cart);
                break;
            case "showPayProduct":
                showPayProduct(req, resp);
                break;

            case "PayBill":
                payBill(req, cart);
                break;

        }
    }

    private void payBill(HttpServletRequest req, List<CartItem> cart) {
        String[] selectedProductIds = req.getParameterValues("selectedProductIds");
        List<Product> selectedProducts = new ArrayList<>();

        if (selectedProductIds != null) {
            for (String productId : selectedProductIds) {
                Product product = productDAO.selectProduct(Integer.parseInt(productId));
                selectedProducts.add(product);
            }
        }

        List<Product> carts = (List<Product>) req.getSession().getAttribute("cart");

        for (Product selectedCartItem : selectedProducts) {
            cart.removeIf(item -> item.getProductId() == selectedCartItem.getId());
        }
        req.getSession().setAttribute("cart", carts);
    }

    private void showPayProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String[] selectedProductIds = req.getParameterValues("selectedProductIds");
        List<Product> selectedProducts = new ArrayList<>();

        if (selectedProductIds != null) {
            for (String productId : selectedProductIds) {
                String quantityStr = req.getParameter("quantity_" + productId);
                String size = req.getParameter("size_" + productId);

                int quantitys = Integer.parseInt(quantityStr);
                Product product = productDAO.selectProduct(Integer.parseInt(productId));
                product.setQuantity(quantitys);
                product.setSize(size);
                selectedProducts.add(product);
            }
        }

        req.getSession().setAttribute("selectedProducts", selectedProducts);

        resp.sendRedirect("/view/PayCart.jsp");
    }

    public void remoteByIDToCart(HttpServletRequest req, HttpServletResponse resp, List<CartItem> cart) throws IOException {
        int ids = Integer.parseInt(req.getParameter("id"));

        cart.removeIf(item -> item.getProductId() == ids);
        updateCartItem(req, cart);
        req.getSession().setAttribute("cart", cart);
        resp.sendRedirect("/view/Cart.jsp");
    }

    private void updateCartItem(HttpServletRequest req, List<CartItem> cart) {
        int cartItem =cart.size();

        req.getSession().setAttribute("cartItem",cartItem);
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse resp, List<CartItem> cart, int id, int quantity) throws IOException {
        Product product = productDAO.selectProduct(id);

        boolean productExit = false;

        for (CartItem item : cart) {
            if (item.getProductId() == id) {
                item.setQuantity(item.getQuantity() + quantity);
                productExit = true;
                break;
            }
        }

        if (!productExit){
            CartItem cartItem = new CartItem(id,product.getImage(),product.getName(),product.getPrice(),product.getSize(),quantity);
            cart.add(cartItem);
        }

        req.getSession().setAttribute("cart",cart);
        resp.sendRedirect("/user?action=showCart");
    }
}
