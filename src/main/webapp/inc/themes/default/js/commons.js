/**
 * 
 */
if (jQuery) {
	/**
	 * 
	 */
	window.mydialog_id = 1;
	jQuery.mydialog = function() {
		var $ = jQuery;
		if (arguments.length > 0) {
			var md = new MyDialog(arguments[0], $);
		}
	}
}
/**
 * 简单的对话框，示例：
 * $.mydialog({
        title: "提示",
        content: "添加成功",
        width: 280,
        buttons: [
          {
              name: "确定",
              callback: function() {
                  this.close();
              }
          },
          {
              name: "继续购买",
              callback: function() {
                  document.location = "mall.php";
              }
          }
        ]
    });
 * @param option
 * @param $
 */
function MyDialog(option, $) {
	this.id = window.mydialog_id++;
	this.title = undefined;
	this.content = undefined;
	this.buttons = undefined;
	this.zIndex = 10;
	var args = arguments[0];
	this.width = undefined;
	this.hpadding = undefined;
	this.hmargin = undefined;
	
	function init() {
		if (args) {
			if (args.title)
				this.title = args.title;
			if (args.content)
				this.content = args.content;
			if (args.buttons)
				this.buttons = args.buttons;
			if (args.zIndex)
				this.zIndex = args.zIndex;
			if (args.width)
				this.width = args.width;
			if (args.hpadding)
				this.hpadding = args.hpadding;
			if (args.hmargin)
				this.hmargin = args.hmargin;
		}
		var bodyScrollTop = document.body.scrollTop;
		this.bodyScrollTop = bodyScrollTop;
		var html = "<div class=\"mydialog\" id=\"mydialog-" + this.id + "\">";
		html += "<div class=\"mydialog-mask\" style=\"top: " + document.body.scrollTop + "px;\">";
		html += "</div>";
		html += "<div class=\"mydialog-interactive\" style=\"top: " + document.body.scrollTop + "px;\">";
		html += "<div class=\"mydialog-placeholder\"></div>";
		html += "<div class=\"mydialog-ic\" style=\"" + (this.width ? "width: " + this.width + "px; margin-left: auto; margin-right: auto;" : "") 
		+ (this.hpadding?"padding: 0 " + this.hpadding + "px;" : "")
		+ (this.hmargin?"margin: 0 " + this.hmargin + "px;": "")
		+ "\">";
		if (this.title)
			html += "<h3 class=\"mydialog-title\">" + this.title + "<span class=\"close-btn\">+</span></h3>";
		html += "<p class=\"mydialog-content\">" + this.content + "</p>";
		if (this.buttons && this.buttons.length > 0) {
			html += "<div class=\"mydialog-btns\">";
			html += "<ul class=\"mydialog-btn-list\">";
			for(var b in this.buttons) {
				html += "<li class=\"mydialog-btn-item\" data-btn-no=\"" + b + "\"><span>" + this.buttons[b].name + "</span></li>";
			}
			html += "<li style=\"clear: both; float: none; width: 0; height: 0\"></li>"
			html += "</ul><div style=\"clear: both;\"></div>";
			html += "</div>";
		}
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		$(document.body).append(html);
		
		//再次调整高度，要居中对齐
		var $mi = $("#mydialog-" + this.id + " .mydialog-interactive");
		var $ct = $("#mydialog-" + this.id + " .mydialog-content");
		var $ic = $("#mydialog-" + this.id + " .mydialog-ic");
		$ic.css("margin-top", "-" + (100 + $ct.height()) / 2 + "px")
		
		//禁止滚动
		$(document.body).addClass("noscrolling");
		$("#mydialog-" + this.id + " .mydialog-mask").bind("touchmove", function(e) {
			e.preventDefault();
		});
		$(document.body).css("top", -bodyScrollTop + "px");
		
		//为按钮添加侦听器
		if (this.buttons && this.buttons.length > 0) {
			var md = this;
			$("#mydialog-" + this.id + " .mydialog-btn-item").bind("click", function(e) {
				var $t = $(e.currentTarget);
				var index = parseInt($t.attr("data-btn-no"));
				var btn = md.buttons[index];
				if (btn && btn.callback && typeof btn.callback === "function") {
					btn.callback.apply(md);
				}
			});
		}
		
		//关闭按钮事件
		var md = this;
		$("#mydialog-" + this.id + " .close-btn").bind("click", function(e) {
			md.close();
		});
	}
	init.apply(this);
}
MyDialog.prototype.close = function() {
	$(document.body).css("top", "auto");
	$(document.body).removeClass("noscrolling");
	$("#mydialog-" + this.id + " .mydialog-mask").unbind("touchmove");
	$("#mydialog-" + this.id).remove();
	document.body.scrollTop = this.bodyScrollTop;
}