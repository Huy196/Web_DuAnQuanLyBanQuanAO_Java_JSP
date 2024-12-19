<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/19/2024
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
</head>
<body>
<h1>Chi tiết sản phẩm</h1>

<form>
    <h3 name="name">Tên sản phẩm: ${product.name}</h3>
    <h3 name="price">Giá sản phẩm: ${product.price}</h3>
    <h3 name="quantity">Số lượng: ${product.quantity}</h3>
    <h3 nonce="discription">Mô tả: ${product.description}</h3>
    <img src="${product.image}"/>
    <br><br>

    <form action="">
        <button type="submit">Thêm rỏ hàng</button>
    </form>
</form>

</body>
</html>
