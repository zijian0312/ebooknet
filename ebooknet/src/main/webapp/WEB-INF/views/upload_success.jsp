<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
    <title>敛书网 - 上传成功</title>
</head>
<body>
<div class="container">
    <h1 class="text-success" style="margin: 30px 18px 10px">上传成功，感谢您的上传！
        <span class="small" style="margin-left: 10px"><i class="glyphicon glyphicon-thumbs-up"></i>奖励2点贡献值</span></h1>
    <div class="btn-group btn-group-lg">
        <button type="button" class="btn btn-link" onclick="window.location.href='getUploadPage'">继续上传</button>
        <button type="button" class="btn btn-link" onclick="window.location.href='bookDetail?bookID=${bookID}'">查看书籍</button>
        <button type="button" class="btn btn-link" onclick="window.location.href='index'">回到首页</button>
    </div>
</div>
</body>
</html>
