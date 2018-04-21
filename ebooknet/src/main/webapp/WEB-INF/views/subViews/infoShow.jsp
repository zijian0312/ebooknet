<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="infoShow" class="index">
    <div class="label-img">
        <label class="label-name">头像：</label>
        <img class="img-thumbnail" src="${pageContext.request.contextPath}/${user.avatar.avatar_img}" alt="avatar">
    </div>
    <p>
        <label class="label-name">用户名：</label>
        <label class="label-value">${user.userCode}</label>
    </p>
    <p>
        <label class="label-name">昵称:</label>
        <label class="label-value">${user.userName}</label>
    </p>
    <p>
        <label class="label-name">邮箱：</label>
        <label class="label-value">${user.email}</label>
    </p>

    <p>
        <label class="label-name">等级：</label>
        <label class="label-value">${user.contribution.level_txt}</label>
    </p>
    <p>
        <label class="label-name">贡献值：</label>
        <label class="label-value">${user.contributionValue}</label>
    </p>
</div>