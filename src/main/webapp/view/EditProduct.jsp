<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/18/2024
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa sản phẩm</title>
</head>
<body>
<h1>Sửa sản phẩm</h1>
<form action="products?action=edit&id=${product.id}" method="post">
    <label for="name">Tên sản phẩm:</label>
    <input type="text" id="name" name="name" value="${product.name}" required
<%--           oninvalid="showTemporaryMessage(this, 'Vui lòng nhập tên sản phẩm')"--%>
    /><br><br>
    <label for="price">Giá:</label>
    <input type="number" id="price" name="price" value="${product.price}" required
    /><br><br>
    <label for="size">Size:</label>
    <select id="size"  name="size" >
        <option value="${product.size}" >S</option>
        <option value="${product.size}"  >M</option>
        <option value="${product.size}"  >L</option>
        <option value="${product.size}"  >XL</option>
    </select><br><br>

    <label for="quantity">Số lượng:</label>
    <input type="number" id="quantity" name="quantity" value="${product.quantity}"  required
    /><br><br>

    <label for="description">Mô tả:</label>
    <input type="text" id="description" name="description" value="${product.description}"  style="width: 300px;overflow-x: auto" required
    /><br><br>

    <label for="image">Link ảnh:</label>
    <input type="text" id="image" value="${product.image}"  name="image"    oninput="updateImage()" required
    /><br><br>
    <img id="productImage" src="${product.image}" alt="Ảnh sản phẩm" style="max-width: 200px;"/><br><br>
    <input type="submit" value="Lưu sản phẩm"/>
</form>
</body>
</html>
<script type="text/javascript">
    function updateImage() {
        var imageUrl = document.getElementById('image').value;
        var imageElement = document.getElementById('productImage');
        imageElement.src = imageUrl;
    }
</script>
