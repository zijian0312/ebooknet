$(document).ready(function() {
    function personMenu() {
        var $span = $(".row .panel-heading span");
        $(".row .list-group .personMenu").on({
            click: function() {
                var e = $(this).data("index"),
                    o = $(this).html();
                $(".row .panel-body .index").addClass("hide"),
                    $(e).removeClass("hide"),
                    $span.html(o)
            }
        }),
            $(".row .list-group #getHistory").on({
                click: function() {
                    var $target = $(this).data("index"),
                        $text = $(this).html();
                    $(".row .panel-body .index").addClass("hide"),
                        $($target).removeClass("hide"),
                        $span.html($text),
                    0 == getHistory && $.ajax({
                        method: "GET",
                        url: "getUploadHistory",
                        success: function(data) {
                            var uploadList = eval(data.uploadList);
                            uploadRecords = uploadList.length,
                                console.log("uploadRecords:" + uploadRecords);
                            for (var i = 0; i < uploadList.length; i++) {
                                var uploadObj = uploadList[i];
                                $tbody.append("<tr><td>" + uploadObj.id + "</td> <td>" + uploadObj.bookTitle + "</td> <td>" + uploadObj.bookAuthor + "</td> <td>" + uploadObj.uploadedDate + "</td> <td>" + uploadObj.downloadTimes + "</td></tr>")
                            }
                            pageTotal = uploadRecords / 5 == 0 ? parseInt(uploadRecords / 5) : parseInt(uploadRecords / 5) + 1,
                                changePage(currentPage),
                                $("#uploadHistory .pager span").text("共" + uploadRecords + "条记录"),
                                getHistory = 1
                        },
                        error: function() {
                            $("#uploadHistory .pager span").text("共0条记录"),
                                $("#uploadHistory .table tbody").append("无法获取上传记录！")
                        }
                    })
                }
            })
    }
    function changePage(e) {
        for (var o = 5 * (e - 1) + 1, a = 5 * e > uploadRecords ? uploadRecords: 5 * e, t = 1; uploadRecords >= t; t++) {
            var r = $("#uploadHistory .table tbody tr").eq(t - 1);
            t >= o && a >= t ? r.show() : r.hide()
        }
    }
    function changeAvatar() {
        var e = $("#infoModify .current-img img"),
            o = $("#infoModify #avatarValue");
        $(".row .img-select .img-group img").on({
            click: function() {
                var a = $(this)[0].src;
                e.attr("src", a);
                var t = a.substring(a.indexOf("resources"));
                console.log(t),
                    o.val(t)
            }
        })
    }
    function feedback() {
        var e = ($("#feedback #feedbackForm"), $("#feedback #feedbackSubmit"));
        e.on({
            click: function() {
                var e = $("#feedback .contact").val(),
                    o = $("#feedback .suggestion").val();
                o.length > 400 && (o = o.substring(0, 400)),
                    0 == o.length ? $("#feedback .suggestion").focus() : $.ajax({
                        method: "GET",
                        url: "feedback?contact=" + e + "&suggestion=" + o,
                        success: function() {
                            alert("感谢您的反馈！"),
                                $("#feedback .contact").val(""),
                                $("#feedback .suggestion").val("")
                        },
                        error: function() {
                            alert("提交失败，请检查网络连接！")
                        }
                    })
            }
        })
    }
    var getHistory = 0,
        uploadRecords = 0,
        currentPage = 1,
        pageTotal = 1,
        $tbody = $("#uploadHistory .table tbody");
    personMenu(),
        changeAvatar(),
        feedback(),
        $("#loginedInfo button").on({
            click: function() {
                console.log("removeCookies!"),
                    $.cookie("isLogined", !1, {
                        expires: -1
                    }),
                    $.cookie("userCode", "", {
                        expires: -1
                    }),
                    $.cookie("userPassword", "", {
                        expires: -1
                    }),
                    window.location.href = "logout"
            }
        }),
        $("#uploadHistory .pager #prePage").on({
            click: function() {
                1 != currentPage && (currentPage -= 1, changePage(currentPage))
            }
        }),
        $("#uploadHistory .pager #nextPage").on({
            click: function() {
                currentPage != pageTotal && (currentPage += 1, changePage(currentPage))
            }
        })
});