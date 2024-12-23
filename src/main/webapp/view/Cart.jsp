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

<html>
<head>
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="/css/Cart.css">
</head>
<body>

<form action="/product" method="post" >
    <c:if test="${not empty cart}">
        <div>
            <img src="/img/logo.png" width="100px" height="70px">
            <h1 style="margin-top: -50px;margin-left: 100px;padding: 10px">| Giỏ hàng</h1>
        </div>
        <table style="margin: auto">
            <thead>
            <tr style="height: 40px">
                <th scope="col"></th>
                <th scope="col">Ảnh</th>
                <th scope="col">Tên Sản Phẩm</th>
                <th scope="col">Giá</th>
                <th scope="col">Size</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Số tiền</th>
                <th scope="col">Thao Tác</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${cart}" var="item" varStatus="status">
                <tr style="height: 100px">
                    <td><input type="checkbox" name="name_${item.productId}" value="${item.productId}"></td>
                    <td><img style="max-width: 100px; max-height: 100px" src="${item.urlImage}"></td>
                    <td>
                            ${item.name}
                    </td>
                    <td>
                        <label>${item.price} nvđ</label>
                    </td>
                    <td>
                        <select name="size">
                            <option value="S">S</option>
                            <option value="M">M</option>
                            <option value="L">L</option>
                            <option value="XL">XL</option>
                        </select>
                    </td>
                    <td>
                        <input style="width: 50px" type="number" name="quantity_${item.productId}"
                               value="${item.quantity}" min="1" max="${product.quantity}">
                    </td>
                    <td>
                        <label>${item.price * item.quantity} vnđ</label>
                    </td>
                    <td>
                        <div class="action-buttons">
                            <form action="">
                                <button class="delete">Xóa</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty cart}">
        <p style="text-align: center; color: red; font-size: 18px;">Giỏ hàng của bạn hiện tại chưa có sản phẩm!</p>
    </c:if>
</form>

</body>
</html>
