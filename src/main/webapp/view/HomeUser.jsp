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
                        <a href="#">Quần đùi</a>
                        <a href="#">Áo phông</a>
                        <a href="#">Áo vest</a>
                        <a href="#">Quần dài</a>
                        <a href="#">Áo sơ mi</a>
                        <a href="#">Áo len</a>
                        <a href="#">Áo khoác</a>
                    </div>
                </li>
                <li>
                    Bán Chạy
                    <div class="dropdown-content">
                        <a href="#">Quần jean</a>
                        <a href="#">Áo sơ mi</a>
                        <a href="#">Áo khoác</a>
                        <a href="#">Áo thun</a>
                        <a href="#">Quần short</a>
                    </div>
                </li>
                <li>
                    Quần
                    <div class="dropdown-content">
                        <a href="#">Quần kaki</a>
                        <a href="#">Quần short</a>
                        <a href="#">Quần jogger</a>
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
                        <p><strong>Thông tin người dùng</strong></p>
                        <%--                    <ul>--%>
                        <%--                        <li>Tên: Nguyễn Văn A</li>--%>
                        <%--                        <li>Email: example@gmail.com</li>--%>
                        <%--                    </ul>--%>
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
</body>
</html>
