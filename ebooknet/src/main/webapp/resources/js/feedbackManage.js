$(document).ready(function() {
    function t() {
        $("table .btn.btn-info").on({
            click: function() {
                var t = $(this).parent().parent("tr"),
                    e = t.children(".suggestion");
                $("#viewModal .suggestion").html(e.text()),
                    $("#viewModal").modal("toggle")
            }
        })
    }
    function e() {
        $("table .btn.btn-success").on({
            click: function() {
                var t = $(this).parent().parent("tr"),
                    e = t.children(".id");
                $.ajax({
                    method: "GET",
                    url: "setRead?feedbackId=" + e.text(),
                    success: function() {
                        t.remove();
                        var e = $(".panel .panel-body .text-danger");
                        e.text(e.text() - 1)
                    }
                })
            }
        })
    }
    t(),
        $("#viewModal").on("hidden.bs.modal",
            function() {
                $(this).removeData("bs.modal")
            }),
        e()
});