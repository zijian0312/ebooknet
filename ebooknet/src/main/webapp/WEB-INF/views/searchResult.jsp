<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta><meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/searchResult.css" />


    <title>敛书网 - 搜索结果</title>
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
        <div class="col-md-10 col-md-offset-1 col-xs-12">
            <table class="table table-hover">
                <caption class="h4">“<span class="text-primary">${searchTxt}</span>”&nbsp;的搜索结果
                    <span class="pull-right small">共${books.size()}条记录</span></caption>
                <thead>
                <tr>
                    <th class="col-md-2 col-xs-6">封面</th>
                    <th class="col-md-2 col-xs-6">书名</th>
                    <th class="col-md-2 col-xs-6">作者</th>
                    <th class="col-md-2 col-xs-6">出版时间</th>
                    <th class="col-md-4 col-xs-12">简介</th>
                </tr>
                </thead>
                <tbody>

                    <c:forEach items="${books}" var="book">
                        <tr>
                            <td class="bookCover"><img src="getBookCover?coverPath=${book.book_cover}" alt="${book.book_title}"></td>
                            <td class="bookInfo"><a href="bookDetail?bookID=${book.id}" class="btn btn-link" title="${book.book_title}">${book.book_title}</a></td>
                            <td class="bookInfo">${book.book_author}</td>
                            <td class="bookInfo"><fmt:formatDate value="${book.book_pubYear}" pattern="yyyy-MM"/></td>
                            <td class="summary" title="${book.book_summary}">${book.book_summary}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>

    </div>
</div>

<hr>

<footer>
    <p class="text-center">&copy; 2017</p>
</footer>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/userLogin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/userRegister.js"></script>
</body>
</html>

