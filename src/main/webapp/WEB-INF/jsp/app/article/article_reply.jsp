<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入JSTL-->
<%@include file="../../../jsp/common/tag.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>帖子内容</title>
    <link rel="stylesheet" href="../../../../style/css/bootstrap.css">
    <link rel="stylesheet" href="../../../../style/css/app/article.css">
    <link rel="stylesheet" href="../../../../style/css/app/common-wangdao.css">
    <link rel="stylesheet" href="../../../../style/css/app/forum.css">
    <link rel="stylesheet" href="../../../../style/css/app/widthauto.css">
    <style>
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
        .xw1{
            display: block;
            font-size:12px;
            /*color:#fff;*/
            margin-left:20px;

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
</div>
<div id="wp" class="wp">
    <!--面包屑导航-->
    <div id="pt" class="bm cl">
        <div class="z">
            <a href="" class="nvhm" title="首页">王道论坛,专注于计算机考研的点点滴滴！</a>
            <em>»</em>
            <a href="/app/index">论坛</a> <em>›</em>
            <a href="/app/index">${articleInfo.article_forum_name}</a><em>»</em>
            <a href="/app/module${articleInfo.article_module_id}/list">${articleInfo.article_module_name}</a>
            <em>›</em> <a href="#">${articleInfo.article_title}</a>
        </div>
    </div>
    <div class="wp">
        <!--[diy=diy1]-->
        <div id="diy1" class="area"></div><!--[/diy]-->
    </div>
    <!--content-->
    <div id="ct" class="wp cl">
        <!--帖子头部发新帖+分页-->
        <div id="pgt" class="pgs mbm cl ">
            <!--分页-->
            <div class="pgt">
                <div class="pg"><strong>1</strong>
                    <a href="thread-5565-2-1.html">2</a>
                    <a href="thread-5565-3-1.html">3</a>
                    <a href="thread-5565-4-1.html">4</a>
                    <a href="thread-5565-5-1.html">5</a>
                    <label>
                        <input type="text" name="custompage" class="px" size="2" title="输入页码，按回车快速跳转" value="1"
                               onkeydown="if(event.keyCode==13) {window.location='forum.php?mod=viewthread&amp;tid=5565&amp;extra=page%3D1&amp;page='+this.value;; doane(event);}">
                        <span title="共 5 页"> / 5 页</span>
                    </label>
                    <a href="thread-5565-2-1.html" class="nxt">下一页</a>
                </div>
            </div>
            <span class="y pgb">
                <a href="forum-83-1.html">返回列表</a>
            </span>
            <a id="newspecial" onmouseover="$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';showMenu({'ctrlid':this.id})" onclick="showWindow('newthread', 'forum.php?mod=post&amp;action=newthread&amp;fid=83')" href="javascript:;" title="发新帖">
                <img src="../../../../style/imgs/app/forum/pn_post.png" alt="发新帖">
            </a>
        </div>
        <!--主要内容-->
        <div id="postlist" class="pl bm">
            <!--帖子头部：查看、回复、帖子标题等-->
            <table cellspacing="0" cellpadding="0">
                <tbody>
                    <tr>
                        <td class="pls ptn pbn">
                            <div class="hm ptn">
                                <span class="xg1">查看:</span>
                                <span class="xi1">${articleInfo.article_read_number}</span>
                                <span class="pipe">|</span>
                                <span class="xg1">回复:</span>
                                <span class="xi1">${articleInfo.article_comment_number}</span>
                            </div>
                        </td>
                        <td class="plc ptm pbn vwthd">
                            <!--帖子标题-->
                            <h1 class="ts">
                                <span id="thread_subject">${articleInfo.article_title}</span>
                            </h1>
                            <!--复制当前链接-->
                            <span class="xg1">
                                <a href="#" onclick="return copyThreadUrl(this, '王道论坛,专注于计算机考研的点点滴滴！')">[复制链接]</a>
                            </span>
                        </td>
                    </tr>
                </tbody>
            </table>
            <!--帖子头部和帖子内容分割线-->
            <table cellspacing="0" cellpadding="0" class="ad">
                <tbody>
                <tr>
                    <td class="pls">
                    </td>
                    <td class="plc">
                    </td>
                </tr>
                </tbody>
            </table>
            <!--帖子作者发表的内容-->
            <div id="post_${articleInfo.article_id}">
                <table id="pid${articleInfo.article_id}" class="plhin" summary="pid${articleInfo.article_id}" cellspacing="0" cellpadding="0">
                    <tbody>
                    <!--内容-->
                    <tr>
                        <!--会员信息-->
                        <td class="pls" rowspan="2">
                            <div id="favatar${articleInfo.article_id}" class="pls favatar" style="top: 0px;">
                                <a name="newpost"></a>
                                <div class="pi">
                                    <div class="authi">
                                        <!--用户名-->
                                        <a href="space-uid-${articleAuthorInfo.user_info_id}.html" target="_blank" class="xw1">${articleAuthorInfo.name}</a>
                                    </div>
                                </div>
                                <div class="p_pop blk bui card_gender_0" id="userinfo${articleInfo.article_id}" style="display: none; margin-top: -11px;">
                                    <div class="m z">
                                        <div id="userinfo${articleInfo.article_id}_ma"></div>
                                    </div>
                                    <div class="i y">
                                        <div>
                                            <strong>
                                                <a href="space-uid-7462.html" target="_blank" class="xi2" style="color: black">${articleAuthorInfo.name}</a>
                                            </strong>
                                        </div>
                                        <dl class="cl">
                                            <dt>积分</dt>
                                            <dd>
                                                <a href="#" target="_blank" class="xi2">0</a>
                                            </dd>
                                        </dl>

                                        <div id="avatarfeed">
                                            <span id="threadsortswait"></span>
                                        </div>
                                    </div>

                                </div>
                                <div>
                                    <div class="avatar" onmouseover="showauthor(this, 'userinfo1686221')">
                                        <a href="space-uid-217107.html" class="avtm" target="_blank">
                                            <img src="http://www.cskaoyan.com/uc_server/images/noavatar_middle.gif" onerror="this.onerror=null;this.src='http://www.cskaoyan.com/uc_server/images/noavatar_middle.gif'"></a>
                                    </div>
                                </div>
                                <!--作者发表主题、发表回复、积分信息-->
                                <div class="tns xg2">
                                    <table cellspacing="0" cellpadding="0">
                                        <tbody>
                                        <tr>
                                            <th>
                                                <p>
                                                    <a href="#" class="xi2">8</a>
                                                </p>主题
                                            </th>
                                            <th>
                                                <p>
                                                    <a href="#" class="xi2">24</a>
                                                </p>帖子
                                            </th>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <p>
                                    <em>
                                        <a href="#" target="_blank">
                                            <font color="black">${articleAuthorInfo.user_type_name}</font>
                                        </a>
                                    </em>
                                </p>
                                <!--主题作者信息-->
                                <dl class="pil cl">
                                    <dt>考研年份</dt>
                                    <dd>${articleAuthorInfo.examYear}</dd>
                                    <dt>报考学校</dt>
                                    <dd>${articleAuthorInfo.wantschool}</dd>
                                    <dt>本科学校</dt>
                                    <dd>${articleAuthorInfo.bkschool}</dd>
                                    <dt>注册时间</dt>
                                    <dd>${articleAuthorInfo.registerTime_date}</dd>
                                </dl>
                                <dl class="pil cl"></dl>
                            </div>
                        </td>
                        <!--主题信息-->
                        <td class="plc">
                            <div class="pi">
                                <strong>
                                    <a href="thread-5565-1-1.html" id="postnum62498" onclick="setCopy(this.href, '帖子地址复制成功');return false;">
                                        <em>1</em>楼
                                    </a>
                                </strong>
                                <!--主题内容-->
                                <div class="pti">
                                    <div class="pdbt">
                                    </div>
                                    <!--主题作者信息-->
                                    <div class="authi">
                                        发表于
                                        <span class="pipe">|</span>
                                        <em id="authorposton${articleInfo.article_id}">${articleInfo.article_create_time_date}</em>

                                    </div>
                                </div>
                            </div>
                            <!--主题主要内容-->
                            <div class="pct">
                                <div class="pcb">
                                    <div class="pcbs">
                                        <div class="t_fsz">
                                            <table cellspacing="0" cellpadding="0"><tbody>
                                                <tr>
                                                    <td class="t_f" id="postmessage_2202053">
                                                    <br>
                                                        ${articleInfo.article_content}
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div id="comment_${articleInfo.article_id}" class="cm">
                                    </div>
                                    <div id="post_rate_div_${articleInfo.article_id}"></div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <!--收藏、喜欢、转发-->
                    <tr>
                        <td class="plc plm">
                            <div id="p_btn" class="mtw mbm hm cl">
                                <a href="#"  onclick="articleCollcet(4)" title="收藏本帖">
                                    <i>
                                        <img src="../../../../style/imgs/app/forum/fav.gif" alt="收藏">收藏
                                        <span>${articleInfo.article_collect_counts}</span>
                                    </i>
                                </a>
                                <a class="sharep" href="#" title="分享推精华" onclick="articleCollcet(3)">
                                    <i>
                                        <img src="../../../../style/imgs/app/forum/oshr.png" alt="分享">分享
                                        <span>${articleInfo.article_share_count}</span>
                                    </i>
                                </a>
                                <a id="recommend_add" href="#" onclick="articleCollcet(1)" title="顶一下">
                                    <i>
                                        <img src="../../../../style/imgs/app/forum/rec_add.gif" alt="顶">顶
                                        <span>${articleInfo.article_good_counts}</span>
                                    </i>
                                </a>
                                <a id="recommend_subtract" href="#" onclick="articleCollcet(2)" title="踩一下">
                                    <i><img src="../../../../style/imgs/app/forum/rec_subtract.gif" alt="踩">踩
                                        <span>${articleInfo.article_notgood_counts}</span>
                                    </i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr id="_postposition${articleInfo.article_id}"></tr>
                    <!--回复、举报-->
                    <tr>
                        <td class="pls"></td>
                        <td class="plc" style="overflow:visible;">
                            <div class="po hin">
                                <div class="pob cl">
                                    <em>
                                        <a class="fastre"
                                           href="forum.php?mod=post&amp;action=reply&amp;fid=83&amp;tid=5565&amp;reppost=62498&amp;extra=page%3D1&amp;page=1"
                                           onclick="showWindow('reply', this.href)">回复</a>
                                    </em>

                                    <p>
                                        <a href="javascript:;"
                                           onclick="showWindow('miscreport62498', 'misc.php?mod=report&amp;rtype=post&amp;rid=62498&amp;tid=5565&amp;fid=83', 'get', -1);return false;">举报</a>
                                    </p>

                                </div>
                            </div>
                        </td>
                    </tr>
                    <!--广告-->
                    <tr class="ad">
                        <td class="pls">
                        </td>
                        <td class="plc">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!--回复帖子列表-->
            <c:forEach var="rl" items="${replyList}" varStatus="index">
            <div id="post_${rl.reply_id}">
                <table id="pid${rl.reply_id}" class="plhin" summary="pid${rl.reply_id}" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <!--回复作者信息-->
                        <td class="pls" rowspan="2">
                            <div id="favatar${rl.reply_id}" class="pls favatar" style="top: 0px;">
                                <div class="pi">
                                    <div class="authi">
                                        <a href="space-uid-${rl.reply_id}.html" target="_blank" class="xw1"
                                           style="color: black">${rl.userInfo.name}</a>
                                    </div>
                                </div>
                                <div class="p_pop blk bui card_gender_0" id="userinfo${rl.reply_id}"
                                     style="display: none; margin-top: -11px;">
                                    <div class="m z">
                                        <div id="userinfo${rl.reply_id}_ma"></div>
                                    </div>
                                    <div class="i y">
                                        <div>
                                            <strong>
                                                <a href="space-uid-${rl.reply_id}.html" target="_blank" class="xi2" style="color: black">${rl.userInfo.name}</a>
                                            </strong>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <!--用户头像-->
                                    <div class="avatar" onmouseover="showauthor(this, 'userinfo${rl.reply_id}')">
                                        <a href="space-uid-${rl.userInfo.user_info_id}.html" class="avtm" target="_blank">
                                            <img src="http://www.cskaoyan.com/uc_server/data/avatar/000/00/23/85_avatar_middle.jpg"
                                            onerror="this.onerror=null;this.src='http://www.cskaoyan.com/uc_server/images/noavatar_middle.gif'">
                                        </a>
                                    </div>
                                </div>
                                <div class="tns xg2">
                                    <table cellspacing="0" cellpadding="0">
                                        <tbody>
                                        <tr>
                                            <th>
                                                <p>
                                                    <a href="#">0</a>
                                                </p>主题
                                            </th>
                                            <th>
                                                <p>
                                                    <a href="#" class="xi2">0</a>
                                                </p>帖子
                                            </th>

                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--称号-->
                                <p>
                                    <em>
                                    <a href="#" target="_blank">
                                        <font color="black">${rl.userInfo.user_type_name}</font>
                                    </a>
                                    </em>
                                </p>
                                <dl class="pil cl">
                                    <dt>考研年份</dt>
                                    <dd>${rl.userInfo.examYear}</dd>
                                    <dt>报考学校</dt>
                                    <dd>${rl.userInfo.bkschool}</dd>
                                    <dt>本科学校</dt>
                                    <dd>${rl.userInfo.wantschool}</dd>
                                    <dt>注册时间</dt>
                                    <dd>${rl.userInfo.registerTime_date}</dd>
                                </dl>
                                <dl class="pil cl"></dl>
                            </div>
                        </td>
                        <!--回复-->
                        <td class="plc">
                            <!--回复时间-->
                            <div class="pi">
                                <strong>
                                    <a href="#" id="postnum62774" onclick="setCopy(this.href, '帖子地址复制成功');return false;">
                                        <em>${index.count+1}</em>楼</a>
                                </strong>
                                <div class="pti">
                                    <div class="pdbt">
                                    </div>
                                    <div class="authi">

                                        <em id="authorposton${rl.reply_id}">发表于 <span class="pipe">|</span>${rl.reply_time_date}</em>
                                    </div>
                                </div>
                            </div>
                            <!--回复内容-->
                            <div class="pct">
                                <div class="pcb">
                                    <div class="pcbs">
                                        <table cellspacing="0" cellpadding="0">
                                            <tbody>
                                            <tr>
                                                <td class="t_f" id="postmessage_${rl.reply_id}">
                                                    ${rl.reply_content}
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="comment_${rl.reply_id}" class="cm">
                                    </div>
                                    <div id="post_rate_div_${rl.reply_id}"></div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr id="_postposition${rl.reply_id}"></tr>
                    <tr>
                        <td class="pls"></td>
                        <td class="plc" style="overflow:visible;">
                            <div class="po hin">
                                <div class="pob cl">
                                    <em>
                                        <a class="fastre"
                                           href="forum.php?mod=post&amp;action=reply&amp;fid=83&amp;tid=5565&amp;repquote=62774&amp;extra=page%3D1&amp;page=1"
                                           onclick="showWindow('reply', this.href)">回复</a>
                                    </em>

                                    <p>
                                        <a href="javascript:;"
                                           onclick="showWindow('miscreport62774', 'misc.php?mod=report&amp;rtype=post&amp;rid=62774&amp;tid=5565&amp;fid=83', 'get', -1);return false;">举报</a>
                                    </p>

                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            </c:forEach>
            <div id="postlistreply" class="pl">
                <div id="post_new" class="viewthread_table" style="display: none"></div>
            </div>
        </div>
        <!--帖子底部下一页-->
        <div class="pgbtn">
            <a href="#" hidefocus="true" class="bm_h">下一页 »</a>
        </div>
        <!--底部分页-->
        <div class="pgs mtm mbm cl">
            <div class="pg">
                <strong>1</strong>
                <a href="thread-5565-2-1.html">2</a>
                <a href="thread-5565-3-1.html">3</a>
                <a href="thread-5565-4-1.html">4</a>
                <a href="thread-5565-5-1.html">5</a>
                <label>
                    <input type="text" name="custompage" class="px" size="2" title="输入页码，按回车快速跳转" value="1"
                           onkeydown="if(event.keyCode==13) {window.location='forum.php?mod=viewthread&amp;tid=5565&amp;extra=page%3D1&amp;page='+this.value;; doane(event);}">
                    <span title="共 5 页"> / 5 页</span>
                </label><a href="thread-5565-2-1.html" class="nxt">下一页</a>
            </div>
            <span class="pgb y"><a href="forum-83-1.html">返回列表</a></span>
        </div>
        <!--用户未登录或不足，大家都在看-->
        <c:if test="${sessionScope.UserInfo_session == '用户退出成功' || empty sessionScope.UserInfo_session}">
            <style>
                .recommoned li{
                    float: left;
                    width: 19%;
                    height:150px;
                    margin-right: 12px;

                }
                .recommoned li p{
                    width: 100%;
                    overflow: hidden;
                    white-space: nowrap;
                    text-overflow: ellipsis;  /*超出省略号代替*/
                }
                .recommoned .hot_img{
                    display: inline-block;
                    width: 10%;
                }
                .recommoned .panel-heading p{
                    float: left;
                    width: 90%;
                }
                .recommoned a{
                    color:blue !important;
                }
                .recommoned .bck{
                    background-color: white;
                }
            </style>
            <div  class="panel panel-primary recommoned">
                <div class="panel-heading">
                    <span class="rec_title" style="font-size: 16px;"><strong>大家都在看</strong></span>
                </div>
                <div class="panel-body">
                    <ul>
                        <c:forEach items="${recArticleList}" var="ra">
                            <li>
                                <div class="panel panel-default">
                                    <div class="panel-heading bck">
                                        <div class="hot_img">
                                        <img src="../../../../style/imgs/app/forum/hot1.gif" alt="">
                                        </div>
                                        <p><a href="">${ra.article_title}</a></p>
                                    </div>
                                    <div class="panel-body">
                                        <span>点击：${ra.article_read_number}</span>
                                        <span>回复：${ra.article_comment_number}</span>
                                    </div>
                                    <div class="panel-footer">
                                        主题热度：${ra.article_scores}
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </c:if>
        <!--用户已经登录-->
        <c:if test="${sessionScope.UserInfo_session != null}">
            <style>
                    .recommoned li{
                        float: left;
                        width: 19%;
                        height:150px;
                        margin-right: 12px;

                    }
                    .recommoned li p{
                        width: 100%;
                        overflow: hidden;
                        white-space: nowrap;
                        text-overflow: ellipsis;  /*超出省略号代替*/
                    }
                    .recommoned .hot_img{
                        display: inline-block;
                        width: 10%;
                    }
                    .recommoned .panel-heading p{
                        float: left;
                        width: 90%;
                    }
                    .recommoned a{
                        color:blue !important;
                    }
                    .recommoned .bck{
                        background-color: white;
                    }
                </style>
            <div  class="panel panel-primary recommoned">
                    <div class="panel-heading">
                        <span class="rec_title" style="font-size: 16px;"><strong>你可能还想看</strong></span>
                    </div>
                    <div class="panel-body">
                        <ul>
                            <c:forEach items="${recArticleList}" var="ra">
                                <li>
                                    <div class="panel panel-default">
                                        <div class="panel-heading bck">
                                            <div class="hot_img">
                                                <img src="../../../../style/imgs/app/forum/hot1.gif" alt="">
                                            </div>
                                            <p><a href="">${ra.article_title}</a></p>
                                        </div>
                                        <div class="panel-body">
                                            <span>点击：${ra.article_read_number}</span>
                                            <span>回复：${ra.article_comment_number}</span>
                                        </div>
                                        <div class="panel-footer">
                                            主题热度：${ra.article_scores}
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
        </c:if>
        <!--[diy=diyfastposttop]-->
        <div id="diyfastposttop" class="area"></div><!--[/diy]-->
        <!--底部快速发帖-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script>
        <div id="f_pst" class="pl bm bmw">
            <form method="post" autocomplete="off" id="fastpostform">
                <textarea id="content" name="new_content">
                    <c:if test="${sessionScope.UserInfo_session == '用户退出成功' || empty sessionScope.UserInfo_session}">
                        <span style="color:red; font-size: 16px;">用户尚未登录，请登录</span>
                    </c:if>
                </textarea>
                <button id="save" class="btn btn-primary">发表回复</button>
            </form>
        </div>
    </div>
    <div class="wp mtn">
        <!--[diy=diy3]-->
        <div id="diy3" class="area"></div><!--[/diy]-->
    </div>
</div>
<script src="../../../../style/js/app/forum.js"></script>
<script src="../../../../style/js/jquery.min.js"></script>
<script src="../../../../style/js/bootstrap.js"></script>
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
                window.location.href = "http://localhost:8080/app/login/login";
            }
            else{
                query = {
                    "reply_author_id": $("#user_id").val(),
                    "article_id": ${articleInfo.article_id},
                    "reply_content": CKEDITOR.instances.content.getData()
                },
                    $.ajax({
                        url:"${pageContext.request.contextPath}/app/article/newreply",
                        type:'post',
                        data: query,
                        dataType:'json',
                        success:function(data,status){
                            if(data=="1"){
                                alert("发表回复成功");
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
    function articleCollcet(typeId){
        if ($("#user_id").val()== null){
            alert("请先登录！");
            window.location.href = "http://localhost:8080/app/login/loginview";
        }
        else{
            query = {
                "user_info_id": $("#user_id").val(),
                "article_id": ${articleInfo.article_id}
            },
                $.ajax({
                    url:"${pageContext.request.contextPath}/app/article/type" + typeId + "/update",
                    type:'post',
                    data: query,
                    dataType:'json',
                    success:function(data,status){
                        if(data=="9"){
                            alert("成功");
                            window.location.reload();
                        }else if (data=="8"){
                            alert("插入数据库错误");
                        }else if (data=="1"){
                            alert("您已经点过赞");
                        }else if (data== "2"){
                            alert("您已经踩过");
                        }else if(data == "4"){
                            alert("您已经收藏过本帖子");
                        }
                    },
                    error:function(xhr,textStatus,errorThrown){
                        alert("请求错误！");
                        window.location.reload();
                    }
                });
        }
    }


</script>
</body>
</html>