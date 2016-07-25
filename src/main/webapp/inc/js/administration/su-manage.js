/**
 * 
 */
var $dg = null;
var productName = null;
$(document).ready(function() {
	$dg = $("#dg");
	$dg.datagrid("resize", {
		height: getHeight(1)
	});
});
function doSearch(key) {
    //$("#product-search-frame").attr("src", productBaseUrl + "/manage.do?name=" + key);
	//$('#spdlg').dialog('open').dialog('setTitle','查询产品：' + key);
	$.dialog({
		width: 800,
		height: 400,
		title: "查询产品：" + key,
		content: "url: " + page_urls[2] + "?name=" + key,
		zIndex: 6000,
		button: [
		         {
		        	 name: "选择",
		        	 focus: true,
		        	 callback: function() {
		        		 var row = this.content.$dg.datagrid("getSelected");
		        		 if (row) {
		        			 selectProduct(row);
		        			 return true;
		        		 } else {
		        			 $.messager.alert('警告','请选择一个产品');
		        		 }
		        		 return false;
		        	 }
		         },
		         {
		        	 name: "关闭"
		         }
		]
	});
}
function selectProduct(row) {
	// get child iframe window
	productName = row.productName;
	$dg.datagrid("loading");
	$.ajax(urls[3], {
		dataType : "json",
		data : {
			"productId" : row.productId
		},
		method : "GET",
		success : function(json) {
			if (json && json.success) {
				if (!json.obj) json.obj = [];
				$dg.datagrid("loadData", json.obj);
			} else if (json && json.success === false && json.msg)
				$.messager.show({ // show error message
					title : '错误',
					msg : json.msg
				});

		},
		complete : function() {
			$dg.datagrid("loaded");
		}
	});
}

function productFormatter(value) {
	return productName;
}

function sudetailRemarkFormatter(value) {
	return value.sudetailRemark;
}

function sudetailTableFormatter(value) {
	var html = "";
	html += "<table class='sucol-table'><thead><tr>";
	for (var i = 0; i < value.columns.length; i++) {
		html += "<th>" + value.columns[i].label + "</th>";
	}
	html += "</tr></thead>";
	html += "<tbody>";
	for (var i = 0; value.rows != null && i < value.rows.length; i++) {
		html += "<tr>";
		for (var j = 0; j < value.rows[i].cells.length; j++) {
			html += "<td>" + value.rows[i].cells[j].value.value + "</td>";
		}
		html += "</tr>";
	}
	html += "</tbody>";
	html += "</table>";
	return html;
}


function newSuDetail() {

	$.dialog({
		title: "添加溯源详细信息",
		content: "url:" + page_urls[0],
		width: 800,
		height: 400,
		button: [
		         {
		        	 name: "添加",
		        	 focus: true,
		        	 callback: function() {
		        		 var dialog = this;
		        		 this.content.save(this, function(dialog, productId, productName) {
		        			 window.productName = productName;
		        			 var row = {};
		        			 row.productId = productId;
		        			 row.productName = productName;
		        			 selectProduct(row);
		        		 });
		        		 return false;
		        	 }
		         }, 
		         {
		        	 name: "关闭"
		         }
		]
	});
}

function destroySuDetail() {
	var row = $dg.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("警告", "请选择一条需要删除的数据");
		return false;
	}
	$.messager.confirm("请确认", "你确定要删除这条数据吗？删除后将不能找回！", function(r) {
		if (r) {
			//用户确认要删除
			$.ajax(urls[2], {
				dataType: "json",
				data: {sudetailId: row.detail.sudetailId},
				type: "POST",
				success: function(json) {
					if (json && json.success) {
						var pr = {"productId": row.detail.productId, "productName": window.productName};
						selectProduct(pr);
					} else if (json && json.msg) {
						$.messager.alert("警告", "删除失败<br/>" + json.msg);
					}
				}
			});
		}
	});
}

function editSuDetail() {
	var row = $dg.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("警告", "请选择一条需要删除的数据");
		return false;
	}
	$.dialog({
		title: "编辑溯源详细信息",
		content: "url:" + page_urls[1] + "?sudetailid=" + row.detail.sudetailId,
		width: 800,
		height: 400,
		zIndex: 2000,
		button: [
		         {
		        	 name: "保存",
		        	 focus: true,
		        	 callback: function() {
		        		 var dialog = this;
		        		 this.content.save(this, function(dialog, productId, productName) {
		        			 window.productName = productName;
		        			 var row = {};
		        			 row.productId = productId;
		        			 row.productName = productName;
		        			 selectProduct(row);
		        		 });
		        		 return false;
		        	 }
		         }, 
		         {
		        	 name: "关闭"
		         }
		]
	});
}
