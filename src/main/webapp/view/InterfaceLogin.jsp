<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/16/2024
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <title>Login</title>
    <link rel="stylesheet" href="/css/Login.css">
    <script src="/js/Login.js"></script>
</head>
<body class="container">
    <div class="login-box">
        <h1 style="color: white">Đăng nhập</h1>
        <form action="/login?action=login" method="post">
            <div class="user-box">
                <input type="text" name="email" required
                       oninvalid="showTemporaryMessage(this, 'Vui lòng nhập email của bạn')"
                       oninput="this.setCustomValidity('')">
                <label>Email</label>
            </div>
            <div class="user-box">
                <input type="password" name="password" required
                       oninvalid="this.setCustomValidity(this, 'Vui lòng nhập mật khẩu của bạn')"
                       oninput="this.setCustomValidity('')">
                <label>Mật khẩu</label>
            </div>
            <button type="submit" name="submit">Đăng nhập</button>
        </form>
        <a href="/login?action=redirectRegister" class="sign-up-btn" methods="GET">Chưa có tài khoản? Đăng ký</a>
    </div>
</body>
</html>
