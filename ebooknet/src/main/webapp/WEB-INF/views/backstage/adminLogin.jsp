<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta><meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />

    <title>敛书网 - 后台登陆</title>
</head>
<body>
<div class="container" style="margin-top: 100px;">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="text-center">敛书网管理系统</h3>
            </div>
            <div class="panel-body">
                <p class="text-center text-danger">${error}</p>
                <form id="loginForm" class="form-horizontal" role="form" action="backlogin" method="post">
                    <div class="form-group col-md-12 col-xs-12 col-sm-12">
                        <label class="control-label col-xs-2 col-xs-offset-2">账号</label>
                        <div class="col-xs-6">
                            <input name="username" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group col-xs-12 col-sm-12">
                        <label class="control-label col-xs-2 col-xs-offset-2">密码</label>
                        <div class="col-xs-6">
                            <input type="password" class="form-control" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-2 col-xs-offset-4">
                            <button type="submit" class="btn btn-success">登录</button>
                        </div>
                        <div class="col-xs-2 col-sm-6">
                            <button type="button" class="btn btn-info">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>

