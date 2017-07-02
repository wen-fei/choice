<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入jstl-->
<%@include file="../../../jsp/common/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--引入css文件-->
    <%@include file="../../../jsp/common/header.jsp" %>
    <link rel="stylesheet" href="../../../../style/css/userControl.css">
    <link href="../../../../style/css/admin/Hui/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../../../style/css/admin/Hui/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="../../../../style/css/admin/Hui/style.css" rel="stylesheet" type="text/css"/>
    <link href="../../../../style/js/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../../../../style/css/bootstrap.css">
    <link rel="stylesheet" href="../../../../style/css/userControl.css">
    <title>回帖记录</title>
</head>
<body>
<!--头部导航-->
<nav class="breadcrumb">
    <i class="glyphicon glyphicon-home"></i> 首页
    <span class="c-gray en">&gt;</span> 会员管理
    <span class="c-gray en">&gt;</span> 回帖记录
    <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="glyphicon glyphicon-refresh"></i>
    </a>
</nav>
<!--content-->
<%--<div id="searchBottom">--%>
    <%--<!--会员搜索-->--%>
    <%--<div class="text-c">--%>
            <%--<span class="select-box inline">--%>
                <%--<select name="" class="select">--%>
                    <%--<option value="1">按会员名称搜索</option>--%>
                    <%--<option value="4">按帖子板块搜索</option>--%>
                    <%--<option value="4">按回帖时间搜索<!--TODO js控制输入域改为时间选择器--></option>--%>
                <%--</select>--%>
            <%--</span>--%>
        <%--<input type="text" name="" id="" placeholder=" 帖子名称关键字" style="width:250px" class="input-text">--%>
        <%--<button name="" id="" class="btn btn-success" type="submit">搜索</button>--%>
    <%--</div>--%>
<%--</div>--%>
<div class="panel panel-info">

    <div class="panel-heading">
        <h4>回帖记录信息</h4>
        <div class="cl">
                <span class="l">
                    <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                    <i class="glyphicon glyphicon-trash"></i>批量删除</a>
                </span>
            <%--<span class="r">共有数据：<strong>54</strong> 条</span>--%>
        </div>
    </div>
    <div class="panel-body">
        <table class="table table-border table-bordered table-hover">
            <thead>
            <tr class="text-c info">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th>会员ID</th>
                <th>会员名称</th>
                <th>回帖内容</th>
                <th hidden>回帖帖ID</th>
                <th>主题名称<!--TODO 只显示部分内容，用...代替--></th>
                <th>主题模块</th>
                <th>回帖时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${replyList}" var="rpl">
                <tr class="text-c">
                    <td><input type="checkbox" value="" name=""></td>
                    <td>${rpl.userInfo.user_info_id}</td>
                    <td>${rpl.userInfo.name}</td>
                    <td>${rpl.reply_content}</td>
                    <td>${rpl.articleInfo.article_title}</td>
                    <td>${rpl.articleInfo.article_module_name}</td>
                    <td>${rpl.reply_time_date}</td>
                    <td class="f-14 td-manage">
                        <a style="text-decoration:none" class="ml-5" href="#" title="删除">
                            <i class="glyphicon glyphicon-trash"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!--分页-->
        <div class="text-center">
            <nav aria-label="Page navigation " style="align-content: center">
                <ul class="pagination fenyeCenter">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">9</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="panel-footer"></div>
</div>
</body>
</html>