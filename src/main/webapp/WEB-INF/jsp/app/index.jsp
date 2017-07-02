<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入JSTL-->
<%@include file="../../jsp/common/tag.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/app/index-css.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/js/app/bootstrapValidator.min.css">

    <style>
        ul li, .xl li {
            list-style: none;
        }
        body, input, button, select, textarea {
            font: 12px/1.5 Tahoma,'Microsoft Yahei','Simsun';
            color: #444;
        }
        .item  img{
            width: 300px;
        }
        .article-url a{
            overflow: hidden;
        }
        .article-url {
            width:280px;
        }
        #hot_article{
            margin-right:10px;
        }
        .Hui-userbar > li{
            margin-right:20px;
            float: right;
        }
        .Hui-userbar{
            float: right;
        }
        #userLogin{
            float: right;
        }
        .panel-heading a{
            color:white;
            font-size: 14px;
        }
        body, ul, ol, li, dl, dd, p, h1, h2, h3, h4, h5, h6, form, fieldset, .pr, .pc {
            margin: 0;
            padding: 0;
        }
        .fl_g dt {
            font-size: 14px;
            padding-top: 3px;
        }
        .ky_hot {
            font-size: 10px;
            color: red;
        }
        .xw0 {
            font-weight: 400;
        }
        .xi1, .onerror {
            color: #F26C4F;
        }
        .wp-index a{
            color:#000000;
        }
        div.img-size{
            width: 300px;
            height: 250px;
        }
        .sizecontrol{
            width:300px;
            height:250px;
        }
        ul.chart{
            height:40px;
        }
        .wp-index span{
            margin-top: 1px;
            font-size: 16px;
            float: right;
        }
        select {
            background: transparent;
            width: 200px;
            padding: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            height: 34px;
            -webkit-appearance: none; /*for chrome*/
        }


    </style>
</head>
<body style="background: #E3E5E8;">
<!--头部-->
<div clasa="hd">
    <div class="navbar navbar-default navbarcolor" style="background-color: #fff;">
        <div id="logo" class="col-md-6">
            <img src="../../../style/imgs/app/forum/logo.png" alt="">
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
                <!--判断用户是否已经登录-->
                <c:if test="${sessionScope.UserInfo_session != null}">

                    <li>
                        <span>欢迎会员：</span>
                        <input type="text" hidden id="user_id"
                               value="${sessionScope.UserInfo_session.user_info_id}">
                        <a class="btn btn-info"
                           href="/app/user/user_info${sessionScope.UserInfo_session.user_info_id}/info"
                           title="点击修改个人资料">
                            <span class="glyphicon glyphicon-user"></span>
                                ${sessionScope.UserInfo_session.name}
                        </a>
                        <button id="logout" class="btn btn-danger">退出</button>
                    </li>
                </c:if>
            </ul>
        </div>
        <div class="col-md-3" style="margin-top: 20px">
            <form action="/app/search" id="searchForm">
                <div class="input-group" style="margin-top:0px; positon:relative" id="search">
                    <form action="" method="get">
                        <input type="text" class="form-control" placeholder="请输入搜索内容" name="searchKey">
                        <span class="input-group-btn">
                           <button class="btn btn-info btn-search" type="submit">搜索</button>
                        </span>
                    </form>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="wp-index">
        <!--顶部轮播-->
        <div class="col-lg-3">
            <div id="carousel-example-generic" class="carousel slide sizecontrol " data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner img-size" role="listbox">
                    <div class="item active">
                        <img src="../../../style/imgs/app/lunbo/book.png" alt="...">
                        <div class="carousel-caption">
                            <!--图片上需要写的文字放在这-->
                        </div>
                    </div>
                    <div class="item">
                        <img src="../../../style/imgs/app/lunbo/fenshuxian.png" alt="...">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="../../../style/imgs/app/lunbo/zexiao.png" alt="...">
                        <div class="carousel-caption">
                        </div>
                    </div>
                </div>

                <!-- 左右滑动控制按钮 -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    <style>
        .article-url{
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;  /*超出省略号代替*/
            height: 18px;
            margin-left: 3px;
        }
    </style>
        <!--热门帖子-->
        <div class="panel col-lg-4" id="hot_article" style="margin-left: 30px;">
            <div class="panel-heading panel-default">
                <img src="../../../style/imgs/app/forum/tuijian3.gif" alt="attach_img" title="图片附件" align="absmiddle">
                <!--<i class="glyphicon glyphicon-volume-up"></i>-->
                <span>热门浏览的主题</span>
            </div>
            <div class="panel-body">
                <ul class="article-hot-list">
                    <c:forEach items="${articleListByRead}" var="abr">
                        <li>
                            <img src="../../../style/imgs/app/cat.jpg" width="18px" height="18px" alt="作者头像">
                            <div class="article-url">
                                <a href="/app/article${abr.article_id}/content">${abr.article_title}</a>
                            </div>
                            <span>${abr.article_comment_number}回复</span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <!--猜你喜欢-->
        <div class="panel col-md-4" style="margin-left: 30px;">
            <div class="panel-heading panel-default">
                <!--<i class="glyphicon glyphicon glyphicon-fire"></i>-->
                <img src="../../../style/imgs/app/forum/tuijian3.gif" alt="attach_img" title="图片附件" align="absmiddle">
                <span>猜你喜欢的主题</span>
            </div>
            <div class="panel-body">
                <ul class="article-hot-list">
                    <c:forEach items="${articleListByScore}" var="abs">
                        <li>
                            <img src="../../../style/imgs/app/cat.jpg" width="18px" height="18px" alt="作者头像">
                            <div class="article-url">
                                <a href="/app/article${abs.article_id}/content">${abs.article_title}</a>
                            </div>
                            <span>${abs.article_comment_number}回复</span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
