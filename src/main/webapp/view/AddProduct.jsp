<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm sản phẩm</title>
        <link rel="stylesheet" href="/css/AddProduct.css">
        <script src="/js/AddProduct.js" defer></script>
        <script src="/js/Login.js" defer></script>
    </head>
</head>
<body>

<form action="products?action=add" method="post">
    <h1>Thêm Sản Phẩm Mới</h1>
    <label for="name">Tên sản phẩm:</label>
    <input type="text" id="name" name="name"><br><br>

    <label for="price">Giá:</label>
    <input type="number" id="price" name="price"><br><br>

    <label for="size">Size:</label>
    <select id="size" name="size">
        <option value="S">S</option>
        <option value="M">M</option>
        <option value="L">L</option>
        <option value="XL">XL</option>
        <option value="XL">XXL</option>
    </select><br><br>

    <label for="description">Mô tả:</label>
    <input type="text" id="description" name="description" required
           oninvalid="showTemporaryMessage(this, 'Vui lòng mô tả sản phẩm')"
    /><br><br>

    <label for="quantity">Số lượng:</label>
    <input type="number" id="quantity" name="quantity"><br><br>

    <button type="submit">Thêm sản phẩm</button>
</form>
</body>
</html>
