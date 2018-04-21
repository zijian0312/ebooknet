$(document).ready(function () {
    function e(e) {
        $("#loginHead").addClass("hide"), $("#userHead").removeClass("hide"), $("#navbar #loginedInfo a").popover({
            placement: "bottom",
            html: !0,
            title: '<div class="h5 text-center"><span id="userName" class="glyphicon glyphicon-user"></span></div>',
            content: '<div class="text-center"><span>等&nbsp;级：<img id="levelImg" src="" alt="" style="width: 72px; height: 15px"></span></div>       <div class="text-success text-center">贡献值：<span id="contribution" class="badge badge-important"></span></div><button id="toPersonInfo" class="btn btn-link">个人资料</button><a href="#" id="exit" class="btn btn-link" >注销</a>'
        }).on("mouseenter", function () {
            var e = this;
            $(this).popover("show"), $(this).siblings(".popover").on("mouseleave", function () {
                $(e).popover("hide")
            })
        }).on("mouseleave", function () {
            var e = this;
            setTimeout(function () {
                $(".popover:hover").length || $(e).popover("hide")
            }, 100)
        }).on("shown.bs.popover", function () {
            $("#exit").on({
                click: function () {
                    t(); window.location.href = "logout"
                }
            }), $("#userName").text(" " + e.user.userName), $("#contribution").text(e.user.contributionValue), $("#levelImg").attr("src", e.user.contribution.level_img), $("#levelImg").attr("alt", e.user.contribution.level_txt), $("#toPersonInfo").on({
                click: function () {
                    window.location.href = "person"
                }
            })
        })
    }

    function o() {
        $("#userHead").hasClass("hide") && $(".uploadBtn button").tooltip({
            animation: !0,
            title: "请先登陆！",
            placement: "top",
            trigger: "hover focus",
            delay: {
                show: 500,
                hide: 100
            }
        })
    }

    function t() {
        $.cookie("isLogined", !1, {
            expires: -1
        }), $.cookie("userCode", "", {
            expires: -1
        }), $.cookie("userPassword", "", {
            expires: -1
        })
    }

    function n(o) {
        $(".uploadBtn button").tooltip("destroy"), console.log("登录成功！" + o.user.userCode + "," + o.user.userName + "," + o.user.contributionValue), $("#loginHead").addClass("hide"), $("#userHead").removeClass("hide"), e(o), $avatar = $("#navbar #loginedInfo a img"), $avatar.attr("src", o.user.avatar.avatar_img), $avatar.attr("alt", o.user.avatar.avatar_txt)
    }

    function i(e, o) {
        var t = {
            userCode: e,
            userPassword: o
        };
        $.ajax({
            type: "POST",
            url: "login",
            data: JSON.stringify(t),
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function (e) {
                if (e.isLogined) {
                    var o = $("#userCode").val(),
                        t = $("#userPassword").val();
                    $('#loginModal .checkbox input[type="checkbox"]').is(":checked") ? ($.cookie("isLogined", !0, {
                        expires: 7,
                        path: "/"
                    }), $.cookie("userCode", o, {
                        expires: 7,
                        path: "/"
                    }), $.cookie("userPassword", t, {
                        expires: 7,
                        path: "/"
                    })) : ($.cookie("isLogined", !0, {
                        path: "/"
                    }), $.cookie("userCode", o, {
                        path: "/"
                    }), $.cookie("userPassword", t, {
                        path: "/"
                    })), $("#loginModal").modal("hide"), n(e)
                } else $("#loginModal #errorTxt").removeClass("hide")
            }, error: function () {
                alert("登陆失败，请检查网络连接！")
            }
        })
    }

    function s(e) {
        $.ajax({
            type: "POST",
            url: "login",
            data: JSON.stringify(e),
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function (e) {
                n(e)
            }, error: function () {
                alert("登陆失败，请检查网络连接！")
            }
        })
    }
    if ("true" == $.cookie("isLogined")) {
        console.log("已登录！");
        var a = $.cookie("userCode"),
            r = $.cookie("userPassword");
        console.log("userCode:" + a), console.log("userPassword:" + r);
        var c = {
            userCode: a,
            userPassword: r
        };
        s(c)
    } else o();
    $(".uploadBtn button").on({
        click: function () {
            "true" == $.cookie("isLogined") && window.open("getUploadPage")
        }
    }), $("#loginForm").keyup(function (e) {
        var e = e || event;
        keycode = e.which || e.keyCode, 13 == keycode && $("#loginForm #loginSubmit").trigger("click")
    }), $("#loginForm #loginSubmit").on({
        click: function () {
            var e = $("#userCode").val(),
                o = $("#userPassword").val();
            i(e, o)
        }
    })
});