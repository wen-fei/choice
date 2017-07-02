<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="refresh" content="3;url=/admin/loginview">
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
<h3>${result}</h3>
<b><span id="layer">3</span>秒后，自动跳转界面。</b>
</body>
</html>
