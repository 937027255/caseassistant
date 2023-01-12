function exportWord(url) {
    table.set();
    var rows = $.common.isEmpty(table.options.uniqueId) ? $.table.selectFirstColumns() : $.table.selectColumns(table.options.uniqueId);
    if (rows.length == 0) {
        $.modal.alertWarning("请至少选择一条记录");
        return;
    }
    $.modal.confirm("确认要导出选中的" + rows.length + "条数据吗?", function() {
        var data = { "ids": rows.join() };
        $.operate.submit(url, "post", "json", data, function(result) {
            if (result.code == web_status.SUCCESS) {
                window.location.href = ctx + "common/download?fileName=" + encodeURI(result.msg) + "&delete=" + true;
            } else if (result.code == web_status.WARNING) {
                $.modal.alertWarning(result.msg)
            } else {
                $.modal.alertError(result.msg);
            }
            $.modal.closeLoading();
        });
    });
};

function analyzingService(url) {
    callback = function(result) {
        if (result.code == web_status.SUCCESS) {
            $.modal.msgSuccess(result.msg);
        } else if (result.code == web_status.WARNING) {
            $.modal.alertWarning(result.msg);
        } else {
            $.modal.alertError(result.msg);
        }
        $.modal.closeLoading();
    };
    $.ajax({
        url: url,
        type: "get",
        dataType: "json",
        data: "",
        async: true,
        timeout: 600000,
        beforeSend: function () {
            $.modal.msgWarning("正在处理中，请稍后来查看结果");
        },
        success: function(result) {
            if (typeof callback == "function") {
                callback(result);
            }
            $.operate.ajaxSuccess(result);
        }
    });
};