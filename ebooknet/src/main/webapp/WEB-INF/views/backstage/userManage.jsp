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
          href="${pageContext.request.contextPath }/resources/css/userManage.css" />

    <title>敛书网 - 用户管理</title>
</head>
<body>
<nav id="nav" class="navbar navbar-default" role="navigation">
    <div class="container container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><span class="h3 text-success">敛书网</span></a>
        </div>
        <div class="nav">
            <ul class="nav navbar-nav h4">
                <li><a href="bookManage">书籍管理</a></li>
                <li class="active"><a href="userManage">用户管理</a></li>
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
            <span>用户管理列表</span>
        </div>
        <div class="panel-body">
            <div class="col-md-3 col-sm-3 col-xs-12">
                <p class="text-info">本周注册人数：<i class="badge">${weekUser}</i> </p>
                <p class="text-primary">本月注册人数：<i class="badge">${monthUser}</i> </p>
                <p class="text-success">所有用户人数：<i class="badge">${totalUser}</i> </p>
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-10 pull-right">
                        <form class="input-group" action="searchUser" method="get">
                            <input name="user" type="text" class="form-control" placeholder="Search">
                            <span class="input-group-addon">
                                <button type="submit">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                            </span>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>用户名</th>
                            <th>账号</th>
                            <th>E-mail</th>
                            <th>贡献值</th>
                            <th>注册时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td class="id">${user.id}</td>
                                <td class="userName">${user.userName}</td>
                                <td>${user.userCode}</td>
                                <td>${user.email}</td>
                                <td>${user.contribution}</td>
                                <td><fmt:formatDate value="${user.creationDate}" pattern="yyyy-MM-dd"/></td>
                                <td><button class="btn btn-xs btn-danger">删除</button></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="modal fade" id="deleteUser" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <h4>&nbsp;&nbsp;你确定要删除该用户&nbsp;&nbsp;<span id="userName" class="text-primary"></span>？ </h4>
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
<script src="${pageContext.request.contextPath}/resources/js/userManage.js"></script>
</body>
</html>


