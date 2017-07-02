<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../jsp/common/tag.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <meta charset="utf8">
    <script src="../../../../style/js/jquery.min.js"></script>
    <script src="../../../../style/js/bootstrap.js"></script>
    <link rel="stylesheet" href="../../../../style/css/login/regist.css">
    <link rel="stylesheet" href="../../../../style/css/bootstrap.css">
    <link rel="stylesheet" href="../../../../style/css/login/logincommon.css">
    <link rel="stylesheet" href="../../../../style/js/app/bootstrapValidator.min.css">

</head>
<body style="background: url(../../../../style/imgs/login_imgs/login_bg.jpg) no-repeat #E9F0F4;">
<div class="aw-register-box">
    <div class="mod-head">
        <a href=""></a>
    </div>
    <div class="mod-body">
        <form class="form-group form-horizontal" action="/app/login/regist" id="registForm" >
            <div class="form-group">

                    <label for="username" class="col-md-3 control-label">用户名</label>
                <div class="col-md-9">
                    <input id="username" onblur="checkIsUsername()" class="form-control" type="text" placeholder="6-15位字母或数字" name="user_name_regist">
                    <span id="usernameText" style="color: red"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-md-3 control-label">密码</label>
                <div class="col-md-9">
                    <input class="form-control" id="password" type="password" placeholder="至少6位字母或数字" name="user_password">
                </div>
            </div>
            <div class="form-group">
                <label for="repassword" class="col-md-3 control-label">确认</label>
                <div class="col-md-9">
                    <input class="form-control" id="repassword" type="password" placeholder="至少6位字母或数字" name="confirmPassword">
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-md-3 control-label">邮箱</label>
                <div class="col-md-9" >
                <input class="form-control" id="email" type="email" placeholder="例如:123@123.com" name="user_email">
                </div>
            </div>
            <div>
                <button class="btn btn-primary btn-large btn-block" type="submit">提交</button>
            </div>


        </form>
    </div>
    <div class="mod-footer">
        <span>已经有帐号？</span>
        <a href="/app/login/loginview"> 直接登录</a>
    </div>
</div>

<script type="text/javascript" src="../../../../style/js/app/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="../../../../style/js/app/formValidator.js"></script>
<script>
    //检查用户名是否存在
    function checkIsUsername() {
        var username = $('#username').val();
        if (username.length > 5) {
            $.ajax({
                type: "POST",//请求方式
                url: "${pageContext.request.contextPath}/app/login/"
                    + username + "/checkUsername",//发送请求地址
                dataType: "json",
                data: {//发送数据
                    username: $('#username').val()
                },
                //请求成功后的回调函数有两个参数
                success: function (data) {
                    if (data == '0') {
                        $('#usernameText').text("用户名已存在");
                        $('#usernameText').css('color', 'red');
//                        $('#submit').attr("disabled", "disabled");
                    } else {
                        $('#usernameText').text("用户名可以使用");
                        $('#usernameText').css('color', 'green');
//                        $('#submit').removeAttr("disabled");
                    }
                }
            });
        }
    }
</script>

</body>
</html>