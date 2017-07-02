<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入JSTL-->
<%@include file="../../../jsp/common/tag.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>帖子列表</title>
    <link rel="stylesheet" href="../../../../style/css/bootstrap.css">
    <link rel="stylesheet" href="../../../../style/css/app/article.css">
    <link rel="stylesheet" href="../../../../style/css/app/common.css">
    <link rel="stylesheet" href="../../../../style/css/app/formdisplay.css">
    <script src="../../../../style/js/jquery.min.js"></script>
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
        .article-url {
            width:280px;
        }
        #hot_article{
            margin-right:10px;
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
        .ky_hot {
            font-size: 10px;
            color: red;
        }
        .xw0 {
            font-weight: 400;
        }
        .xi1, .onerror {
            color: #F26C4F;
        }
        .wp-index a{
            color:#000000;
        }
        div.img-size{
            width: 300px;
        }
        .sizecontrol{
            width:300px;
        }
        ul.chart{
            height:40px;
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
        #name_set{
            color:blue;
        }
        .pil dt, .pil dd{
            font-size: 12px !important;
        }
        .hm span{
            font-size: 12px;
        }
    </style>
</head>
<body style="background: #E3E5E8;">
<!--头部-->
<div clasa="hd">
    <div class="navbar navbar-default navbarcolor" style="background-color: #fff;">
        <div id="logo" class="col-md-6">
            <img src="../../../style/imgs/app/forum/logo.png" alt="">
        </div>
        <div class="col-md-3" style="margin-top: 20px">
            <form action="/app/search" id="searchForm">
                <div class="input-group" style="margin-top:0px; positon:relative" id="search">

                    <input type="text" class="form-control" placeholder="请输入搜索内容" name="searchKey">
                    <span class="input-group-btn">
                           <button class="btn btn-info btn-search" type="submit">搜索</button>
                        </span>

                </div>
            </form>
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
<div class="wp" id="wp">
    <!--导航-->
    <div id="pt" class="bm cl">
        <div class="z">
            <em>»</em><a href="/app/index" class="nvhm">考研论坛</a><em>›</em>
            <a href="/app/index" id="forum_id">${moduleInfo.forum.forum_name}</a><em>›</em>
            <input type="text" hidden="hidden" value="">
            <a id="module_id" href="/app/module${moduleInfo.module_id}/list">${moduleInfo.module_name}</a>
        </div>
    </div>
    <div class="wp">
        <div class="wp">
            <!--[diy=diy1]-->
            <div id="diy1" class="area"></div><!--[/diy]-->
        </div>
    </div>
    <!--帖子板块-->
    <div class="boardnav">
        <div id="ct" class="xr_list wp cl">
            <div class="mn">
                <!--模块名和基本信息-->
                <div class="bp">
                    <div class="listTit cl">
                        <a href="javascript:void(0);"
                           onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=document.getElementsByTagName('BODY')[0].scrollHeight;" class="post_btn">发表新帖</a>
                        <h1 class="z">${moduleInfo.module_name}</h1>
                        <%--<div class="xr_stat z">--%>
                            <%--今日: <span>0</span>--%>
                            <%--<span class="pipe">|</span>--%>
                            <%--主题: <span>${moduleInfo.module_article_count}</span>--%>
                            <%--<span class="pipe">|</span>--%>
                            <%--排名:<span title="上次排名:6">1</span>--%>
                        <%--</div>--%>
                    </div>
                </div>
                <!--板块公告-->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <img src="../../../../style/imgs/app/forum/gonggao.gif" alt="">
                        公告：
                    </div>
                    <div id="forum_rules_38" class="panel-body">
                        <div class="" id="article_post" name="article_post">
                            ${moduleInfo.module_post}
                        </div>

                        <div>版主:
                        <span class="xi2">
                            <a href="#" class="notabs" c="1" mid="card_6270">人造人</a>
                            <span>，</span>
                            <a href=#" class="notabs" c="1" mid="card_3540">lumber2388779</a>
                        </span>
                        </div>
                    </div>
                </div>
                <div class="drag">
                    <!--[diy=diy12]-->
                    <div id="diy12" class="area"></div><!--[/diy]-->
                </div>
                <div id="threadlist" class="xr_tl bp">
                    <!--帖子筛选条件-->
                    <div class="th">
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <th colspan="2">
                                    <div class="tf">
                                        <a id="filter_special" href="javascript:;" class="showmenu xi2">
                                            <div ></div>
                                            全部主题
                                        </a>
                                        <%--<a href="#" class="xi2">--%>
                                            <%--<div></div>--%>
                                            <%--最新--%>
                                        <%--</a>--%>
                                        <%--<a href="#" class="xi2">--%>
                                            <%--<div></div>--%>
                                            <%--热帖--%>
                                        <%--</a>--%>
                                        <%--<a href="#" class="xi2">--%>
                                            <%--<div></div>--%>
                                            <%--精华--%>
                                        <%--</a>--%>
                                        <%--<a id="filter_dateline" href="javascript:;" class="showmenu xi2">更多</a>--%>
                                        <%--<span id="clearstickthread" style="display: none;">--%>
                                            <%--<span class="pipe">|</span>--%>
                                            <%--<a href="javascript:;" class="xi2" title="显示置顶">显示置顶</a>--%>
                                        <%--</span>--%>
                                    </div>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--帖子列表-->
                    <div class="tl">
                        <div id="forumnew" style="display:none">

                        </div>
                        <form method="post" autocomplete="off" name="moderate" id="moderate" action="#">
                            <input type="hidden" name="formhash" value="0c98e636">
                            <input type="hidden" name="listextra" value="page%3D1">
                            <table summary="forum_64" cellspacing="0" cellpadding="0" id="threadlisttableid">
                                <!--置顶帖子-->
                                <div id="hotArticle">
                                <c:forEach items="${articleList_top}" var="atl_top">
                                    <tbody id="normalthread_${atl_top.article_id}">
                                        <tr>
                                            <td class="h_avatar" id="h_avatar">
                                                <a href="#">
                                                    <img src="../../../../style/imgs/user/defaul.gif">
                                                </a>
                                            </td>
                                            <th class="new">
                                                <!--帖子标题-->
                                                <div class="tl_tit cl">
                                                    <!--帖子浏览次数-->
                                                    <span class="views y">${atl_top.article_read_number}人看过</span>
                                                    <span class="y" style="margin-top:4px;">
                                                        <a href="javascript:;" id="content_47" class="showcontent y"
                                                           title="更多操作"></a>
                                                    </span>
                                                    <h3>
                                                        <img src="../../../../style/imgs/app/forum/tuijian4.gif" alt="attach_img"
                                                             title="图片附件" align="absmiddle">
                                                        <a href="/app/article${atl_top.article_id}/content"  class="xst">${atl_top.article_title}</a>
                                                        <img src="../../../../style/imgs/app/forum/jinghua1.gif" alt="attach_img"
                                                             title="图片附件" align="absmiddle">
                                                    </h3>
                                                </div>
                                                <div class="tl_txt cl">
                                                    <!--帖子回复数-->
                                                    <span class="replies y">回复数：${atl_top.article_comment_number}</span>
                                                    <!--发布时间-->
                                                    <p class="publisher">
                                                        <a href="/app/user/user_info${atl_top.article_authorID}/info" title="用户信息页"c="1">
                                                            <span style="color:red">${atl_top.article_author_name}</span>
                                                        </a>
                                                        <span>|</span>于<span>${atl_top.article_create_time_date}</span>发布
                                                    </p>
                                                    <!--最后回复人和时间-->
                                                    <%--<p class="replyer">--%>
                                                        <%--<a href="/app/user/user_info${atl_top.article_last_reply_userID}/info" title="用户信息页" c="1">--%>
                                                            <%--<span style="color:blue">${atl_top.article_last_reply_username}</span>--%>
                                                        <%--</a>--%>
                                                        <%--<span>|</span>最后回复--%>

                                                        <%--<a href="#">--%>
                                                            <%--&lt;%&ndash;<span title="last_reply_timr">${atl_top.article_last_reply_time_date}</span>&ndash;%&gt;--%>
                                                        <%--</a>--%>
                                                    <%--</p>--%>
                                                </div>
                                            </th>
                                            <td class="w1"></td>
                                            <td class="w1"></td>
                                            <td class="w1"></td>
                                        </tr>
                                    </tbody>
                                </c:forEach>
                                </div>
                                <!--板块主题，上面是置顶帖子-->
                                <tbody id="separatorline">
                                <tr class="ts">
                                    <td>&nbsp;</td>
                                    <th>
                                        版块主题<%--<a href="javascript:;" onclick="" title="查看更新" class="forumrefresh">版块主题</a>--%>
                                    </th>
                                </tr>
                                </tbody>
                                <div id="commonArticle">
                                <c:forEach items="${articleList}" var="al">
                                    <tbody id="normalthread_${al.article_id}">
                                        <tr>
                                            <!--作者头像-->
                                            <td class="h_avatar">
                                                <a href="#"><img src="../../../../style/imgs/user/defaul.gif"></a>
                                            </td>
                                            <!--信息-->
                                            <th class="new">
                                                <!--帖子标题-->
                                                <div class="tl_tit cl">
                                                    <!--帖子浏览次数-->
                                                    <span class="views y">${al.article_read_number}人看过</span>
                                                    <span class="y" style="margin-top:4px;">
                                                        <a href="javascript:;" id="content_${al.article_authorID}" class="showcontent y" title="更多操作"></a>
                                                    </span>
                                                    <h3 id="article_title">
                                                        <input type="text" hidden="hidden" id="isHot_${al.article_id}" value="${al.isHot}">
                                                        <input type="text" hidden="hidden" id="isJing_${al.article_id}" value="${al.isJing}">
                                                        <span id="tuijianImg_${al.article_id}"></span>
                                                        <a href="/app/article${al.article_id}/content" onclick="atarget(this)" class="xst">${al.article_title}</a>
                                                        <span id="statusImg_${al.article_id}"></span>
                                                        <script type="text/javascript">
                                                            $(document).ready(function() {
                                                                var isHot = $("#isHot_${al.article_id}").val();
                                                                var isJing = $("#isJing_${al.article_id}").val();
                                                                if(Number(isHot) == 1){
                                                                    $("#tuijianImg_${al.article_id}").html("<img src='../../../../style/imgs/app/forum/tuijian4.gif' alt='attach_img' \
                                                                    title='推荐' align='absmiddle'>");
                                                                    $("#statusImg_${al.article_id}").html("<img src='../../../../style/imgs/app/forum/hot4.gif' alt='attach_img'   \
                                                                        title='火' align='absmiddle'>");
                                                                }
                                                                if(Number(isJing) == 1){
                                                                    $("#statusImg_${al.article_id}").html("<img src='../../../../style/imgs/app/forum/hot4.gif' alt='attach_img'   \
                                                                    title='加精' align='absmiddle'>");
                                                                }
                                                            });
                                                        </script>
                                                    </h3>
                                                </div>
                                                <div class="tl_txt cl">
                                                    <!--帖子回复数-->
                                                    <span class="replies y">回复数：${al.article_comment_number}</span>
                                                    <!--发布时间-->
                                                    <p class="publisher">
                                                        <a href="/app/user/user_info${al.article_authorID}/info" c="1">
                                                            <span style="color:red;">${al.article_author_name}</span></a>|于<span>${al.article_create_time_date}</span>发布
                                                    </p>
                                                    <!--最后回复人和时间-->
                                                    <%--<p class="replyer">--%>
                                                        <%--<a href="/app/user/user_info${al.article_last_reply_userID}/info" title="用户信息页" c="1">--%>
                                                            <%--<span style="color:blue;">${al.article_last_reply_username}</span>--%>
                                                        <%--</a>|最后回复--%>
                                                        <%--<a href="#">--%>
                                                            <%--&lt;%&ndash;<span title="last_reply_time">${al.article_last_reply_time_date}</span>&ndash;%&gt;--%>
                                                        <%--</a>--%>
                                                    <%--</p>--%>
                                                </div>
                                            </th>
                                        </tr>
                                    </tbody>
                                </c:forEach>
                                </div>
                            </table><!-- end of table "forum_G[fid]" branch 1/3 -->
                        </form>
                    </div>
                    <div id="fd_page_bottom" class="cl">

                    </div>
                </div>
                <!--下一页-->
                <%--<a class="bm_h" href="javascript:;" rel="forum.php?mod=forumdisplay&amp;fid=83&amp;page=2" curpage="1" id="autopbn" totalpage="60" picstyle="0" forumdefstyle="">--%>
                    <%--<span>下一页 »</span>--%>
                <%--</a>--%>
                <!--[diy=diyfastposttop]-->
                <div id="diyfastposttop" class="area"></div><!--[/diy]-->
                <!--底部快速发帖-->
                <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
                <script type="text/javascript" src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script>
                <div id="f_pst" class="pl bm bmw">
                    <form method="post" autocomplete="off" id="fastpostform">
                    <div class="form-control" style="margin-bottom: 5px;">
                        <label for="article_title">在此输入主题标题</label>
                        <input  type="text" id="article_title_new" name="article_title_new" style="width: 600px; border-top:none;border-left:none;border-right:none;border-bottom: 1px solid black;">
                    </div>
                        <textarea id="content" name="new_content">
                            <c:if test="${sessionScope.UserInfo_session == '用户退出成功' || empty sessionScope.UserInfo_session}">
                                <span style="color:red; font-size: 16px;">用户尚未登录，请登录</span>
                            </c:if>
                        </textarea>
                        <button id="save" class="btn btn-primary">发表新帖</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../../../../style/js/app/forum.js"></script>
