<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Thêm Bootstrap JS và jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Quần Áo HT</title>
    <link rel="stylesheet" href="/css/homeUser.css">

</head>
<body>
<table>
    <tr>
        <td class="logo" style="width: 20%;">
            <h1>
                <a><img style="width: 40%" src="/img/logo.png"></a>
            </h1>
        </td>

        <td style="text-align: center;">
            <ul class="menu">
                <li>
                    Sale 80%
                    <div class="dropdown-content">
                        <a href="#">Áo phông</a>
                        <a href="#">Áo vest</a>
                        <a href="#">Quần dài</a>
                        <a href="#">Áo sơ mi</a>
                        <a href="#">Áo khoác</a>
                    </div>
                </li>
                <li>
                    Bán Chạy
                    <div class="dropdown-content">
                        <a href="#">Áo sơ mi</a>
                        <a href="#">Áo khoác</a>
                        <a href="#">Áo thun</a>
                        <a href="#">Quần short</a>
                    </div>
                </li>
                <li>
                    Quần
                    <div class="dropdown-content">
                        <a href="#">Quần short</a>
                        <a href="#">Quần bò</a>
                        <a href="#">Quần tây</a>
                    </div>
                </li>
                <li>
                    Áo
                    <div class="dropdown-content">
                        <a href="#">Áo thun</a>
                        <a href="#">Áo len</a>
                        <a href="#">Áo sơ mi</a>
                        <a href="#">Áo khoác</a>
                    </div>
                </li>
            </ul>
        </td>

        <td style="text-align: right; width: 20%;">
            <div class="search-cart">
                <input type="text" class="search-input" placeholder="Tìm kiếm">
                <button class="search-btn">🔎</button>
                <span class="cart">🛒</span>
                <div class="user-dropdown">
                    <span class="user-icon" id="userIcon">👤</span>
                    <div class="dropdown-content" id="dropdownContent">
                        <a href="#">Thông tin người dùng</a>
                        <button id="logoutBtn">🔓 Đăng xuất</button>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="/img/tải xuống.jpg" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="/img/tải xuống (1).jpg" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="/img/tải xuống (2).jpg" alt="Third slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<h1 id="list" >Danh mục sản phẩm</h1>

<section>
    <div class="container">
        <div class="card">
            <img src="data:image/jpeg;base64,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" class="card-img-top" alt="Áo Cộc">
            <div class="card-body">
                <h5 class="card-title">Áo Cộc</h5>
                <p class="text-primary">Giá: 230000 VND</p>
            </div>
            <div class="d-flex">
                <button class="btn btn-danger ms-1">Thêm vào giỏ hàng</button>
            </div>
        </div>
            </div>

        </div>
    </div>
</section>

</body>
</html>
