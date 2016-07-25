/**
 * 
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

function statusDialog(text, icon, c) {
	if (!icon)
		icon = "fa-check";
	var colors = ["rgb(0, 255, 23)", "rgb(255, 0, 0)"];
	if (!c)
		c = 0;
	var d = dialog({
		content: '<div><i class="fa ' + icon + '" style="color: ' + colors[c] + ';"></i>&nbsp;' + text + '</div>',
		quickClose: true
	});
	$(d.node).addClass("dialog-theme-b");
	return d;
}