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
          href="${pageContext.request.contextPath }/resources/css/bootstrap-datetimepicker.min.css" />
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/upload.css" />
    <title>敛书网 - 文件上传</title>
</head>
<body>
<%@include file="common/loginHead.jsp"%>

<%@include file="common/userHead.jsp"%>

<div id="upload" class="container">
    <br>
    <div class="row">
        <div class="col-md-12 ">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <span class="h5 text-success">上传文件</span>
                </div>
                <div class="panel-body">
                    <div id="myAlert" class="alert alert-warning hide">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <span id="form-tips" class="text-danger col-md-offset-1"></span>
                    </div>
                    <form id="uploadForm" class="form-horizontal" action="doUpload"
                          enctype="multipart/form-data" method="POST" onsubmit="return checkUploadForm();">
                        <div class="form-group">
                            <label for="title" class="control-label col-md-1 text-danger">标题</label>
                            <div class="col-md-3">
                                <input id="title" name="title" class="form-control" type="text"
                                       placeholder="请填写书籍名称">
                            </div>
                            <label for="author" class="control-label col-md-1 text-warning">作者</label>
                            <div class="col-md-3">
                                <input id="author" name="author" class="form-control" type="text"
                                       placeholder="请填写作者姓名，杂志填无">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="pubYear" class="control-label col-md-1">年月</label>
                            <div class="col-md-3">
                                <input id="pubYear" name="pubYear" class="form-control datetimepicker"
                                       placeholder="&nbsp;&nbsp;请选择出版年月">
                            </div>
                            <label class="control-label col-md-1">类别</label>
                            <div class="col-md-2">
                                <select id="largeType" name="largeType" class="form-control">
                                    <option value="1">经典文学</option>
                                    <option value="2">通俗小说</option>
                                    <option value="3">计算机类</option>
                                    <option value="4">杂志期刊</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select id="smallType" name="smallType" class="form-control"></select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="summary" class="control-label col-md-1 text-info">简介</label>
                            <div class="col-md-6">
                                <textarea id="summary" name="summary" class="form-control" rows="2"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="fileUpload" class="control-label col-md-1 text-success">文件</label>
                            <div class="input-group col-md-5">
                                <input id="fileInfo" class="form-control" readonly type="text"
                                    placeholder="支持txt,epub,mobi和pdf格式">
                                <span class="input-group-addon btn btn-success btn-file">
                                        Browse <input id="fileUpload" name="bookFile" type="file">
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="imageUpload" class="control-label col-md-1 text-success">封面</label>
                            <div class="input-group col-md-5">
                                <input id="imageInfo" class="form-control" readonly type="text"
                                    placeholder="支持jpg和png图片格式">
                                <span class="input-group-addon btn btn-success btn-file">
                                    Browse <input id="imageUpload" name="bookCover" type="file">
                                </span>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="col-lg-4 col-md-offset-3">
                                <button id="submitBtn" class="btn btn-primary" type="submit" onclick="">提交</button>
                                <button class="btn btn-info col-md-offset-2" type="reset">重置</button>
                            </div>
                        </div>
                    </form>
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
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/userLogin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/userRegister.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
<script>
    function checkUploadForm() {
        var title = $('#upload #title').val();
        var author = $('#upload #author').val();
        var pubYear = $('#upload #pubYear').val();
        var summary = $('#upload #summary').val();
        var fileInfo = $('#fileInfo').val();
        var imageInfo = $('#imageInfo').val();
        var $formTip = $('#myAlert #form-tips');
        var fileArr = ["txt","epub","mobi","pdf"];
        var imageArr = ["jpg","png"];
        var $alert = $('#myAlert');
        if (title.length == 0) {
            $formTip.html("标题不能为空!");
            $alert.removeClass('hide');
            $('#upload #title').focus();
            return false;
        } else if(author.length == 0) {
            $formTip.html("作者不能为空!");
            $alert.removeClass('hide');
            $('#upload #author').focus();
            return false;
        } else if (pubYear.length == 0) {
            $formTip.html("出版时间不能为空!");
            $alert.removeClass('hide');
            $('#upload #pubYear').focus();
            return false;
        } else if (summary.length == 0) {
            $formTip.html("简介不能为空!");
            $alert.removeClass('hide');
            $('#upload #summary').focus();
            return false;
        } else if (fileInfo.length == 0) {
            $formTip.html("请选择书籍文件！");
            $alert.removeClass('hide');
            return false;
        } else if ($.inArray(getFileFormat(fileInfo),fileArr) == -1) {
            console.log(getFileFormat(fileInfo));
            $formTip.html("不支持该书籍文件！");
            $alert.removeClass('hide');
            return false;
        } else if (imageInfo.length == 0) {
            $formTip.html("请选择书籍封面！");
            $alert.removeClass('hide');
            return false;
        } else if ($.inArray(getFileFormat(imageInfo),imageArr) == -1) {
            console.log(getFileFormat(fileInfo));
            $formTip.html("封面格式错误，请重新上传");
            $alert.removeClass('hide');
            return false;
        } else {
            $formTip.html("正在上传...");
            $alert.removeClass('hide');
            return true;
        }
    }

    function getFileFormat(fileName) {
        return fileFormat = fileName.substring(fileName.lastIndexOf('.') + 1);
    }


</script>
</body>
</html>

