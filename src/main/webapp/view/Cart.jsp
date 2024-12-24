<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/23/2024
  Time: 8:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/homeUser.css">

<script src="/js/Cart.js"></script>


<html>
<head>
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="/css/Cart.css">
</head>
<body>
<div style="height: 520px">
    <form action="/product" method="post">
        <c:if test="${not empty cart}">
        <div style="display: flex">
            <img src="/img/logo.png" width="100px" height="70px">
            <h1 style="padding: 10px;width: 100%">| Giỏ hàng</h1>

            <div class="search-cart" style="width: 60% ; margin-left: 700px">
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
                        <form action="/products?action=logoutHomeUser" method="post"
                              onsubmit="return confirmLogout()">
                            <a href="#">Thông tin người dùng</a>
                            <button id="logoutBtn">🔓 Đăng xuất</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <div style="margin: auto; width: 90%; margin-top: 20px; overflow-y: auto; max-height: 500px; border: 1px solid #ccc;">
            <table style="text-align: center;width: 100%">
                <thead style="margin-top: -10px">
                <tr style="height: 40px">
                    <th style="position: sticky; top: 0;" scope="col"></th>
                    <th style="position: sticky; top: 0;" scope="col">Ảnh</th>
                    <th style="position: sticky; top: 0;" scope="col">Tên Sản Phẩm</th>
                    <th style="position: sticky; top: 0;" scope="col">Giá</th>
                    <th style="position: sticky; top: 0;" scope="col">Size</th>
                    <th style="position: sticky; top: 0;" scope="col">Số lượng</th>
                    <th style="position: sticky; top: 0;" scope="col">Số tiền</th>
                    <th style="position: sticky; top: 0;" scope="col">Thao Tác</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${cart}" var="item" varStatus="status">
                    <tr style="height: 100px">
                        <td>
                            <input type="checkbox" name="name_${item.productId}" value="${item.productId}"
                                   onclick="updateTotal()">
                        </td>
                        <td><img style="max-width: 100px; max-height: 100px" src="${item.urlImage}"></td>
                        <td>
                                ${item.name}
                        </td>
                        <td>
                            <label>${item.price} đ</label>
                        </td>
                        <td>
                            <select style="text-align: center" name="size">
                                <option value="S">S</option>
                                <option value="M">M</option>
                                <option value="L">L</option>
                                <option value="XL">XL</option>
                            </select>
                        </td>
                        <td>
                            <input style="width: 50px;text-align: center" type="number"
                                   name="quantity_${item.productId}"
                                   value="${item.quantity}" min="1" max="${product.quantity}"
                                   onchange="updateTotal()">
                        </td>
                        <td>
                            <label> <fmt:formatNumber value="${item.price * item.quantity}" type="currency"
                                                      currencySymbol="đ" pattern="#,##0"/>.000 đ
                            </label>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <form action="/product?action=removeFromCart" method="post">
                                        <%--                                        <input type="hidden" name="action" value="removeFromCart">--%>
                                    <input type="hidden" name="id" value="${item.productId}">
                                    <button type="submit" class="delete">Xóa</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>


    </form>
</div>


<div style="display: flex;width: 90%;text-align: center;margin-top: 110px;margin-left: 100px">
    <form action="">
        <input id="selectAll" style="width: 25px;height: 15px" type="checkbox" value=""> Chọn tất cả
    </form>
    <form style="margin-top: 1px;height: 30px;display: flex" action="">
        <label id="total" style="width: 200px;margin-left: 900px;color: red"></label>
        <button style="margin-left: 10px ;margin-top: -10px; text-align: center;background: red;color: white" type="submit">Thanh toán</button>
    </form>
</div>
</c:if>

<c:if test="${empty cart}">
    <p style="text-align: center; color: red; font-size: 18px;">Giỏ hàng của bạn hiện tại chưa có sản phẩm!</p>
</c:if>

</body>
</html>
