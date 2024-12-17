package com.example.duanquanlybansach_java_jsp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionData {
    private static String URL = "jdbc:mysql://127.0.0.1:3306/Web_QuanLyBanQuanAo_JSP";
    private static String userName = "root";
    private static String pass = "tamtamtam";

    public ConnectionData() {
    }
    public static Connection connection() throws ClassNotFoundException, SQLException {
        Connection connection = null;

        Class.forName("com.mysql.jdbc.Driver");

        System.out.println("hehe");
        connection = DriverManager.getConnection(URL,userName,pass);
        return connection;
    }
}
