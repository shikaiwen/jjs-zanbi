var obj = null;
$(document).ready(function() {
	$("#validateBtn").bind("click", function() {
		var d = dialog({
		    title: '产品验证',
		    content: '<input type="text" placeholder="刮刮卡号 " style="width: 100%;height: 28px;border: 1px solid rgb(203, 203, 203);border-radius: 4px;font-size: 20px;color: gray;" />' +
		    '<span style="color:red;visibility: hidden;">请输入刮刮卡号</span>',
		    okValue: "验证",
		    ok: function () {
		    	var $p = $(d.node);
		    	var $inp = $p.find("input");
		    	if ($inp.val().trim().length == 0) {
			    	$p.find("span").css("visibility", "visible");
			    	return false;
		    	}
		    	d.removeEventListener("close", validateRequest);
		    	d.addEventListener("close", validateRequest);
		    }
		});
		d.width(240);
		d.showModal();
		obj = d;
	});
	$("#juboBtn").bind("click", function() {
		var d = dialog({
		    title: 'message',
		    content: '<input autofocus />'
		});
		d.showModal();
	});
	$("#withbtnBtn").bind("click", function() {
		var d = dialog({
		    title: '提示',
		    content: '按钮回调函数返回 false 则不许关闭',
		    okValue: '确定',
		    ok: function () {
		        this.title('提交中…');
		        return false;
		    },
		    cancelValue: '取消',
		    cancel: function () {}
		});
		d.show();
	});
});
function validateRequest() {
	var wd = waitingDialog();
	wd.showModal();
	//$.ajax("");
	setTimeout(function() {
		wd.close();
		var d = dialog({
			content: '<div><i class="fa fa-check" style="color: rgb(0, 255, 23);"></i>&nbsp;该产品为正品</div>',
			quickClose: true
		});
		$(d.node).addClass("dialog-theme-b");
		d.showModal();
	}, 2000);
}

function waitingDialog(msg) {
	if (!msg)
		msg = "请稍后...";
	var d = dialog({
		content: '<div><i class="fa fa-spinner fa-spin"></i>&nbsp;' + msg + '</div>'
	});
	$(d.node).addClass("dialog-theme-a");
	return d;
}