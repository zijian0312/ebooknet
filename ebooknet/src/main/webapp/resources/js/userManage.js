$(document).ready(function() {
    function e() {
        $("table .btn.btn-danger").on({
            click: function() {
                var e = $(this).parent().parent("tr"),
                    t = e.children(".id"),
                    n = e.children(".userName");
                $("#deleteUser #userName").html(n.text()),
                    $("#deleteUser").modal("toggle"),
                    $("#deleteUser .modal-footer .btn-danger").on({
                        click: function() {
                            $.ajax({
                                method: "GET",
                                url: "deleteUser?userId=" + t.text(),
                                success: function(t) {
                                    1 == t.result ? (alert("删除成功!"), e.remove()) : alert("删除失败!")
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
    e(),
        $("#deleteUser").on("hidden.bs.modal",
            function() {
                $(this).removeData("bs.modal")
            })
});