<script src="../../../../style/js/bootstrap.js"></script>
<script src="../../../../style/js/app/app.js"></script>
<script>
    var editor = null;
    editor = CKEDITOR.replace( 'content', {
        customConfig:'${pageContext.request.contextPath}/ckeditor/config.js'
    });
    CKFinder.setupCKEditor( editor, '${pageContext.request.contextPath}/ckfinder/' );
    $(function(){
        $("#save").click(function(){
            if ($("#user_id").val()== null){
                alert("请先登录！");
                window.location.href = "http://localhost:8080/app/login/loginview";
            }
            else if($("#article_title_new").val() == ""){
                alert("主题不能为空！");
            }
            else{
                query = {
                    "article_author_id": $("#user_id").val(),
                    "article_title_new": $("#article_title_new").val(),
                    "article_content": CKEDITOR.instances.content.getData(),
                    "forum_id": ${moduleInfo.forum.forum_id},
                    "module_id": ${moduleInfo.module_id}
                },
                    $.ajax({
                        url:"${pageContext.request.contextPath}/app/article/newarticle",
                        type:'post',
                        data: query,
                        dataType:'html',
                        success:function(data,status){
                            if(data=="1"){
                                alert("帖子发表成功");
                                window.location.reload();
                            }else if (data=="0"){
                                alert("插入数据库错误");
                            }
                        },
                        error:function(xhr,textStatus,errorThrown){
                            alert("请求错误！");
                        }
                    });
            }

        });
        //

    });
    $("#logout").click(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/app/login/logout",
            type: 'post',
            success: function (data, status) {
                if (data == "1") {
                    alert("退出成功");
                    window.location.reload();
                } else if (data == "0") {
                    alert("error");
                }
            },
            error: function (xhr, textStatus, errorThrown) {
                alert("error！");
            }
        });
    });
    $(function () {
        if (${sessionScope.UserInfo_session == '用户退出成功' || empty sessionScope.UserInfo_session}) {
            $("#save").attr("disabled", "disabled");
        } else {
            $("#save").removeAttr("disabled");
        }

        if (${sessionScope.UserInfo_session != null}) {
            if (${sessionScope.UserInfo_session.wantschool == null}) {
                alert("您尚未完善用户信息，请填写您的资料！");
                window.location.href = "http://localhost:8080/app/user/user_info${sessionScope.UserInfo_session.user_info_id}/setting";
            }
        }
    });


</script>
</body>

</html>