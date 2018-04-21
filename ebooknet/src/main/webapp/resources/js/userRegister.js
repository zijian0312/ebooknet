$(document).ready(function() {
    function o() {
        var o = $("#regModal #regForm #uCode"),
            l = $("#regModal #regForm #uCodeTip");
        o.on({
            focus: function() {
                l.attr("class", "col-md-4").css("color", "#4876FF").html("用户名由字母或数字组成")
            },
            blur: function() {
                var o = $(this).val(),
                    c = /^[A-Za-z0-9]{4,}$/;
                c.test(o) ? $.ajax({
                    method: "GET",
                    url: "userCodeCheck?userCode=" + o,
                    success: function(o) {
                        o.isRegistered >= 1 ? l.attr("class", "col-md-4").css("color", "#EE2C2C").html("用户名已存在") : l.attr("class", "col-md-4 glyphicon glyphicon-ok").css("color", "#00EE00").html("")
                    }
                }) : 0 == o.length ? l.attr("class", "col-md-4").css("color", "#EE2C2C").html("用户名不能为空") : l.attr("class", "col-md-4").css("color", "#EE2C2C").html("用户名格式有误")
            }
        })
    }
    function l() {
        a.on({
            focus: function() {
                i.attr("class", "col-md-4").css("color", "#4876FF").html("密码由字母或数字组成")
            },
            blur: function() {
                var o = a.val(),
                    l = /^[A-Za-z0-9]{4,}$/;
                l.test(o) ? i.attr("class", "col-md-4 glyphicon glyphicon-ok").css("color", "#00EE00").html("") : 0 == o.length ? i.attr("class", "col-md-4").css("color", "#EE2C2C").html("密码不能为空") : i.attr("class", "col-md-4").css("color", "#EE2C2C").html("密码格式有误")
            }
        }),
            e.on({
                blur: function() {
                    var o = a.val(),
                        l = e.val();
                    0 == l.length ? d.attr("class", "col-md-4").css("color", "#EE2C2C").html("密码不能为空") : o != l ? d.attr("class", "col-md-4").css("color", "#EE2C2C").html("两次密码输入不一致") : d.attr("class", "col-md-4 glyphicon glyphicon-ok").css("color", "#00EE00").html("")
                }
            })
    }
    function c(o) {
        $.ajax({
            type: "POST",
            url: "register",
            data: JSON.stringify(o),
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function() {
                $("#regModal").modal("hide"),
                    alert("注册成功！"),
                    window.location.href("index")
            }
        })
    }
    var s = $("#regModal #regForm"),
        r = $("#regForm #uCode"),
        t = $("#regForm #uName"),
        a = $("#regForm #uPwd"),
        e = $("#regForm #uPwd2"),
        n = $("#regForm #uEmail"),
        m = $("#regModal #regForm #uCodeTip"),
        i = $("#regModal #regForm #uPwdTip"),
        d = $("#regModal #regForm #uPwd2Tip");
    o(),
        l(),
        $("#regForm #regSubmit").on({
            click: function() {
                var o = r.val(),
                    l = t.val(),
                    s = n.val(),
                    e = a.val(),
                    u = {
                        userCode: o,
                        userPassword: e,
                        userName: l,
                        email: s
                    };
                m.hasClass("glyphicon-ok") && i.hasClass("glyphicon-ok") && d.hasClass("glyphicon-ok") && c(u)
            }
        }),
        $("#regModal .close, #regModal #regQuit").on({
            click: function() {
                s[0].reset(),
                    m.attr("class", "").html(""),
                    i.attr("class", "").html(""),
                    d.attr("class", "").html("")
            }
        })
});