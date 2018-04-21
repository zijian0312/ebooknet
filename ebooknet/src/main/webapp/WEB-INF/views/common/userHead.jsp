<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--导航栏（包括左侧图标、导航链接和右侧的按钮组）--%>
<div id="userHead" class="navbar navbar-default navbar-fixed-top hide">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index">
                <img src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse clearfix">
            <ul class="nav navbar-nav">
                <li><a href="index">首页</a> </li>
                <li><a href="bookList?bookType=经典文学">经典文学</a> </li>
                <li><a href="bookList?bookType=通俗小说">通俗小说</a> </li>
                <li><a href="bookList?bookType=计算机类">计算机类</a> </li>
                <li><a href="bookList?bookType=杂志期刊">杂志期刊</a> </li>
            </ul>
            <%--登录后用用户头像替换登录按钮组--%><!--用户头像信息-->
            <div id="loginedInfo" class="pull-right">
                <a data-toggle="popover" data-placement="bottom" href="#">
                    <img class="img-circle" src="" alt="">
                </a>
            </div>

        </div>
    </div>
</div>

