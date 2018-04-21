<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta><meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/main.css" />


    <title>敛书网 - 首页</title>
</head>
<body>
    <%@include file="common/loginHead.jsp"%>

    <%@include file="common/userHead.jsp"%>


<div id="main" class="container">

    <div class="leaderboard">

        <form class="search col-md-4 col-sm-6 col-md-offset-4" action="bookSearch" method="get">
            <div class="input-group">
                <div class="selectDiv">
                    <select name="searchBy" class="select">
                        <option class="option" value="book_title" selected="selected">书名</option>
                        <option class="option" value="book_author">作者</option>
                    </select>
                </div>
                <input name="searchTxt" class="form-control" type="text">
                <div class="input-group-btn">
                    <button class="btn btn-success" type="submit">搜索</button>
                </div>
            </div>
        </form>

        <div class="uploadBtn col-md-3 col-sm-4 col-md-offset-1">
            <button  class="btn btn-primary" type="button">
                我要上传&nbsp;<span class="glyphicon glyphicon-upload"></span></button>
        </div>

    </div>

    <br>

    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-info">
                <div class="panel-heading"><h4>热门下载</h4></div>
                <ul class="list-group">

                    <c:forEach items="${rankingBooks1}" var="rankingBook">
                        <li class="list-group-item">
                            <a href="bookDetail?bookID=${rankingBook.id}">${rankingBook.bookName}</a>
                            <span class="pull-right">${rankingBook.download_times}</span>
                        </li>
                    </c:forEach>

                </ul>

            </div>
        </div>

        <div class="col-md-4">
            <div class="panel panel-success">
                <div class="panel-heading"><h4>最新上传</h4></div>
                <ul class="list-group">

                    <c:forEach items="${rankingBooks}" var="rankingBook">
                        <li class="list-group-item">
                            <a href="bookDetail?bookID=${rankingBook.id}">${rankingBook.bookName}</a>
                            <span class="pull-right">[${rankingBook.uploadDate}]</span>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div>

        <div class="col-md-3">
            <div class="panel panel-danger">
                <div class="panel-heading"><h4>站内数据</h4></div>
                <ul class="list-group">
                    <li class="list-group-item">电子图书总数
                        <span class="badge pull-right">${sumOfBooks}</span> </li>
                    <li class="list-group-item">经典文学总数
                        <span class="badge pull-right">${sumOfTypeBooks.get(0)}</span> </li>
                    <li class="list-group-item">通俗小说总数
                        <span class="badge pull-right">${sumOfTypeBooks.get(1)}</span> </li>
                    <li class="list-group-item">计算机类总数
                        <span class="badge pull-right">${sumOfTypeBooks.get(2)}</span> </li>
                    <li class="list-group-item">杂志期刊总数
                        <span class="badge pull-right">${sumOfTypeBooks.get(3)}</span> </li>
                    <li class="list-group-item">最后更新日期
                        <span class="badge pull-right">${maxUploadDate}</span> </li>
                </ul>
            </div>
        </div>

    </div>
</div>

<hr>

<footer>
    <p class="text-center">
        &copy; 2017
    </p>
</footer>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/userLogin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/userRegister.js"></script>
</body>
</html>

