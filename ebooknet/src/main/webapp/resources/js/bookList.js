$(document).ready(function () {
    var t = $(".panel-page .pagination li a"),
        a = $(".breadcrumb #navCurrent1"),
        e = $(".breadcrumb #navCurrent2");
    t.on({
        click: function () {
            var t, n = e.attr("href");
            n = e.length > 0 ? e.attr("href") : a.attr("href"), t = $(this).hasClass("nextPage") ? 1 * $(".pagination li.active").text() + 1 : $(this).hasClass("prePage") ? 1 * $(".pagination li.active").text() - 1 : $(this).text(), setTimeout(window.location.href = n + "&pageId=" + t, 500)
        }
    })
});