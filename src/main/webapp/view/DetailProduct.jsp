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


<form action="/product?action=addToCart&id=${product.id}" method="post">
    <h1>Chi tiết sản phẩm</h1>
    <h3 name="name">Tên sản phẩm: ${product.name}</h3>
    <h3 name="price">Giá sản phẩm: ${product.price}</h3>
    <h3>Số lượng: <input type="number" name="quantity" value="1" min="1" max="${product.quantity}"></h3>
    <h3 nonce="discription">Mô tả: ${product.description}</h3>
    <img src="${product.image}"/>
    <br><br>

    <button  type="submit">Thêm rỏ hàng</button>
</form>

</body>
</html>
