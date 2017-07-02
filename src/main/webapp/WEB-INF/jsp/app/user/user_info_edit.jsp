<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../jsp/common/tag.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>个人资料修改</title>
    <link rel="stylesheet" href="../../../../style/css/bootstrap.css">
    <link rel="stylesheet" href="../../../../style/css/app/userinfo.css">
    <link rel="stylesheet" href="../../../../style/js/app/bootstrapValidator.min.css">
    <style>
        #user_msg{
            border: none;
        }
    </style>
</head>
<body style="background: #E3E5E8;">
<div clasa="hd">
    <div class="navbar navbar-default navbarcolor" style="background-color: #fff;">
        <div id="logo" class="col-md-6">
            <img src="../../../../style/imgs/app/forum/logo.png" alt="">
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
                        <a class="btn btn-info" href="/app/user/user_info${sessionScope.UserInfo_session.user_info_id}/info" title="点击修改个人资料">
                            <span class="glyphicon glyphicon-user"></span> ${sessionScope.UserInfo_session.name}
                        </a>
                        <a href="/app/login/logout" class="btn btn-danger">退出</a>
                    </li>
                </c:if>
            </ul>
        </div>

    </div>
</div>
<div class=" container">
    <div class="panel panel-primary">
        <div class="panel-heading">个人资料</div>
        <div class="panel-body">
            <div style="border-bottom: 1px solid black">
                <div class="avt">
                    <img src="http://www.aqinet.cn/uc_server/avatar.php?uid=39&size=small" alt="头像">
                </div>
                <h2 class="mt"><input type="text" value="昵称"></h2>
                <span>个人签名(点击签名修改)</span>
                <input type="text" id="user_msg" value="永不放弃！">
            </div>
            <div id="user_info_detail">
                    <form class="form-group form-horizontal" id="user_info_setting">
                        <div class="form-group col-md-5" >
                            <label for="name" class="col-md-3 control-label">昵称</label>
                            <div class="col-md-9">
                                <input id="name" class="form-control" type="text"
                                       placeholder="6-15位字母或数字" name="name" value="${user_info_detail.name}">
                            </div>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="email" class="col-md-3 control-label">邮箱</label>
                            <div class="col-md-9" >
                                <input class="form-control" id="email" type="email"
                                       placeholder="例如:123@123.com" name="user_email" value="${user_info_detail.user_email}">
                            </div>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="exam_year" class="col-md-3 control-label">考研年份</label>
                            <div class="col-md-9">
                                <select name="exam_year" id="exam_year">
                                    <option value="2017" selected>2017</option>
                                    <option value="2016">2016</option>
                                    <option value="2015">2015</option>
                                    <option value="2014">2014</option>
                                    <option value="2013">2013</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group col-md-5">
                            <label for="user_gender" class="col-md-3 control-label">性别</label>
                            <div class="col-md-9">
                                <select name="user_gender" id="user_gender">
                                    <option value="0" selected>男</option>
                                    <option value="1">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="" class="col-md-3 control-label">家乡</label>
                            <div id="city" class="col-md-9">

                                <select class="prov" name="user_home_province" id="home_prov"></select>
                                <select class="city" disabled="disabled" name="user_home_city" id="home_city"></select>
                            </div>
                        </div>

                        <div class="form-group col-md-5">
                            <label for="selectSchool" class="col-md-3 control-label">本科学校(*)</label>
                            <input value="${user_info_detail.bkschool}" id="selectSchool" type="text" name="user_ben_school">
                            <div id="choose-box-wrapper" class="choose-box-wrapper col-md-9">
                                <div id="choose-box" class="choose-box">
                                    <div id="choose-box-title" class="choose-box-title">
                                        <span>选择学校</span>
                                    </div>
                                    <p style="font-size:12px;text-indent:1em;"><span>搜索：</span>
                                        <input id="searchSchool" class="form-control" type="text" value="搜索学校"/></p>
                                    <div id="choose-a-province" class="choose-a-province">
                                    </div>
                                    <div id="choose-a-school" class="choose-a-school" name="user_home_city">
                                    </div>
                                    <div id="choose-box-bottom" class="choose-box-bottom">
                                        <input type="button" id='close' value="关闭" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="selectSchool" class="col-md-3 control-label">报考学校(*)</label>
                            <input value='${user_info_detail.wantschool}' id='wantSchool' type='text' name="user_want_school">
                            <div id="choose-box-wrapper-wantschool" class="choose-box-wrapper">
                                <div id="choose-box-wantschool" class="choose-box clo-md-9">
                                    <div id="choose-box-title-wantschool" class="choose-box-title">
                                        <span>选择学校</span>
                                    </div>
                                    <p style="font-size:12px;text-indent:1em;"><span>搜索：</span>
                                        <input id="searchSchool-wantschool" class="form-control" type="text" value="搜索学校"/></p>
                                    <div id="choose-a-province-wantschool" class="choose-a-province">
                                    </div>
                                    <div id="choose-a-school-wantschool" class="choose-a-school">
                                    </div>
                                    <div id="choose-box-bottom-wantschool" class="choose-box-bottom">
                                        <input type="button" id='close-wantschool' value="关闭" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <input type="text" hidden id="user_info_id" name="user_info_id" value="${user_info_detail.user_info_id}">
                            <button id="submitBtn" class="btn btn-primary btn-large btn-block" type="submit">提交</button>
                        </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="../../../../style/js/jquery.min.js"></script>
<script src="../../../../style/js/bootstrap.js"></script>
<script type="text/javascript" src="../../../../style/js/app/chinaUniversityList.js"></script>
<script type="text/javascript" src="../../../../style/js/app/chinaUniversitySelect.js"></script>
<script type="text/javascript" src="../../../../style/js/app/bootstrapValidator.min.js"></script>
<script src="../../../../style/js/app/jquery.cityselect.js"></script>
<script type="text/javascript" src="../../../../style/js/app/formValidator.js"></script>
<script>
    $("#city").citySelect({
        url:"../../../../style/js/app/city.min.js",
        prov:"江苏", //省份
        city:"南京", //城市
        nodata:"none" //当子集无数据时，隐藏select
    });
    //初始化数据
    $(document).ready(function() {
        $("#user_gender").children("option[value='${user_info_detail.user_gender}']").attr("selected","true");
        $("#exam_year").children("option[value='${user_info_detail.examYear}']").attr("selected","true");
    });
     $(function(){
         $("#submitBtn").click(function(){
             query = {
                 "user_info_id": $("#user_info_id").val(),
                 "name": $("#name").val(),
                 "user_email": $("#email").val(),
                 "user_ben_school": $("#selectSchool").val(),
                 "user_want_school": $("#wantSchool").val(),
                 "user_gender": $("#user_gender option:selected").val(),
                 "exam_year": $("#exam_year option:selected").val(),
                 "user_home_province": $("#home_prov option:selected").val(),
                 "user_home_city": $("#home_city option:selected").val()
             }
                 $.ajax({
                     url:"${pageContext.request.contextPath}/app/user/user_info${user_info_detail.user_info_id}/edit",
                     type:'post',
                     data: query,
                     dataType:'json',
                     cache:false,
                     success:function(data,status){
                         if(status=="success"){

                             if(data=="1"){
                                 alert("修改成功");
                                 window.location.href = "http://localhost:8080/app/user/user_info${user_info_detail.user_info_id}/setting";
                             }else if (data=="0"){
                                 alert("修改失败");
                             }else if(data=="2"){
                                 alert("用户尚未登录，请登录");
                                 window.location.href = "http://localhost:8080/app/loginview";
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