</div>
<!--内容-->
<div>
    <!--信息，今日帖子，昨日帖子，帖子总数，会员总数-->
    <div id="chart" class="cl">
        <ul class="chart z">
            <li class="t">今日帖数： <em>${countsList.todayArticleCounts}</em></li>
            <li class="ye">昨日帖数： <em>${countsList.yesterdayArticleCounts}</em></li>
            <li class="p">帖子总数： <em>${countsList.articleCounts}</em></li>
            <li class="m">会员总数： <em>${userCounts}</em></li>
        </ul>
    </div>
    <!--主要板块-->
    <div class="container mar">
        <!--计算机考研专业课讨论区-->
        <div class="panel panel-primary module">
            <div class="panel-heading">
                <a href="">★★计算机考研专业课讨论区★★</a>
            </div>
            <div class="panel-body">
                <table cellspacing="0" cellpadding="0" class="fl_tb">
                    <tbody>
                        <c:forEach items="${zykmoduleList}" var="zyk" varStatus="index">
                            <c:if test="${(index.count-1)%4==0}">
                                <tr class="fl_row">
                            </c:if>
                            <td class="fl_g" width="19.9%">
                                <div class="fl_icn_g"></div>
                                <dl>
                                    <dt>
                                        <a href="/app/module${zyk.module_id}/list">${zyk.module_name}</a>
                                    </dt>
                                </dl>
                            </td>
                            <c:if test="${index.count%4 == 0}">
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!--计算机考研公共课讨论区-->
        <div class="panel panel-primary module">
            <div class="panel-heading">
                <a href="">★★计算机考研公共课讨论区★★</a>
            </div>
            <div class="panel-body">
                <table cellspacing="0" cellpadding="0" class="fl_tb">
                    <tbody>
                    <c:forEach items="${ggkmoduleList}" var="ggk" varStatus="index">
                        <c:if test="${(index.count-1)%4==0}">
                            <tr class="fl_row">
                        </c:if>
                        <td class="fl_g" width="19.9%">
                            <div class="fl_icn_g"></div>
                            <dl>
                                <dt>
                                    <a href="/app/module${ggk.module_id}/list">${ggk.module_name}</a>
                                </dt>
                            </dl>
                        </td>
                        <c:if test="${index.count%4 == 0}">
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!--≡ 计算机考研名校交流—华北、东北地区≡-->
        <div class="panel panel-primary module">
            <div class="panel-heading">
                <a href="">★★计算机考研名校交流—华北、东北地区★★</a>
            </div>
            <div class="panel-body">
                <table cellspacing="0" cellpadding="0" class="fl_tb">
                    <tbody>
                        <c:forEach items="${hbdbmoduleList}" var="hbdb" varStatus="index">
                            <c:if test="${(index.count-1)%4 ==0}">
                                <tr class="fl_row">
                            </c:if>
                            <td class="fl_g" width="19.9%">
                                <div class="fl_icn_g"></div>
                                <dl>
                                    <dt>
                                        <a href="/app/module${hbdb.module_id}/list" style="color:#000000">${hbdb.module_name}</a>
                                    </dt>
                                </dl>
                            </td>
                            <c:if test="${index.count%4 == 0}">
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!--≡计算机考研名校交流—华东、华中、华南地区≡-->
        <div class="panel panel-primary module">
            <div class="panel-heading">
                <a href="">★★计算机考研名校交流—华东、华中、华南地区★★</a>
            </div>
            <div class="panel-body">
                <table cellspacing="0" cellpadding="0" class="fl_tb">
                    <tbody>
                        <c:forEach items="${hdhzhnmoduleList}" var="hdhzhn" varStatus="index">
                            <c:if test="${(index.count-1)%4==0}">
                                <tr <c:if test="${index.count!=0}">class="fl_row"</c:if> >
                            </c:if>
                            <td class="fl_g" width="19.9%">
                                <div class="fl_icn_g"></div>
                                <dl>
                                    <dt>
                                        <a href="/app/module${hdhzhn.module_id}/list" style="color:#000000">${hdhzhn.module_name}</a>
                                    </dt>
                                </dl>
                            </td>
                            <c:if test="${index.count%4 == 0}">
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!--≡计算机考研名校交流—西北、西南地区≡-->
        <div class="panel panel-primary module">
            <div class="panel-heading">
                <a href="">★★计算机考研名校交流—华北、东北地区★★</a>
            </div>
            <div class="panel-body">
                <table cellspacing="0" cellpadding="0" class="fl_tb">
                    <tbody>
                        <c:forEach items="${xbxnmoduleList}" var="xbxn" varStatus="index">
                            <c:if test="${(index.count-1)%4==0}">
                                <tr <c:if test="${index.count!=0}">class="fl_row"</c:if> >
                            </c:if>
                            <td class="fl_g" width="19.9%">
                                <div class="fl_icn_g"></div>
                                <dl>
                                    <dt>
                                        <a href="/app/module${xbxn.module_id}/list" style="#000000">${xbxn.module_name}</a>
                                        &nbsp;
                                        <em class="ky_hot">优秀</em>
                                        <em class="xw0 xi1" title="今日"> (862)</em>
                                    </dt>
                                </dl>
                            </td>
                            <c:if test="${index.count%4 == 0}">
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>
</body>
<script src="../../../style/js/jquery.min.js"></script>
<script src="../../../style/js/bootstrap.js"></script>
<script src="../../../style/js/app/app.js"></script>
<script>
    //用户退出登录
    $("#logout").click(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/app/login/logout",
            type: 'post',
            success: function (data, status) {
                if (data == "1") {
                    alert("退出成功");
                    window.location.reload();
                } else if (data == "0") {
                    alert("error");
                }
            },
            error: function (xhr, textStatus, errorThrown) {
                alert("error！");
            }
        });
    });
</script>

</html>