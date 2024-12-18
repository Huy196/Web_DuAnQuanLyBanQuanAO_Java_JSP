<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/17/2024
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/List.css">
    <script src="/js/LoadDataProduct.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body style="width: 98%;padding: 15px">
<h1 style="text-align: center;font-size: 4.0rem">Danh sách sản phẩm</h1> <br>
<div style="display: flex; flex-direction: column; align-items: flex-start; gap: 20px; margin-top: -20px">
    <div style="display: flex; align-items: center; gap: 10px;">
        <form action="products?action=search" method="post">
            <input name="text" type="text" placeholder="Nhập từ khóa..."
                   style="width: 300px; height: 45px; padding: 5px; border: 1px solid #ccc; border-radius: 5px; font-size: 14px">
            <button type="submit"
                    style="width: 120px; background-color: #007BFF; color: white; border: none; border-radius: 5px; cursor: pointer;margin-top: 10px;text-align: center">
                Tìm kiếm
            </button>
        </form>
    </div>
    <form action="products?action=interfaceAdd" method="post">
        <div>
            <button id="button" type="submit"
                    style="width: 200px;margin-left: 820px; background-color: #28A745; color: white; font-size: 16px;
                border: none; border-radius: 5px; cursor: pointer;margin-top: -74px;">
                Thêm sản phẩm
            </button>
        </div>
    </form>

    <div>
        <button onclick="loadHome()" type="button"
                style="width: 200px;margin-left: 1200px; background-color: #28A745; color: white; font-size: 16px;
                border: none; border-radius: 5px; cursor: pointer;margin-top: -110px;">
            Quay lai trang chủ
        </button>
    </div>

</div>
<table style="margin-top: -35px">
    <thead >
    <tr style="height: 45px">
        <th style="background: #e1a7a7">STT</th>
        <th style="background: #e1a7a7">Hình ảnh</th>
        <th style="background: #e1a7a7">Tên sản phầm</th>
        <th style="background: #e1a7a7">Giá</th>
        <th style="background: #e1a7a7">Số lượng</th>
        <th style="background: #e1a7a7">Mô tả</th>
        <th style="background: #e1a7a7">Trạng thái</th>
        <th style="background: #e1a7a7">Chức Năng</th>
    </tr>
    </thead>
    <c:forEach var="products" items="${products}">
        <tr>
            <td><c:out value="${products.id}"/></td>
            <td><img src="${products.image}" width="100px" height="100px"></td>
            <td><c:out value="${products.name}"/></td>
            <td><c:out value="${products.price}"/> vnđ</td>
            <td><c:out value="${products.quantity}"/></td>
            <td><c:out value="${products.description}"/></td>
            <td><c:out value="${products.status}"/></td>
            <td>
                <a href="/products?action=edit&id=${products.id}">Sửa</a>
            </td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
