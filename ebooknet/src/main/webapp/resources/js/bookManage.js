$(document).ready(function() {
    function datePicker() {
        $pubYear.datetimepicker({
            language: "zh",
            format: "yyyy-mm",
            autoclose: !0,
            startView: "year",
            clearBtn: !0,
            minView: "year",
            maxView: "decade",
            endDate: new Date
        })
    }
    function setFileValue() {
        $imageInput.change(function() {
            $imageInfo.val($(this).val())
        })
    }
    function setTypeOptions() {
        for (var type1 = ["现代文学", "古典文学", "国外文学", "纪实文学", "诗词歌赋"], type2 = ["武侠玄幻", "青春言情", "悬疑推理", "历史军事", "职场生活"], type3 = ["编程语言", "数据库", "人工智能", "移动开发", "图形图像"], type4 = ["科学技术", "人文艺术", "政治军事", "经济管理", "娱乐休闲"], i = 0; 5 > i; i++) $innerSelect.append('<option value="' + (i + 1) + '">' + type1[i] + "</option>");
        $outSelect.change(function() {
            $innerSelect.children("option").remove();
            for (var largeTypeNum = $outSelect.val(), type = eval("type" + largeTypeNum), i = 0; 5 > i; i++) $innerSelect.append('<option value="' + (i + 1) + '">' + type[i] + "</option>")
        })
    }
    function setModalValue() {
        $("table .btn.btn-danger").on({
            click: function() {
                var e = $(this).parent().parent("tr"),
                    t = e.children(".title"),
                    o = e.children(".id");
                $("#deleteModal #title").html(t.text()),
                    $("#deleteModal").modal("toggle"),
                    $("#deleteModal .modal-footer .btn-danger").on({
                        click: function() {
                            $.ajax({
                                method: "GET",
                                url: "deleteBook?bookId=" + o.text(),
                                success: function(t) {
                                    1 == t.result ? (alert("删除成功！"), e.remove()) : alert("删除失败！")
                                },
                                error: function() {
                                    alert("请检查网络连接！")
                                }
                            })
                        }
                    })
            }
        })
    }
    var $pubYear = $("#modifyModal #pubYear"),
        $outSelect = $("#modifyModal #largeType"),
        $innerSelect = $("#modifyModal #smallType"),
        $imageInput = $("#modifyModal #bookCover"),
        $imageInfo = $("#modifyModal #imageInfo");
    datePicker(),
        setFileValue(),
        setModalValue(),
        setTypeOptions(),
        $("#deleteModal").on("hidden.bs.modal",
            function() {
                $(this).removeData("bs.modal")
            })
});