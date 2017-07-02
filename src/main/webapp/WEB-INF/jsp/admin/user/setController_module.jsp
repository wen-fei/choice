<!--<%@ page contentType="text/html;charset=UTF-8" language="java" %>-->
<!--<%@include file="../../../jsp/common/tag.jsp" %>-->
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--引入css文件-->
    <%@include file="../../../jsp/common/header.jsp" %>
    <title>设置管理员</title>
    <style>
        .form-group{
            display: block;
        }
    </style>
</head>
<body>
<!--头部导航-->
<nav class="breadcrumb">
    <i class="glyphicon glyphicon-home"></i> 首页
    <span class="c-gray en">&gt;</span> 会员管理
    <span class="c-gray en">&gt;</span> 设置模块管理员
    <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="glyphicon glyphicon-refresh"></i>
    </a>
</nav>
<!--content-->
<div class="pd-20">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <h3>设置模块管理员</h3>
    </div>
    <div class="mt-20">
            <div class="container">
                <form class="form-horizontal" method="post">
                    <div class="form-group">
                        <label for="module_name" class="col-md-2 control-label">板块名称</label>
                        <div class="col-md-4">
                            <select class="select form-control" id="module_name">
                                <c:forEach var="ml" items="${module_list}">
                                    <option name="${ml.module_id}">${ml.module_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="set_module_user_id" class="col-md-2 control-label">用户ID</label>
                        <div class="col-md-4">
                            <input type="text" id="set_module_user_id" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4" style="margin-left: 170px;">
                            <button class="btn btn-primary" id="submitBtn">提交</button>
                            <span style="margin-left: 40px;"></span>
                            <button class="btn btn-warning">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
</div>
<!--引入必要的js文件-->
<%@include file="../../common/footer.jsp" %>
<script type="text/javascript">
    //初始化数据
    $(document).ready(function() {
        $("#module_name").children("option[value='${module_list[0].module_name}']").attr("selected","true");
    });
    $(function(){
        $("#submitBtn").click(function(){
            query = {
                "module_id": $("#module_name").find("option:selected").attr("name"),
                "user_id" : $("#set_module_user_id").val()
            },
                $.ajax({
                    url:"http://localhost:8080/admin/user/setController/2",
                    type:'post',
                    data:query,
                    dataType:'html',
                    success:function(data,status){
                        if(status == "success"){
                            if(data=="1"){
                                alert("设置成功");
                                window.location.href = "http://localhost:8080/admin/setController_module";
                            }else if (data=="0"){
                                alert("设置失败");
                            }else if(data=="3"){
                                alert("用户不存在")
                            }
                        }
                    },
                    error:function(xhr,textStatus,errorThrown){
                        alert("设置失败！");
                    }
                });
        });
    });

</script>
</body>
</html>