<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入jstl-->
<%@include file="../../../jsp/common/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="../../../../style/css/bootstrap.css">
    <title>学习之外模块</title>
</head>
<body>
<!--头部导航-->
<nav class="breadcrumb">
    <i class="glyphicon glyphicon-home"></i> 首页
    <span class="c-gray en">&gt;</span> 模块管理
    <span class="c-gray en">&gt;</span> 学习之外模块
    <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="glyphicon glyphicon-refresh"</i>
    </a>
</nav>
<!--content-->
<div >
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4>学习之外模块明细</h4>
            <div class="cl">
                <span class="l">
                    <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                    <i class="glyphicon glyphicon-trash"></i> 批量删除</a>
                    <a class="btn btn-success radius" onclick="article_add('添加资讯','article-add.html')" href="javascript:;">
                     <i class="glyphicon glyphicon-new-window"></i> 增加新纪录</a>
                </span>
                <span class="r">共有数据：<strong>54</strong> 条</span>
            </div>
        </div>
        <div class="panel-body">
            <table class="table table-border table-bordered table-hover">
                <thead>
                <tr class="text-c info">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th>模块ID</th>
                    <th>模块名称</th>
                    <th>模块版主</th>
                    <th>帖子数量</th>
                    <th>浏览次数</th>
                    <th>评论数量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr class="text-c">
                    <td><input type="checkbox" value="" name=""></td>
                    <td>10001</td>
                    <td>学校通知</td>
                    <td>腾云丶</td>
                    <td>2211</td>
                    <td>1232132</td>
                    <td>9123</td>
                    <td class="f-14 td-manage">
                        <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;"
                           title="删除">
                            <i class="Hui-iconfont">&#xe6e2;</i>
                        </a>
                    </td>
                </tr>
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
<!--引入必要的js文件-->
<%@include file="../../common/footer.jsp" %>
</body>
</html>