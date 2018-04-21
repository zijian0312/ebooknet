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
          href="${pageContext.request.contextPath }/resources/css/bookDetail.css" />


    <title>敛书网 - 图书详情</title>
</head>
<body>

<%@include file="common/loginHead.jsp"%>

<%@include file="common/userHead.jsp"%>


<div id="bookDetail" class="container">

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <span class="text-primary">图书详情</span>
                </div>
                <div class="panel-body">

                    <div class="book-cover col-md-4">
                        <img src="getBookCover?coverPath=${book.book_cover}" alt="${book.book_title}">
                    </div>

                    <div class="book-labels col-md-5 clearfix">
                        <p>
                            <label class="label-name">图书名称：</label>
                            <label class="label-value">${book.book_title}</label>
                        </p>
                        <p>
                            <label class="label-name">作者：</label>
                            <label class="label-value">${book.book_author}</label>
                        </p>
                        <p>
                            <label class="label-name">出版时间：</label>
                            <label class="label-value"><fmt:formatDate value="${book.book_pubYear}" pattern="yyyy-MM"/></label>
                        </p>
                        <p>
                            <label class="label-name">上传者：</label>
                            <label class="label-value">${uploader}</label>
                        </p>
                        <p>
                            <label class="label-name">上传时间：</label>
                            <label class="label-value">${uploadedDate}</label>
                        </p>
                        <p>
                            <label class="label-name">下载：</label>
                            <label class="label-value">
                                <a href="book_download?bookID=${book.id}&filePath=${book.book_file}" class="btn btn-sm btn-info">
                                    ${format}&nbsp;<i class="glyphicon glyphicon-download-alt"></i></a>
                            </label>
                        </p>
                        <p>
                            <label class="label-name">简介：</label>
                            <label class="label-value">${book.book_summary}</label>
                        </p>
                    </div>

                    <div class="col-md-3">
                        <div class="alert alert-warning" role="alert">
                            <p>本站电子书籍大部分为网友分享上传而来，如有侵犯你权利的，请来信指正，本站立即更改。</p>
                            <p>本站提供的所有资源仅供学习和研究使用，请勿用于商业用途。谢谢合作。</p>
                        </div>
                    </div>
                </div>
            </div>
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
