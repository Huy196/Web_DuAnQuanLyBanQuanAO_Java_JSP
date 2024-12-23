<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Thêm Bootstrap JS và jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Quần Áo HT</title>
    <link rel="stylesheet" href="/css/homeUser.css">

</head>
<body>
<table style="position: fixed; top: 0;
    left: 0;
    width: 100%;
    background: white;
  margin-bottom: 10px;
z-index: 1000;">
    <tr>
        <td class="logo" style="width: 20%;">
            <h1>
                <a><img style="width: 40%" src="/img/logo.png"></a>
            </h1>
        </td>

        <td style="text-align: center;">
            <ul class="menu">
                <li>
                    Giày
                    <div class="dropdown-content">
                        <a href="#">Giày da</a>
                        <a href="#">Nike</a>
                        <a href="#">Adidas</a>
                        <a href="#">Balenciaga</a>
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
                <form action="/user?action=showCart" method="post">
                    <button type="submit" style="background:none; border:none;">
                        <span class="cart">🛒</span>
                    </button>
                </form>
                <div class="user-dropdown">
                    <span class="user-icon" id="userIcon">👤</span>
                    <div class="dropdown-content" id="dropdownContent">
                        <form action="/products?action=logoutHomeUser" method="post" onsubmit="return confirmLogout()">
                            <a href="#">Thông tin người dùng</a>
                            <button id="logoutBtn">🔓 Đăng xuất</button>
                        </form>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
<div style="margin-top: 110px" id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="/img/logochat.webp" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="/img/slide_4_img.webp" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="/img/slide_3_img.webp" alt="Third slide">
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


<section>
    <h1 style="font-weight: bold; padding: 10px">Danh sách sản phẩm</h1>

    <div class="container">
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-3" style="padding: 20px">
                    <div class="card">

                        <img src="${product.image}" class="card-img-top" alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="text-primary">${product.price}</p>
                        </div>
                        <div class="d-flex">
                            <form action="${pageContext.request.contextPath}/user?action=showDetailProduct&id=${product.id}"
                                  method="post">
                                <button type="submit"
                                        class="btn btn-danger ms-1">Chi tiết sản phẩm
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

</body>
</html>

<script>
    function confirmLogout() {
        const userConfirmed = confirm("Bạn có chắc chắn muốn đăng xuất không?");
        if (!userConfirmed) {
            return false;
        }
        return true;
    }
</script>
