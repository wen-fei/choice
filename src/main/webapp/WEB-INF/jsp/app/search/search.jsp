<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入JSTL-->
<%@include file="../../../jsp/common/tag.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>搜索结果</title>
    <link rel="stylesheet" href="../../../../style/css/bootstrap.css">
    <style>
        ul li, .xl li {
            list-style: none;
        }
        .item  img{
            width: 300px;
        }
        .article-url a{
            overflow: hidden;
        }

        .Hui-userbar > li{
            margin-right:20px;
            float: right;
        }
        .Hui-userbar{
            float: right;
        }
        #userLogin{
            float: right;
        }
        .panel-heading a{
            color:white;
            font-size: 14px;
        }
        body, ul, ol, li, dl, dd, p, h1, h2, h3, h4, h5, h6, form, fieldset, .pr, .pc {
            margin: 0;
            padding: 0;
        }
        .fl_g dt {
            font-size: 14px;
            padding-top: 3px;
        }

        .wp-index a{
            color:#000000;
        }
        .wp-index span{
            margin-top: 1px;
            font-size: 16px;
            float: right;
        }
        select {
            background: transparent;
            width: 200px;
            padding: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            height: 34px;
            -webkit-appearance: none; /*for chrome*/
        }
        #userLogin a{
            color: #ffffff;
        }
        .pil dt, .pil dd{
            font-size: 12px !important;
        }
        .hm span{
            font-size: 12px;
        }
        #kw{
            width: 480px;
            padding: 10px 9px 10px 7px;
            border: 0;
            background-image: none;
            height: 35px;
            line-height: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
            -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
            -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.2);
        }
        #search_form{
            width: 640px;
            height: 100%;
        }
        #s_kw_wrap{
            width: 480px;
            height: 20px;
        }
        #su{
            width: 104px;
            height: 40px;
            line-height: 40px;
            padding: 0;
            border: 0;
            background-position: -464px -42px;
            cursor: pointer;
            color: #000;
            font-size: 16px;
        }
        #search_form{
            height: 40px;
        }
        #res{
            width: 640px;
        }
        .article_title{
            color: #337ab7 !important;
            font-size: 20px;
            display: block;
            width: 580px;
            overflow:hidden;
            text-overflow:ellipsis;
            white-space: nowrap;

        }
        .search_result{
            margin-top: 20px;
        }
        .article_url{
            font-size: 15px;
            display: block;
            margin-top: 5px;
            color:#006622 !important;
        }
        .article_content{
            height: 40px;
            width: 600px;
        }
        .st {
            line-height: 1.4;
            word-wrap: break-word;
            font-size: 15px;
            display: block;
            height: 40px;
        }
        .st em{
            color: #dd4b39;
            font-style: normal;
            font-weight: normal;
        }
        .search_hearder{
            margin-top: 5px;
        }
        .search_result{
            margin-bottom: 10px;
        }
        .page-divided{
            margin-top: 10px;
            margin-left: 140px;
        }
        .article_content{
            overflow:hidden;
            text-overflow:ellipsis;
        }
        .result{
            margin-bottom: 20px;
        }
    </style>
</head>
<body style="background: #E3E5E8;">
<!--头部-->
<div clasa="hd">
    <div class="navbar navbar-default navbarcolor" style="background-color: #fff;">
        <div id="logo" class="col-md-6">
            <img src="../../../../style/imgs/app/forum/logo.png" alt="">
        </div>
        <!--顶部右侧账户-->
        <div id="userLogin" class="col-md-3">
            <ul class="Hui-userbar" style="margin-top: 20px;">

                <c:if test="${sessionScope.UserInfo_session == '用户退出成功' || empty sessionScope.UserInfo_session}">
                    <li>
                        <a  href="/app/login/registview" class="btn btn-success">
                            <span class="glyphicon glyphicon-user"></span> 注册
                        </a>
                    </li>
                    <li>
                        <a  href="/app/login/loginview" class="btn btn-primary">
                            <span class="glyphicon glyphicon-log-in"></span> 登录
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.UserInfo_session != null}">
                    <li>
                        <span>欢迎会员：</span>
                        <input type="text" hidden id="user_id" value="${sessionScope.UserInfo_session.user_info_id}">
                        <a class="btn btn-info" href="/app/user/user_info${sessionScope.UserInfo_session.user_info_id}/info" title="点击修改个人资料">
                            <span class="glyphicon glyphicon-user"></span> ${sessionScope.UserInfo_session.name}
                        </a>
                        <button id="logout" class="btn btn-danger">退出</button>
                    </li>
                </c:if>
            </ul>
        </div>

    </div>
</div>
<!--主要内容-->
<div class="container">
    <form name="f" id="search_form" action="/app/search" class="fm" >
        <span id="s_kw_wrap" class="bg s_ipt_wr quickdelete-wrap">
            <input type="text" class="s_ipt" name="searchKey" id="kw"
                   maxlength="100" autocomplete="off" value="">
        </span>
        <span class="btn_wr s_btn_wr bg" id="s_btn_wr">
            <input type="submit" value="搜索一下" id="su" class="self-btn">
        </span>
    </form>
    <div class="med" id="res">
        <div class="search_hearder">
                <h2 class="hd">搜索结果</h2>
                <span>本次搜索共找到1000个结果</span>

        </div>
        <div class="search_result">
            <c:if test="${searchres} == '搜索结果不存在'" >
                搜索结果不存在
            </c:if>
                <c:forEach items="${searchres}" var="sr">
                    <div class="result">
                        <h3><a href="/app/train/${sr.article_id}/${sr.searchKey}" class="article_title">${sr.article_title}</a></h3>
                        <h3><a href="javascript:void(0)" class="article_url">http://localhost:8080/app/article${sr.article_id}/content</a></h3>
                        <div class="article_content">
                            <span class="st">
                                ${sr.article_content}
                            </span>
                        </div>
                        <input type="text" hidden value="${sr.searchKey}" class="search_keys">
                    </div>
                </c:forEach>
        </div>


    </div>
    <!--底部分页-->
    <div class="page-divided">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li class="disabled">
                      <span>
                        <span aria-hidden="true">&laquo;</span>
                      </span>
                </li>
                <li class="active">
                    <span>1 <span class="sr-only">(current)</span></span>
                </li>
                <li>
                    <a href="#">2</a>
                </li>
                <li>
                    <a href="#">3</a>
                </li>
                <li>
                    <a href="#">4</a>
                </li>
                <li>
                    <a href="#">5</a>
                </li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<script src="../../../../style/js/jquery.min.js"></script>
<script src="../../../../style/js/bootstrap.js"></script>
<script>
    $(document).ready(function() {
        var result = $(".search_keys").eq(0).val();
        $("#kw").attr('value',result);
    });
</script>
</body>

</html>