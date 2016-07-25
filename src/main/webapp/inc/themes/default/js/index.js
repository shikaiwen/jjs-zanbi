var code = "";
$(document).ready(function() {
	/*
	$("#validateBtn").bind("click", function() {
		dialog({
		    title: '产品验证',
		    content: '<input type="text" placeholder="刮刮卡号" style="width: 100%;height: 28px;border: 1px solid rgb(203, 203, 203);border-radius: 4px;font-size: 20px;color: gray;" />' +
		    '<span style="color:red;visibility: hidden;">请输入刮刮卡号</span>',
		    okValue: "验证",
		    ok: function () {
		    	var $p = $(d.node);
		    	var $inp = $p.find("input");
		    	if ($inp.val().trim().length == 0) {
			    	$p.find("span").css("visibility", "visible");
			    	return false;
		    	}
		    	code = $inp.val().trim();
		    	d.removeEventListener("close", validateRequest);
		    	d.addEventListener("close", validateRequest);
		    }
		}).width(240).showModal();
	});
	*/
});
/*
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
*/

function waitingDialog(msg) {
	if (!msg)
		msg = "请稍后...";
	var d = dialog({
		content: '<div><i class="fa fa-spinner fa-spin"></i>&nbsp;' + msg + '</div>'
	});
	$(d.node).addClass("dialog-theme-a");
	return d;
}
function validateScrabCode(obj, url) {
	var $scrabcode = $("#scrabcode");
	if ($scrabcode.val().trim().length > 0) {
		document.location = url;
	}
}
function checkWinLottery(obj, q, url) {
	$.mobile.loading("show", {
	    text: "正在验证...",
	    textVisible: true,
	    textonly: false
	});
	$.ajax(url, {
		dataType: "json",
		data: {"q": q},
	    success: function(json) {
		    if (json.success) {
		    	$('#pagescrab-popup').popup();$('#pagescrab-popup').popup('open');
    		} else {
    			jNotify(
    					'本产品已经参与过抽奖！',
    					{
    					  autoHide : true, // added in v2.0
    					  clickOverlay : false, // added in v2.0
    					  MinWidth : 100,
    					  TimeShown : 2000,
    					  ShowTimeEffect : 200,
    					  HideTimeEffect : 200,
    					  LongTrip :20,
    					  HorizontalPosition : 'center',
    					  VerticalPosition : 'top',
    					  ShowOverlay : true,
    			   		  ColorOverlay : '#000',
    					  OpacityOverlay : 0.3,
    					  onClosed : function(){ // added in v2.0
    					   
    					  },
    					  onCompleted : function(){ // added in v2.0
    					   
    					  }
    					});
    					return;
    		}
		},
		complete: function() {
		    $.mobile.loading("hide");
    	}
	});
}