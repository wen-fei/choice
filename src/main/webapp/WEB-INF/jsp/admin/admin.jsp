<%@ page pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../../../style/js/lib/html5.js"></script>
    <![endif]-->
    <!--引入css文件-->
    <%@include file="../../jsp/common/header.jsp" %>
    <style>
        #Hui-msg  > a{
            display : inline;
        }
        .glyphicon-my{
            float: right;
            margin-right: 10px;
            top: 8px;;
            font-size: 16px;
        }
        /*顶部导航*/
        .Hui-header {
            background-color: #e5e5e5;
        }
    </style>
    <title>后台管理</title>
</head>
<body>
<!--顶部-->
<header class="Hui-header cl">
    <a class="Hui-logo l" href="/">考研论坛后台管理系统</a>
    <!--顶部右侧账户-->
    <ul class="Hui-userbar">
        <!--判断guanliyuan是否已经登录-->
        <c:if test="${sessionScope.admin_user != null}">
            <li>${sessionScope.admin_user.user_type_name}</li>
        </c:if>
    </ul>
    <a aria-hidden="false" class="Hui-nav-toggle" href="#"></a>
</header>
<!--end header-->
<!--左侧菜单-->
<aside class="Hui-aside">
    <input runat="server" id="divScrollValue" type="hidden" value=""/>
    <div class="menu_dropdown bk_2">
        <!--帖子管理-->
        <dl id="menu-article">
            <dt>主题管理<i class="glyphicon glyphicon-envelope glyphicon-my"></i></dt>
            <dd>
                <ul>
                    <li><a _href="article/list" href="javascript:void(0)">主题管理</a></li>
                </ul>
            </dd>
        </dl>
        <!--模块管理-->
        <dl id="menu-picture">
            <dt>模块管理<i class="glyphicon glyphicon-modal-window glyphicon-my"></i></dt>
            <dd>
                <ul>
                    <li><a _href="module/list" href="javascript:void(0)">板块管理</a></li>
                    <li><a _href="module/school" href="javascript:void(0)">高校模块</a></li>
                    <li><a _href="module/ggk" href="javascript:void(0)">公共课模块</a></li>
                    <li><a _href="module/zyk" href="javascript:void(0)">专业课模块</a></li>
                </ul>
            </dd>
        </dl>
        <!--评论管理-->
        <dl id="menu-comments">
            <dt>评论管理<i class="glyphicon glyphicon-edit glyphicon-my"></i></dt>
            <dd>
                <ul>
                    <li><a _href="reply/list" href="javascript:;">评论列表</a></li>
                    <%--<li><a _href="feedback-list.html" href="javascript:void(0)">意见反馈</a></li>--%>
                </ul>
            </dd>
        </dl>
        <!--会员管理-->
        <dl id="menu-member">
            <dt>会员管理<i class="glyphicon glyphicon-user glyphicon-my"></i></dt>
            <dd>
                <ul>
                    <li><a _href="user/list" href="javascript:;">会员列表</a></li>
                    <%--<li><a _href="user/group-control.html" href="javascript:;">群组管理</a></li>--%>
                    <%--<li><a _href="user/read-story.html" href="javascript:void(0)">浏览记录</a></li>--%>
                    <%--<li><a _href="user/download-story.html" href="javascript:void(0)">下载记录</a></li>--%>
                    <%--<li><a _href="user/create-article.html" href="javascript:void(0)">发帖记录</a></li>--%>
                    <li><a _href="user/reply" href="javascript:void(0)">回帖记录</a></li>
                    <li><a _href="user/setController_forum" href="javascript:void(0)">设置板块管理员</a></li>
                    <li><a _href="user/setController_module" href="javascript:void(0)">设置模块管理员</a></li>
                </ul>
            </dd>
        </dl>
        <!--系统管理-->
        <%--<dl id="menu-system">--%>
            <%--<dt>系统管理<i class="glyphicon glyphicon-cog glyphicon-my"></i></dt>--%>
            <%--<dd>--%>
                <%--<ul>--%>
                    <%--<li><a _href="system-base.html" href="javascript:void(0)">系统设置</a></li>--%>
                    <%--<li><a _href="system-category.html" href="javascript:void(0)">栏目管理</a></li>--%>
                    <%--<li><a _href="system-data.html" href="javascript:void(0)">数据字典</a></li>--%>
                    <%--<li><a _href="system-shielding.html" href="javascript:void(0)">屏蔽词</a></li>--%>
                    <%--<li><a _href="system-log.html" href="javascript:void(0)">系统日志</a></li>--%>
                <%--</ul>--%>
            <%--</dd>--%>
        <%--</dl>--%>
    </div>
</aside>
<!--end 左侧菜单-->
<div class="dislpayArrow">
    <a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
<!--主要显示内容放在这-->
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S"
                                                  href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a
                id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">
            &#xe6d7;</i></a></div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="/admin/welcome"></iframe>
        </div>
    </div>
</section>
<!--引入必要的js文件-->
<%@include file="../common/footer.jsp" %>
</body>
</html>