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
<h1>Thêm sản phẩm</h1>
<form action="products?action=add" method="post" onsubmit="return validateFormProduct()">

    <label for="name">Tên sản phẩm:</label>
    <input type="text" id="name" name="name" required
           oninvalid="showTemporaryMessage(this, 'Vui lòng điền tên sản phẩm')"
    ><br><br>

    <label for="price">Giá:</label>
    <input type="number" id="price" name="price" required
           oninvalid="showTemporaryMessage(this, 'Vui lòng điền giá sản phẩm')"
    ><br><br>

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
           oninvalid="showTemporaryMessage(this, 'Vui lòng điền mô tả sản phẩm')"
    /><br><br>

    <label for="quantity">Số lượng:</label>
    <input type="number" id="quantity" name="quantity" required
           oninvalid="showTemporaryMessage(this, 'Vui lòng điền số lượng sản phẩm')"
    ><br><br>
    <label for="image">Link ảnh:</label>
    <input type="text" id="image" name="image" required
           oninvalid="showTemporaryMessage(this, 'Vui lòng điền ảnh sản phẩm')"
           oninput="updateImage()"
    /><br><br>
    <img id="productImage" src="${product.image}" alt="Ảnh sản phẩm" style="max-width: 200px;"/><br><br>

    <button type="submit">Thêm sản phẩm</button>
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
