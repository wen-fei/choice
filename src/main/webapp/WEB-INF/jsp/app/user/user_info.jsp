<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../jsp/common/tag.jsp" %>

<html>
<head>
    <meta charset="utf8">
    <title>个人信息</title>
    <link rel="stylesheet" href="../../../../style/css/bootstrap.css">
    <link rel="stylesheet" href="../../../../style/css/app/index-css.css">
    <style>
        .avt{
            display: inline;
            float: left;
        }
        .mt {
            padding: 10px 0;
            font-size: 16px;
            padding-bottom: 0;
        }
        .pfl em{
            padding-right: 10px;
            color: #666;
        }
        em, cite, i {
            font-style: normal;
        }
        ul, li {
            margin: 0;
            padding: 0;
        }
        #user_info_detail li{
            display: block;
            float: left !important;
            width: 300px !important;
        }
        ul li, .xl li {
            list-style: none;
        }
        #pt {
            border: none;
            height: 30px;
            line-height: 30px;
            font-size: 14px;
            margin: 0 0 10px;
        }
        #pt .z {
            padding-right: 10px;
            z-index: 99;
            clear: left;
        }
        .z {
            float: left;
        }
        #pt .nvhm {
            background: url(../images/mianbaoxie_ico.png) left bottom no-repeat;
            width: 16px;
        }
        a:link, a:visited, a:active {
            /*color: #7b7b7b;*/
        }
        a {
            color: #337ab7;
            text-decoration: none;
        }
    </style>
</head>
<body style="background: #E3E5E8;">
<div clasa="hd">
    <div class="navbar navbar-default navbarcolor" style="background-color: #fff;">
        <div id="logo" class="col-md-6">
            <img src="../../../../style/imgs/app/forum/logo.png" alt="">
        </div>
        <div class="col-md-3" style="margin-top: 20px">
            <form action="/app/search" id="searchForm">
                <div class="input-group" style="margin-top:0px; positon:relative" id="search">

                    <input type="text" class="form-control" placeholder="请输入搜索内容" name="searchKey">
                    <span class="input-group-btn">
                           <button class="btn btn-info btn-search" type="submit">搜索</button>
                        </span>

                </div>
            </form>
        </div>
        <!--顶部右侧账户-->
        <div id="userLogin" class="col-md-3">
            <ul class="Hui-userbar" style="margin-top: 20px;">

                <c:if test="${sessionScope.UserInfo_session == '用户退出成功' || empty sessionScope.UserInfo_session}">
                    <li>
                        <a  href="/app/login/registview" class="btn btn-success">
                            <span class="glyphicon glyphicon-user"></span> 注册
                        </a>
                    </li>
                    <li>
                        <a  href="/app/login/loginview" class="btn btn-primary">
                            <span class="glyphicon glyphicon-log-in"></span> 登录
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.UserInfo_session != null}">
                    <li>
                        <span>欢迎会员：</span>
                        <a class="btn btn-info" href="/user/user_info${sessionScope.UserInfo_session.user_info_id}/info" title="点击修改个人资料">
                            <span class="glyphicon glyphicon-user"></span> ${sessionScope.UserInfo_session.name}
                        </a>
                        <a href="/app/login/logout" class="btn btn-danger">退出</a>
                    </li>
                </c:if>
            </ul>
        </div>

    </div>
</div>
<div class=" container">
    <div id="pt" class="bm cl">
        <div class="z">
            <i class="glyphicon glyphicon-home"></i><a href="/app/index" class="nvhm">考研论坛</a><em>››</em>
            <a href="#" id="user_info_html">个人信息页</a>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">个人资料</div>
        <div class="panel-body">
            <div style="border-bottom: 1px solid black">
                <div class="avt">
                    <img src="http://www.aqinet.cn/uc_server/avatar.php?uid=39&size=small" alt="头像">
                </div>
                <h2 class="mt">${user_info_detail.name}</h2>
                <p>个人签名个人签名个人签名个人签名个人签名个人签名</p>
            </div>
            <div id="user_info_detail">

                <ul class="pfl">
                    <li><em>邮箱</em>${user_info_detail.user_email}</li>
                    <li><em>本科学校</em>${user_info_detail.bkschool}</li>
                    <li><em>报考学校</em>${user_info_detail.wantschool}</li>
                    <li><em>注册时间</em>${user_info_detail.registerTime_date}</li>
                    <li><em>性&nbsp;&nbsp;别&nbsp; &nbsp;&nbsp;&nbsp; </em>
                        <c:if test="${user_info_detail.user_gender == 0}">男</c:if>
                        <c:if test="${user_info_detail.user_gender == 1}">女</c:if>
                    </li>
                    <li><em>家乡所在省份</em>${user_info_detail.homeTown_province}</li>
                    <li><em>家乡所在城市</em>${user_info_detail.homeTown_city}</li>
                    <li><em>考研年份</em>${user_info_detail.examYear}</li>
                </ul>
            </div>
        </div>
        <div class="panel-footer">
            <a href="http://localhost:8080/app/user/user_info${user_info_detail.user_info_id}/setting" class="btn btn-primary">修改资料</a>
        </div>
    </div>
</div>
<script src="../../../../style/js/jquery.min.js"></script>
<script src="../../../../style/js/bootstrap.js"></script>
<script>
    $(function(){
        if(${sessionScope.edit_userInfo_error == "noRight"}){
            alert("用户尚未登录，无权修改信息");
        }
    });
</script>
</body>
</html>
