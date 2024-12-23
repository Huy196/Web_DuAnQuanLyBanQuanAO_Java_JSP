<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/23/2024
  Time: 8:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="/css/Cart.css">
</head>
<body>
<form action="">
    <div>
        <img src="/img/logo.png" width="100px" height="70px">
        <h1 style="margin-top: -50px;margin-left: 100px;padding: 10px">|  Giỏ hàng</h1>
    </div>
    <table style="margin: auto">
        <thead>
        <tr style="height: 40px">
            <th scope="col">STT</th>
            <th scope="col">Ảnh</th>
            <th scope="col">Tên Sản Phẩm</th>
            <th scope="col">Giá</th>
            <th scope="col">Size</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Số tiền</th>
            <th scope="col">Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td><img src="https://khoinguonsangtao.vn/wp-content/uploads/2022/08/hinh-nen-gai-xinh.jpg" alt="Sản phẩm"
                     style="width: 50px; height: 50px;"></td>
            <td>Tên sản phẩm</td>
            <td>100.000 VND</td>
            <td>M</td>
            <td>2</td>
            <td>200.000 VND</td>
            <td>
                <div class="action-buttons">
                    <button class="delete">Xóa</button>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>
