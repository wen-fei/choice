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
    <title>高校管理模块</title>
</head>
<body>

<!--头部导航-->
<nav class="breadcrumb">
    <i class="glyphicon glyphicon-home"></i> 首页
    <span class="c-gray en">&gt;</span> 模块管理
    <span class="c-gray en">&gt;</span> 高校管理
    <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="glyphicon glyphicon-refresh"></i>
    </a>
</nav>
<!--主要显示内容-->
<div class="pd-20 moveTop-20">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
            <i class="glyphicon glyphicon-trash"></i> 批量删除</a>
            <button class="btn btn-primary radius" data-toggle="modal" data-target="#myModal"><i class="Hui-iconfont">&#xe600;</i> 增加新高校</button>
        </span>
        <span class="r">共有数据：<strong>54</strong> 条</span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c info">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th>学校ID</th>
                <th>学校名称</th>
                <th>学校所在城市</th>
                <th>所属板块</th>
                <th>学校类型</th>
                <th>版主名称</th>
                <th>帖子总数</th>
                <th>浏览次数</th>
                <th>回复总数</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="sml" items="${schoolModuleList}">
                <tr class="text-c">
                    <td><input type="checkbox" value="" name=""></td>
                    <td>${sml.module_id}</td>
                    <td>${sml.module_name}</td>
                    <td>${sml.school.school_city}</td>
                    <td>${sml.forum.forum_name}</td>
                    <td>${sml.school.school_type_name}</td>
                    <td>${sml.userInfo.name}</td>
                    <td>${sml.module_article_count}</td>
                    <td>${sml.module_read_count}</td>
                    <td>${sml.module_reply_count}</td>
                    <td class="f-14 td-manage">
                        <a style="text-decoration:none" class="ml-5" href="#" title="编辑">
                            <i class="glyphicon glyphicon-edit"></i>
                        </a>
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
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加高校</h4>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="input-group col-md-6">
                        <span class="input-group-addon" id="basic-addon1">高校名称</span>
                        <input type="text" class="form-control" aria-describedby="basic-addon1" />
                    </div>
                    <div class="input-group col-md-6" style="margin: 20px 20px">
                        <div >
                            地区：<select id="area"></select>
                            省：<select id="cmbProvince"></select>
                            市：<select id="cmbCity"    ></select>
                            区：<select id="cmbArea"    ></select>
                        </div>
                    </div>
                    <div class="input-group col-md-6">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                所属板块<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">华东地区高校</a></li>
                                <li><a href="#">华北地区高校</a></li>
                                <li><a href="#">西北地区高校</a></li>
                                <li><a href="#">华南地区高校</a></li>
                            </ul>
                        </div>
                        <div class="btn-group" style="margin-left: 20px">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                学校类型<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">211高校</a></li>
                                <li><a href="#">985高校</a></li>
                                <li><a href="#">211+985高校</a></li>
                                <li><a href="#">双非高校</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../../../../style/js/jquery.min.js"></script>
<script type="text/javascript" src="../../../../style/js/bootstrap.js"></script>
<script type="text/javascript" src="../../../../style/js/jsAddress.js"></script>
<script type="text/javascript">
        //    高校增加城市联动初始化
        addressInit('area','cmbProvince','cmbCity','cmbArea','西北地区', '北京', '市辖区', '东城区');
</script>

</body>
</html>