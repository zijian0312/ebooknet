<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="pwdModify" class="index hide">

    <form class="form-horizontal col-md-offset-1"
          action="pwdModify" method="post" onsubmit="return checkPwd();">

        <div class="form-group">
            <label class="control-label col-md-2">原密码</label>
            <div class="col-md-3">
                <input id="oldPwd" class="form-control" type="password">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2">新密码</label>
            <div class="col-md-3">
                <input id="newPwd" name="newPwd" class="form-control" type="password">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2">重复密码</label>
            <div class="col-md-3">
                <input id="newPwd2" name="newPwd2" class="form-control" type="password">
            </div>
        </div>

        <div class="form-group">
            <button class="btn btn-success" type="submit">确认</button>
            <button class="btn btn-success" type="reset">重置</button>
        </div>

    </form>

</div>