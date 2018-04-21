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
          href="${pageContext.request.contextPath }/resources/css/bookList.css" />


    <title>敛书网 - 图书列表</title>
</head>
<body>

<%@include file="common/loginHead.jsp"%>

<%@include file="common/userHead.jsp"%>

<div id="bookList" class="container">

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
            <button class="btn btn-primary" type="button">
                我要上传&nbsp;<span class="glyphicon glyphicon-upload"></span></button>
        </div>

    </div>

    <br>

    <div class="row">
        <div class="categories col-md-2 col-sm-6 col-xs-12">
            <ul class="nav nav-pills nav-stacked">
                <c:forEach items="${smallTypesOfBook}" var="smallType">
                    <li><a href="bookList?bookType=${bookType}&smallType=${smallType.small_type_name}">${smallType.small_type_name}</a></li>
                </c:forEach>
            </ul>
        </div>

        <div class="col-md-10 col-sm-12 col-xs-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <ul class="breadcrumb">
                        <li><a href="index">首页</a> <span class="divider"></span></li>
                        <li><a id="navCurrent1" href="bookList?bookType=${bookType}">${bookType}</a> <span class="divider"></span></li>
                        <c:if test="${smallType != null}">
                            <li><a id="navCurrent2" href="bookList?bookType=${bookType}&smallType=${smallType}">${smallType}</a> <span class="divider"></span></li>
                        </c:if>
                    </ul>
                </div>
                <div class="panel-body">

                    <c:forEach items="${books}" var="book">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="thumbnail">
                                <img src="getBookCover?coverPath=${book.book_cover}" alt="${book.book_title}">
                                <div class="caption">
                                    <div class="bookTitle text-center text-success" title="${book.book_title}">${book.book_title}</div>
                                    <div class="btn-block text-center">
                                        <a href="book_download?bookID=${book.id}&filePath=${book.book_file}" class="btn btn-link">下载</a>
                                        <a href="bookDetail?bookID=${book.id}" class="btn btn-link">详情</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>

                <div class="panel-page text-center">
                    <ul class="pagination">
                        <c:choose>
                            <%--当前页为1，且总页码小于等于5--%>
                            <c:when test="${currentPage == 1 && totalPage <= 5}">
                                <li class="active"><span>${currentPage}</span></li>
                                <c:forEach var="page" begin="2" end="${totalPage}">
                                    <li><a>${page}</a></li>
                                </c:forEach>
                            </c:when>
                            <%--当前页不为1，且总页码小于等于5，--%>
                            <c:when test="${currentPage != 1 && totalPage <=5}">
                                <c:forEach var="page" begin="1" end="${currentPage-1}">
                                    <li><a>${page}</a></li>
                                </c:forEach>
                                <li class="active"><span>${currentPage}</span></li>
                                <c:if test="${currentPage < totalPage}">
                                    <c:forEach var="page" begin="${currentPage+1}" end="${totalPage}">
                                        <li><a>${page}</a></li>
                                    </c:forEach>
                                </c:if>
                            </c:when>
                            <%--当前页与总页码相同，切总页码小于等于5--%>
                            <c:when test="${(currentPage == totalPage) && totalPage <= 5}">
                                <c:forEach var="page" begin="1" end="${currentPage-1}">
                                    <li><a>${page}</a></li>
                                </c:forEach>
                                <li class="active"><span>${currentPage}</span></li>
                            </c:when>
                            <%--总页码大于5，当前页为1--%>
                            <c:when test="${currentPage == 1 && totalPage > 5}">
                                <li class="active"><span>${currentPage}</span></li>
                                <c:forEach var="page" begin="2" end="5">
                                    <li><a>${page}</a></li>
                                </c:forEach>
                                <li><a class="nextPage">&raquo;</a></li>
                            </c:when>
                            <%--总页码大于5，当前页大于1，不大于3--%>
                            <c:when test="${currentPage > 1 && currentPage <= 3 && totalPage > 5}">
                                <c:forEach var="page" begin="1" end="${currentPage-1}">
                                    <li><a>${page}</a></li>
                                </c:forEach>
                                <li class="active"><span>${currentPage}</span></li>
                                <c:forEach var="page" begin="${currentPage+1}" end="5">
                                    <li><a>${page}</a></li>
                                </c:forEach>
                                <li><a class="nextPage">&raquo;</a></li>
                            </c:when>
                            <%--总页码大于5，当前页大于3且与总页码之差大于2--%>
                            <c:when test="${currentPage > 3 && (totalPage-currentPage) > 2 && totalPage > 5}">
                                <li><a class="prePage">&laquo;</a></li>
                                <li><a>${currentPage-2}</a></li>
                                <li><a>${currentPage-1}</a></li>
                                <li class="active"><span>${currentPage}</span></li>
                                <li><a>${currentPage+1}</a></li>
                                <li><a>${currentPage+2}</a></li>
                                <li><a class="nextPage">&raquo;</a></li>
                            </c:when>
                            <%--总页码大于5，总页码与当前页之差等于2--%>
                            <c:when test="${(totalPage-currentPage) == 2 && totalPage > 5}">
                                <li><a class="prePage">&laquo;</a></li>
                                <li><button>${currentPage-2}</button></li>
                                <li><a>${currentPage-1}</a></li>
                                <li class="active"><span>${currentPage}</span></li>
                                <li><a>${currentPage+1}</a></li>
                                <li><a>${currentPage+2}</a></li>
                            </c:when>
                            <%--总页码大于5，总页码与当前页之差小于2--%>
                            <c:when test="${(totalPage-currentPage) < 2 && totalPage > 5}">
                                <c:if test="${(totalPage - currentPage) == 1}">
                                    <li><a class="prePage">&laquo;</a></li>
                                    <li><a>${currentPage-3}</a></li>
                                    <li><a>${currentPage-2}</a></li>
                                    <li><a>${currentPage-1}</a></li>
                                    <li class="active"><span>${currentPage}</span></li>
                                    <li><a>${totalPage}</a></li>
                                </c:if>
                            </c:when>
                            <%--总页码大于5，当前页与总页码相同--%>
                            <c:when test="${totalPage > 5 && (totalPage == currentPage)}">
                                <li><a class="prePage" href="#">&laquo;</a></li>
                                <li><a href="javascript:void(0)">${currentPage-4}</a></li>
                                <li><a href="javascript:void(0)">${currentPage-3}</a></li>
                                <li><a href="javascript:void(0)">${currentPage-2}</a></li>
                                <li><a href="javascript:void(0)">${currentPage-1}</a></li>
                                <li class="active"><span>${currentPage}</span></li>
                            </c:when>
                        </c:choose>

                    </ul>
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
<script src="${pageContext.request.contextPath}/resources/js/bookList.js"></script>


</body>
</html>
