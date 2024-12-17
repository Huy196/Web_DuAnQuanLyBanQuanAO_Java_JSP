package com.example.duanquanlybansach_java_jsp.controller;

import com.example.duanquanlybansach_java_jsp.ConnectionData;
import sun.rmi.server.Dispatcher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        Connection connection = null;


        String SQL = "select * from user where Email = ? and Password = ?";

        try {
            connection = ConnectionData.connection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, pass);

            ResultSet row = preparedStatement.executeQuery();

            if (row.next()) {
                int id = row.getInt("IDuser");
                String role = row.getString("Role");
                if ("admin".equalsIgnoreCase(role)) {
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/view/HomeAdmin.jsp");
                    dispatcher.forward(req, resp);
                } else {
                    req.setAttribute("IDuser", id);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/view/HomeUser.jsp");
                    dispatcher.forward(req, resp);
                }
            } else {
                req.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/view/InterfaceLogin.jsp");
                dispatcher.forward(req, resp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
