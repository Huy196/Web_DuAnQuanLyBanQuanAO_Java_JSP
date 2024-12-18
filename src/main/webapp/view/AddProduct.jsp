<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/18/2024
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <title>Thêm sản phẩm</title>
    <link rel="stylesheet" href="/css/AddProduct.css">
    <script src="/js/AddProduct.js"></script>
    <script src="/js/Login.js"></script>
</head>
<body>
<h1>Thêm sản phẩm</h1>
<form action="products?action=add" method="post" onsubmit="return validateFormProduct()">
    <label for="name">Tên sản phẩm:</label>
    <input type="text" id="name" name="name" required
           oninvalid="showTemporaryMessage(this, 'Vui lòng nhập tên sản phẩm')"
    /><br><br>
    <label for="price">Giá:</label>
    <input type="number" id="price" name="price" required
           oninvalid="showTemporaryMessage(this, 'Vui lòng nhập giá sản phẩm')"
    /><br><br>
    <label for="size">Size:</label>
    <select id="size" name="size" required>
        <option value="S">S</option>
        <option value="M">M</option>
        <option value="L">L</option>
        <option value="XL">XL</option>
    </select><br><br>

    <label for="quantity">Số lượng:</label>
    <input type="number" id="quantity" name="quantity" required
           oninvalid="showTemporaryMessage(this, 'Vui lòng nhập số lượng sản phẩm')"
    /><br><br>

    <label for="description">Mô tả:</label>
    <input type="text" id="description" name="description" style="width: 300px;overflow-x: auto" required
           oninvalid="showTemporaryMessage(this, 'Vui lòng mô tả sản phẩm')"
    /><br><br>

    <label for="image">Link ảnh:</label>
    <input type="text" id="image" name="image" required
           oninvalid="showTemporaryMessage(this, 'Vui lòng điền ảnh sản phẩm')"
    /><br><br>
    <input type="submit" value="Thêm sản phẩm"/>
</form>
</body>
</html>
