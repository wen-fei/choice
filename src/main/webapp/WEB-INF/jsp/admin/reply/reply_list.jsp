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
    <title>资讯列表</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="glyphicon glyphicon-home"></i> 首页
    <span class="c-gray en">&gt;</span> 评论管理
    <span class="c-gray en">&gt;</span> 评论列表
    <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="glyphicon glyphicon-refresh"></i>
    </a>
</nav>
<div class="pd-20">
    <div class="text-c">
        <form action="list" method="get">
        <span class="select-box inline" style="border: none">
            <select name="needId" class="select" style="border:solid 1px #ddd">
                <option value="0" selected>全部评论</option>
                <option value="1">按模块名称查</option>
                <option value="2">按主题名称查</option>
            </select>
            日期范围：
            <input type="text" name="startTime" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})"
                   id="logmin" class="input-text Wdate" style="width:120px;">
            --
            <input type="text" name="endTime"
                   onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax"
                   class="input-text Wdate" style="width:120px;">
            <input type="text" name="titleKey" placeholder=" 帖子名称关键字" style="width:250px" class="input-text">

            <button id="" class="btn btn-success" type="submit">
                搜评论
            </button>
        </span>
        </form>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
            <i class="glyphicon glyphicon-trash"></i> 批量删除</a>
        </span>
        <span class="r">共有数据：<strong>${articleList.size()}</strong> 条</span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th>评论ID</th>
                <th>评论内容</th>
                <th width="80">评论作者</th>
                <th width="80">作者身份</th>
                <th width="120">评论所属主题名称</th>
                <th>评论所属模块名称</th>
                <th>评论所属板块名称</th>
                <th width="80">评论时间</th>
                <th width="120">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="rl" items="${replyList}">
                <tr class="text-c">
                    <td><input type="checkbox" value="" name=""></td>
                    <td name="article_id">${rl.reply_id}</td>
                    <td class="text-l">${rl.reply_content}</td>
                    <td>${rl.userInfo.name}</td>
                    <td>${rl.userInfo.user_type_name}</td>
                    <td>${rl.articleInfo.article_title}</td>
                    <td>${rl.articleInfo.article_module_name}</td>
                    <td>${rl.articleInfo.article_forum_name}</td>
                    <td>${rl.reply_time_date}</td>
                    <!--帖子操作-->
                    <td class="f-14 td-manage">
                        <a style="text-decoration:none" class="ml-5" href="javascript:;" title="删除">
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
        <!--end 分页-->
    </div>
</div>
<!--引入必要的js文件-->
<%@include file="../../common/footer.jsp" %>
</body>
</html>