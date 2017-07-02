<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/5/4
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试编辑器</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script>
<script type="text/javascript">
    var editor = null;
    window.onload = function() {
        editor = CKEDITOR.replace( 'content', {
            customConfig:'${pageContext.request.contextPath}/ckeditor/config.js'
        });
        CKFinder.setupCKEditor( editor, '${pageContext.request.contextPath}/ckfinder/' );
    };
    editor.setData('这里是需要传递给CKEditor编辑器实例的值');
//    editor.getData();

    function save(){
        editor.updateElement(); //非常重要的一句代码
        //前台验证工作
        //提交到后台
    };
</script>
<body>
<form id="detailForm" method="post">
    <textarea id="content" name="content"></textarea>
    <input type="submit" value="保存" id="save" />
</form>

</body>
</html>
