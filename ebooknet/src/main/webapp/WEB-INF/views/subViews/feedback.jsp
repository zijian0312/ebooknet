<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="feedback" class="index hide">
    <form id="feedbackForm" class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2">(选填)联系方式</label>
            <div class="col-md-4">
                <input class="contact form-control" type="text" placeholder="QQ、邮箱或者手机号">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2">你想说的</label>
            <div class="col-md-5">
                <textarea class="suggestion form-control" rows="4"
                        placeholder="请在此写下你的想法或建议，以及你所遇到的各种问题（不要超过200个字）。">
                </textarea>
            </div>
        </div>

        <div class="form-group">
            <button id="feedbackSubmit" class="btn btn-warning" type="button">提交</button>
            <button class="btn btn-info" type="reset">重置</button>
        </div>
    </form>
</div>