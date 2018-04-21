<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="infoModify" class="index hide">

    <form class="form-horizontal" action="infoModify" method="post" onsubmit="return checkInfo();">

        <div class="info-modify col-md-4 col-sm-12 col-xs-12">

            <div class="form-group">
                <label for="name" class="control-label col-md-4 col-sm-6 col-xs-12">昵称</label>
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <input id="name" name="name" class="form-control" type="text" value="${user.userName}">
                </div>
            </div>

            <div class="form-group">
                <label for="email" class="control-label col-md-4 col-sm-6 col-xs-12">邮箱</label>
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <input id="email" name="email" class="form-control" type="text" value="${user.email}">
                </div>
            </div>
            <div class="hide">
                <input id="avatarValue" type="text" name="avatarImg" value="${user.avatar.avatar_img}">
            </div>

        </div>

        <div class="col-md-8 col-sm-12 col-xs-12">

            <div class="current-img col-md-2 col-sm-12 col-xs-12">
                <label class="block">当前头像</label>
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/${user.avatar.avatar_img}" alt="avatar">
            </div>

            <div class="img-select col-md-10 col-sm-12 col-xs-12">
                <label class="block">默认头像</label>
                <div class="img-group">
                    <a href="#">
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/resources/images/avatars/040601.jpg" alt="avatar">
                    </a>
                    <a href="#">
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/resources/images/avatars/040602.jpg" alt="avatar">
                    </a>
                    <a href="#">
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/resources/images/avatars/040603.jpg" alt="avatar">
                    </a>
                    <a href="#">
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/resources/images/avatars/040604.jpg" alt="avatar">
                    </a>
                    <a href="#">
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/resources/images/avatars/040605.jpg" alt="avatar">
                    </a>
                    <a href="#">
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/resources/images/avatars/040606.jpg" alt="avatar">
                    </a>
                    <a href="#">
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/resources/images/avatars/040607.jpg" alt="avatar">
                    </a>
                    <a href="#">
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/resources/images/avatars/040608.jpg" alt="avatar">
                    </a>
                    <a href="#">
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/resources/images/avatars/040609.jpg" alt="avatar">
                    </a>
                    <a href="#">
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/resources/images/avatars/0406010.jpg" alt="avatar">
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-6 text-center">
            <button class="btn btn-primary" type="submit">保存修改</button>
        </div>

    </form>

</div>