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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/DetailProduct.css">

<body>


<form id="detail">

    <h1 id="detailproduct">Chi tiết sản phẩm</h1>

    <h3 id="name" name="name"> tên sản phẩm: ${product.name}</h3>
    <h3 id="price" name="price">Giá hiện tại: ${product.price}</h3>
    <h3 id="quantity" name="quantity">Số lượng: ${product.quantity}</h3>
    <h3 id="discription" nonce="discription">Mô tả: ${product.description}</h3>


    <img id="img" src="${product.image}"/>

    <form action="">
        <button type="submit">Thêm giỏ hàng</button>
    </form>
</form>

</body>
</html>
