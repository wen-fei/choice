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
    <title>会员列表</title>
</head>
<body>
<!--头部导航-->
<nav class="breadcrumb">
    <i class="glyphicon glyphicon-home"></i> 首页
    <span class="c-gray en">&gt;</span> 会员管理
    <span class="c-gray en">&gt;</span> 会员列表
    <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="glyphicon glyphicon-refresh"></i>
    </a>
</nav>
<!--content-->
<div>
    <%--<div id="searchBottom">--%>
    <%--<!--会员搜索-->--%>
        <%--<div class="text-c">--%>
            <%--<span class="select-box inline">--%>
                <%--<select name="" class="select">--%>
                    <%--<option value="1">按会员类型搜索</option>--%>
                    <%--<option value="2">按本科院校搜索</option>--%>
                    <%--<option value="3">按目标院校搜索</option>--%>
                    <%--<option value="4">按家乡省份搜索</option>--%>
                    <%--<option value="4">按注册年份搜索</option>--%>
                <%--</select>--%>
            <%--</span>--%>
            <%--<input type="text" name="" id="12" placeholder=" 帖子名称关键字" style="width:250px" class="input-text">--%>
            <%--<button name="" id="13" class="btn btn-success" type="submit">搜会员</button>--%>
        <%--</div>--%>
    <%--</div>--%>
    <!--end  会员搜索-->
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4>会员列表</h4>
            <div class="cl">
                <span class="l">
                    <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                    <i class="glyphicon glyphicon-trash"></i>批量删除</a>
                     <%--<i class="glyphicon glyphicon-download-alt"></i>导入数据</a>--%>
                    <%--<a class="btn btn-success radius"  href="#">--%>
                     <%--<i class="glyphicon glyphicon-open"></i>导出数据</a>--%>

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
                    <th>头像</th>
                    <th>邮箱</th>
                    <th>用户组</th>
                    <th>性别</th>
                    <th>家乡所在省份</th>
                    <th>家乡所在城市</th>
                    <th>本科院校</th>
                    <th>目标院校</th>
                    <th>注册时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="ufl" items="${userInfoList}">
                    <tr class="text-c">

                        <td><input type="checkbox" value="" name=""></td>
                        <td>${ufl.user_info_id}</td>
                        <td>${ufl.name}</td>
                        <td><img src="${ufl.userImg}" alt="" width="20px"></td>
                        <td width="60">${ufl.user_email}</td>
                        <td>${ufl.user_type_name}</td>
                        <td>${ufl.user_gender}</td>
                        <td>${ufl.homeTown_province}</td>
                        <td>${ufl.homeTown_city}</td>
                        <td>${ufl.bkschool}</td>
                        <td>${ufl.wantschool}</td>
                        <td>${ufl.registerTime_date}</td>
                        <td class="f-14 td-manage">
                            <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;"
                               title="删除">
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
</div>
</body>
</html>