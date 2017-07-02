<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入JSTL-->
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
    <link rel="stylesheet" href="../../../../style/css/admin/admin.css">
    <title>帖子信息修改</title>
</head>

<body>
<nav class="breadcrumb">
    <i class="glyphicon glyphicon-home"></i> 首页
    <span class="c-gray en">&gt;</span> 帖子管理
    <span class="c-gray en">&gt;</span> 帖子信息修改
</nav>
<div class="pd-20">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <h3>修改主题信息</h3>
    </div>
    <div class="mt-20">
        <div class="container">
            <form class="form-horizontal" method="post">
                <div class="form-group">
                    <label for="articleId" class="col-sm-2 control-label">帖子ID</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" id="articleId" placeholder="" name="article_id"
                               value="${article_detail.article_id}" disabled="true">
                    </div>
                </div>
                <div class="form-group">
                    <label for="article_title" class="col-sm-2 control-label">帖子标题</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" id="article_title" placeholder="" name="article_title"
                            value="${article_detail.article_title}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="article_type_name" class="col-sm-2 control-label">帖子类型</label>
                    <div class="col-md-3">
                        <select class="select" name="article_type_name" id="article_type_name">
                            <c:forEach var="atl" items="${articleTypeList}">
                                <option value="${atl.article_type_id}">${atl.article_type_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="article_forum_name" class="col-sm-2 control-label">帖子所属板块</label>
                    <div class="col-md-5">
                        <select class="select" name="article_forum_name" id="article_forum_name">
                            <c:forEach var="fl" items="${forumList}">
                                <option value="${fl.forum_id}">${fl.forum_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="article_module_name" class="col-sm-2 control-label">帖子所属模块</label>
                    <div class="col-md-5">
                        <select class="select" name="article_module_name" id="article_module_name">
                            <c:forEach var="ml" items="${moduleList}">
                                <option value="${ml.module_id}">${ml.module_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
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
        $("#article_type_name").children("option[value='${article_detail.article_type_id}']").attr("selected","true");
        $("#article_forum_name").children("option[value='${article_detail.article_forum_id}']").attr("selected","true");
        $("#article_module_name").children("option[value='${article_detail.article_type_id}']").attr("selected","true");
    });
</script>
<script type="text/javascript">
    $(function(){
        $("#submitBtn").click(function(){
            query = {
                "article_id": $("#articleId").val(),
                "article_title": $("#article_title").val(),
                "article_type_id": $("#article_type_name").val(),
                "article_module_name_id": $("#article_module_name").val(),
                "article_forum_name__id": $("#article_forum_name").val(),
            },
            $.ajax({
                url:"http://localhost:8080/admin/article/edit",
                type:'post',
                data:query,
                dataType:'html',
                success:function(data,status){
                    if(status == "success"){
                        if(data=="success"){
                            alert("修改成功");
                            window.location.href = "http://localhost:8080/admin/article/control&article_id="+${article_detail.article_id};
                        }else if (data=="error"){
                            alert("修改失败");
                        }
                    }
                },
                error:function(xhr,textStatus,errorThrown){
                    alert("修改失败！");
                }
            });
        });
    });
</script>

</body>
</html>