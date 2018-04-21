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
          href="${pageContext.request.contextPath }/resources/css/feedbackManage.css" />

    <title>敛书网 - 反馈处理</title>
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
                <li><a href="userManage">用户管理</a></li>
                <li class="active"><a href="feedbackManage">反馈处理</a></li>
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
            <span>反馈信息管理</span>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4 col-md-offset-1">
                    <span class="h4">未读反馈信息数&nbsp;</span>
                    <span class="h4 text-danger">${feedbackNum}</span>
                </div>
                <form class="pull-right" action="setAllRead" method="get">
                    <button class="btn btn-primary">全部标记为已读</button>
                </form>
            </div>
            <div class="container">
                <div class="col-md-10 col-sm-10">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th class="col-md-2 col-sm-2">反馈时间</th>
                            <th class="col-md-2 col-sm-2">反馈用户</th>
                            <th class="col-md-2 col-sm-2">联系方式</th>
                            <th class="col-md-3 col-sm-3">反馈内容</th>
                            <th class="col-md-2 col-sm-2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${feedbackList}" var="feedback">
                            <tr>
                                <td class="id" style="display: none">${feedback.id}</td>
                                <td><fmt:formatDate value="${feedback.postTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td>${feedback.loginedUser}</td>
                                <td>${feedback.contact}</td>
                                <td class="suggestion">${feedback.suggestion}</td>
                                <td>
                                    <button class="btn btn-sm btn-info" type="button">查看</button>
                                    <button class="btn btn-sm btn-success" type="button">已读</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="viewModal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <div class="container">
                    <span class="h3">反馈内容</span>
                </div>
            </div>
            <div class="modal-body">
                <p class="suggestion">这是一条很长的测试消息这是一条很长的测试消息这是一条很长的测试消息这是一条很长的测试消息这是一条很长的测试消息这是一条很长的测试消息这是一条很长的测试消息这是一条很长的测试消息这是一条很长的测试消息这是一条很长的测试消息</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/feedbackManage.js"></script>
</body>
</html>

