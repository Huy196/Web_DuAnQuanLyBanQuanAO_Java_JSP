<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/17/2024
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Xin chào Admin</title>
    <link rel="stylesheet" href="/css/HomeAdmin.css">
    <script src="/js/LoadDataProduct.js"></script>
</head>
<body>
<div id="left">
    <button onclick="loadHome()" name="Trang chủ">Trang chủ</button>
    <form action="/products?action=" method="get">
        <button>
            Sản phẩm
        </button>

    </form>
    <button name="Người Dùng">Người dùng</button>
    <button name="Đăng Xuất">Đăng xuất</button>
</div>
<div id="content" class="centent">
    <img src="https://gotrangtri.vn/wp-content/uploads/2020/06/b%C3%ACa3.jpg">
</div>
</body>
</html>
