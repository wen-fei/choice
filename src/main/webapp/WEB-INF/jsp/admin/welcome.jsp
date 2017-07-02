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
  <!--引入css文件-->
  <%@include file="../../jsp/common/header.jsp" %>
  <title>欢迎界面</title>
</head>
<body>
<div class="pd-20" style="padding-top:20px;">
  <div class="container" style="height: 400px;">
    <h1 class="text-success" style="margin-left: 300px;margin-top: 200px;">欢迎使用后台管理系统 ！</h1>
  </div>
  <%--<table class="table table-border table-bordered table-bg">--%>
    <%--<thead>--%>
      <%--<tr>--%>
        <%--<th colspan="7" scope="col">信息统计</th>--%>
      <%--</tr>--%>
      <%--<tr class="text-c">--%>
        <%--<th>统计</th>--%>
        <%--<th>帖子数量</th>--%>
        <%--<th>图片数量</th>--%>
        <%--<th>浏览量</th>--%>
        <%--<th>注册用户</th>--%>
        <%--<th>管理员</th>--%>
      <%--</tr>--%>
    <%--</thead>--%>
    <%--<tbody>--%>
      <%--<tr class="text-c">--%>
        <%--<td>总数</td>--%>
        <%--<td>92</td>--%>
        <%--<td>9</td>--%>
        <%--<td>0</td>--%>
        <%--<td>8</td>--%>
        <%--<td>20</td>--%>
      <%--</tr>--%>
      <%--<tr class="text-c">--%>
        <%--<td>今日</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
      <%--</tr>--%>
      <%--<tr class="text-c">--%>
        <%--<td>昨日</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
      <%--</tr>--%>
      <%--<tr class="text-c">--%>
        <%--<td>本周</td>--%>
        <%--<td>2</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
      <%--</tr>--%>
      <%--<tr class="text-c">--%>
        <%--<td>本月</td>--%>
        <%--<td>2</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
      <%--</tr>--%>
    <%--</tbody>--%>
  <%--&lt;%&ndash;</table>&ndash;%&gt;--%>
</div>
<!--页脚-->
<footer class="footer">
  <p>Copyright &copy;2017 腾云 All Rights Reserved.<br>
</footer>
<!--引入必要的js文件-->
<%@include file="../common/footer.jsp" %>
</body>
</html>