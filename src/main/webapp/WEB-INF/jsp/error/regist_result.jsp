<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2017/5/7
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="refresh" content="3;url=/app/index">
    <title>结果</title>
    <script type="text/javascript">
        var time = 4;

        function returnUrlByTime() {

            window.setTimeout('returnUrlByTime()', 1000);

            time = time - 1;

            document.getElementById("layer").innerHTML = time;
        };
    </script>
</head>
<body onload="returnUrlByTime()">
    <h3>${registResult}</h3>
    <b><span id="layer">3</span>秒后，自动跳转界面。</b>
</body>
</html>
