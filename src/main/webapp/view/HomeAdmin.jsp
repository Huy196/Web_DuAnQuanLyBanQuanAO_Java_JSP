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
    <div id="left" >
        <button onclick="loadHome()" name="Trang chủ">Trang chủ</button>
        <button onclick="loadProductPage()">Sản phẩm</button>
        <button name="Người Dùng">Người dùng</button>
        <button name="Đăng Xuất">Đăng xuất</button>
    </div>
    <div id="content" class="centent" >
    <h1 style="text-align: center;font-size: 3.0rem">Danh sách sản phẩm</h1> <br>
    <div style="display: flex; flex-direction: column; align-items: flex-start; gap: 20px; margin-top: -20px">
        <div style="display: flex; align-items: center; gap: 10px;">
            <input type="text" placeholder="Nhập từ khóa..."
                   style="width: 300px; height: 45px; padding: 5px; border: 1px solid #ccc; border-radius: 5px; font-size: 14px">
            <button type="submit"
                    style="width: 120px; background-color: #007BFF; color: white; border: none; border-radius: 5px; cursor: pointer;margin-top: 10px;text-align: center">
                Tìm kiếm
            </button>
        </div>
        <div>
            <button id="button" type="submit"
                    style="width: 200px;margin-left: 820px; background-color: #28A745; color: white; font-size: 16px;
                border: none; border-radius: 5px; cursor: pointer;margin-top: -74px;">
                Thêm sản phẩm

            </button>
        </div>
    </div>
    <table style="margin-top: -20px" class="table" width="70%">
        <thead>
        <tr>
            <th id="" scope="col">STT</th>
            <th scope="col">Hình ảnh</th>
            <th scope="col">Tên sản phầm</th>
            <th scope="col">Giá</th>
            <th scope="col">Size</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Mô tả</th>
            <th scope="col">Trạng thái</th>
            <th scope="col">Chức Năng</th>
        </tr>
        </thead>
        <c:forEach var="user" items="${users}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.image}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.price}"/></td>
                <td><c:out value="${user.size}"/></td>
                <td><c:out value="${user.quantity}"/></td>
                <td><c:out value="${user.description}"/></td>
                <td><c:out value="${user.status}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    </div>
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
