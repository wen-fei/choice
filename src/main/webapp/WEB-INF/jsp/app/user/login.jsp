<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/5/9
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../jsp/common/tag.jsp" %>
<html>
<head>
    <title>登录</title>
    <meta charset="utf8">
    <script src="../../../../style/js/jquery.min.js"></script>
    <script src="../../../../style/js/bootstrap.js"></script>
    <link rel="stylesheet" href="../../../../style/css/login/login.css">
    <link rel="stylesheet" href="../../../../style/css/bootstrap.css">
    <link rel="stylesheet" href="../../../../style/css/login/logincommon.css">
</head>
<body style="background: url(../../../../style/imgs/login_imgs/login_bg.jpg) no-repeat #E9F0F4;">
<div id="wrapper">
    <div class="aw-login-box">
        <div class="mod-body clearfix">
            <div class="content pull-left">
                <h1 class="logo"><a href=""></a></h1>
                <form class="form-group" action="/app/login/login" method="post" id="loginForm">
                    <div class="form-group">
                        <label for="">用户名</label>
                        <input class="form-control" type="text" placeholder="" name="user_name">
                    </div>
                    <div class="form-group">
                        <label for="">密码</label>
                        <input class="form-control" type="password" placeholder="" name="password">
                    </div>
                    <div class="text-right">

                        <button class="btn btn-primary" type="submit">登录</button>
                        <button class="btn btn-danger" data-dismiss="modal" type="cancel">取消</button>
                    </div>
                </form>
            </div>
            <div class="side-bar pull-left">
                <div style="margin-top: 50px">
                    <p>不逼自己一把，</p>
                    <p>你都不知道你有多优秀。</p>
                </div>
            </div>
        </div>
        <div class="mod-footer">
            <span>还没有账号?</span>
            <a href="/app/login/registview">立即注册</a>&nbsp;&nbsp;•&nbsp;&nbsp;
        </div>
    </div>
</div>

<script type="text/javascript" src="../../../../style/js/app/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="../../../../style/js/app/formValidator.js"></script>
</body>
</html>
