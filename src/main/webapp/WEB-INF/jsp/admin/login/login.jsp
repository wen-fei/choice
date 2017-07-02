<%@ page pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--引入jstl-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登陆界面</title>
    <link rel="icon" href="../../../../style/imgs/login_imgs/Bar_code_128px_1143884_easyicon.net.ico" type="image/x-icon">
    <link rel="stylesheet" href="../../../../style/css/bootstrap.css">
    <link rel="stylesheet" href="../../../../style/css/login/style.css">
</head>
<body>
<h1>考研论坛后台管理</h1>
<div class="login-form">
    <div class="head-info">
        <label class="lbl-1"> </label>
        <label class="lbl-2"> </label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"> </div>
    <div class="avtar">
        <img src="../../../../style/imgs/app/forum/logo.png"/>
    </div>
    <form method="post" action="/admin/login">
        <input type="text" class="text" name="adminusername">
        <div class="key">
            <input type="password" name="adminpwd">
        </div>
        <div class="signin">
            <input type="submit" value="登录" id="login">
        </div>
    </form>

</div>
</body>
<script type="text/javascript" src="../../../../style/js/jquery.min.js"></script>
<script type="text/javascript" src="../../../../style/js/bootstrap.js"></script>
</html>