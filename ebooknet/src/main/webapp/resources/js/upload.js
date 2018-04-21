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
        $fileInput.change(function() {
            $fileInfo.val($(this).val())
        }),
            $imageInput.change(function() {
                $imageInfo.val($(this).val())
            })
    }
    function setTypeOptions() {
        for (var type1 = ["现代文学", "古典文学", "国外文学", "纪实文学", "诗词歌赋"], type2 = ["武侠玄幻", "青春言情", "悬疑推理", "历史军事", "职场生活"], type3 = ["编程语言", "数据库", "人工智能", "移动开发", "图形图像"], type4 = ["科学技术", "人文艺术", "政治军事", "经济管理", "娱乐休闲"], i = 0; 5 > i; i++) $innerSelect.append('<option value="' + (i + 1) + '">' + type1[i] + "</option>");
        $outSelect.change(function() {
            $innerSelect.children("option").remove();
            var largeTypeNum = $outSelect.val();
            console.log(largeTypeNum);
            var type = eval("type" + largeTypeNum);
            console.log(typeof type);
            for (var i = 0; 5 > i; i++) $innerSelect.append('<option value="' + (i + 1) + '">' + type[i] + "</option>")
        })
    }
    var $outSelect = $("#upload #largeType"),
        $innerSelect = $("#upload #smallType"),
        $pubYear = $("#pubYear"),
        $fileInput = $("#fileUpload"),
        $imageInput = $("#imageUpload"),
        $fileInfo = $("#fileInfo"),
        $imageInfo = $("#imageInfo");
    datePicker(),
        setFileValue(),
        setTypeOptions()
});