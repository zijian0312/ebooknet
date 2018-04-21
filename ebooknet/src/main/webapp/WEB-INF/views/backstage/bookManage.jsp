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
          href="${pageContext.request.contextPath }/resources/css/bootstrap-datetimepicker.min.css" />
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/bookManage.css" />

    <title>敛书网 - 书籍管理</title>
</head>
<body>
<nav id="nav" class="navbar navbar-default" role="navigation">
    <div class="container container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><span class="h3 text-success">敛书网</span></a>
        </div>
        <div class="nav">
            <ul class="nav navbar-nav h4">
                <li class="active"><a href="bookManage">书籍管理</a></li>
                <li><a href="userManage">用户管理</a></li>
                <li><a href="feedbackManage">反馈处理</a></li>
            </ul>
            <div id="user" class="pull-right">
                <h4 class="text-primary">欢迎进入敛书网后台管理系统！&nbsp;
                    <span class="glyphicon glyphicon-user">admin</span></h4>
            </div>
        </div>
    </div>
</nav>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span>书籍管理列表</span>
        </div>
        <div class="panel-body">
            <div class="searchBy col-md-3 col-sm-3 col-xs-12">
                <div id="searchByDate">
                    <button type="button" class="btn btn-info"
                            data-toggle="collapse" data-target="#byDate">
                        根据上传日期查询
                    </button>
                    <div id="byDate" class="collapse">
                        <form class="searchForm form-horizontal" action="searchBookByDays" method="get">
                            <div class="input-group">
                                <select name="days" class="form-control">
                                    <option value="1">一天内</option>
                                    <option value="7">一周内</option>
                                    <option value="30">一月内</option>
                                </select>
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">查询</button>
                            </span>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="searchByBook">
                    <button type="button" class="btn btn-success"
                            data-toggle="collapse" data-target="#byBook">
                        根据书籍名称查询
                    </button>
                    <div id="byBook" class="collapse">
                        <form class="searchForm form-horizontal" action="searchBookByTitle" method="GET">
                            <div class="input-group">
                                <input name="title" class="form-control" type="text" placeholder="请填写书籍名称">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit">查询</button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="searchByUser">
                    <button type="button" class="btn btn-primary"
                            data-toggle="collapse" data-target="#byUser">
                        根据上传用户查询
                    </button>
                    <div id="byUser" class="collapse">
                        <form class="searchForm form-horizontal" action="searchBookByUser" method="GET">
                            <div class="input-group">
                                <input name="userId" class="form-control" type="text" placeholder="请填写上传用户编号">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit">查询</button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div id="bookList" class="col-md-9 col-sm-9 col-xs-12">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th class="col-md-2 col-sm-2 col-xs-2">编号</th>
                        <th class="col-md-2 col-sm-2 col-xs-2">书名</th>
                        <th class="col-md-2 col-sm-2 col-xs-2">作者</th>
                        <th class="col-md-2 col-sm-2 col-xs-2">上传者</th>
                        <th class="col-md-2 col-sm-2 col-xs-2">上传时间</th>
                        <th class="col-md-2 col-sm-2 col-xs-2">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${bookList}" var="book" >
                        <tr>
                            <td class="id">${book.id}</td>
                            <td class="title">${book.title}</td>
                            <td class="author">${book.author}</td>
                            <td class="uploader">${book.uploader}</td>
                            <td class="uploadedDate"><fmt:formatDate value="${book.uploadedDate}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <button class="btn btn-xs btn-danger">删除</button>
                            </td>

                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="deleteModal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <h4>&nbsp;&nbsp;你确定要删除书籍&nbsp;<span id="title" class="text-primary"></span>？</h4>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" type="button" data-dismiss="modal">确定</button>
                <button class="btn btn-info" type="button" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bookManage.js"></script>
</body>
</html>

