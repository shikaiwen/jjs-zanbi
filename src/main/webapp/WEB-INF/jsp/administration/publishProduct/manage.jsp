<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/comm/res.jsp" %>
<script type="text/javascript" src="<%=base%>/plugins/jquery.fileDownload.js"></script>
<title>产品发布</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}
.ftitle {
	height: 40px;
	line-height: 40px;
	font-weight: bold;
	border-bottom: 1px solid grey;
	font-size: 16px;
}
.fitem {
	margin: 4px 0;
}
.rf {
	color: red;
}
</style>

<script>
	//导出标签
	function exportLabel(){
		var row = $dg.datagrid("getSelected");
		if (!row) { $.messager.alert("警告", "请选择一条数据。"); return;}
		
	    var data = {callback:function(datas){
	    	var labelId = datas['labelId'];
	    	var inventoryId = row['inventoryId'];
	    	//触发导出标签请求
	    	window.location.href = '<%=base%>/labelController/exportLabel.do?inventoryId='+inventoryId+"&labelTemplateId=" + labelId;
	    }};
	    
		$.dialog({
			title: "选择标签模板",
			content: "url: <%=base%>/labelController/popForPublishProduct.do",
			width:700,
			height:450,
			data:data
		});
	}
	
	//导入数据
	function importProductData(){
		
		var data = {callback:function(datas){
			//数据保存完成回调行数
			alert("完成了！");
			$("#dg").datagrid("reload");
		}};
		
		var dialog = $.dialog({
			title: "选择json文件",
			content: "url: <%=base%>/administration/publishProduct/goUploadJson.do",
			width:300,
			height:200,
			data:data
		});
	}
	$(document).ready(function() {
		$(window).bind("resize", function() {
			$("#dg").datagrid("resize", {height: $(window).height() - 2, width: $(window).width()});
		});
		
	});
</script>
</head>
<body>
	<div id="content" style="width: 100%; height: 100%">
		<table id="dg" title="未发布的入库信息" class="easyui-datagrid" style="width: auto;height:auto">
	    </table>
	</div>
	<div id="toolbar">	
	 <div>      	
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="publish()">发布</a>
<!-- 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="exportLabel()">导出标签</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="importProductData()">导入产品数据数据</a> -->
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="fillSuData()">关联溯源信息</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="exportExcel()">导出打印数据</a>
      </div>
    </div>
<script type="text/javascript">
var $dg = null;
$(document).ready(function() {
	$dg = $("#dg");
	$dg.datagrid({
		title: "未发布的入库信息",
		url: "<%=base%>/inventoryController/listUnpublished.do",
		toolbar:'#toolbar',
		singleSelect: true,
		columns:[[
		   {field:'inventoryId',title:'库存编号',name:'inventoryId',align:'center',width:100},
		   {field:"productId",title:'产品id',name:'productId',align:'center',width:150,hidden:true},
		   {field:"productName",title:'产品名称',name:'productName',align:'center',width:150,formatter:function(val,row){
			   if (row && row.product && row.product.productName)
			   	return row.product.productName;
			   return "";
		   }},
		   {field:'batchNo',title:'批次号',name:'batchNo',align:'center',width:180},
		   {field:'quantity',title:'数量',name:'quantity',align:'center',width:180},
		   {field:'inTime',title:'入库时间',name:'inTime',align:'center',width:180},
		   {field:'operatorName',title:'操作人',name:'operatorName',align:'center',width:180},
		   {field:'isPublished',title:'是否发布',name:'isPublished',align:'center',width:80, formatter: function(val) { return val == "1"?"是": "否"}},
		   {field:'suDetailId',title:'是否关联溯源',name:'suDetailId',align:'center',width:80, formatter: function(val) { 
			   
			   if(val == -1) return "暂不提供溯源信息";
			   return !val || val == 0? "否": "<a href=\"javascript:openSuDetail(" + val + ")\">已关联</a>";
					}
		   }
		 ]],
	});
	$dg.datagrid("resize", {
		height: getHeight(1)
	});
});
function openSuDetail(did) {
	if (did > 0) {
		$.dialog({
			title: "关联溯源",
			content: "url: <%=base%>/administration/su/goUpdate.do?sudetailid=" + did,
			zIndex: 13,
			width: 500,
			button: [
				{
					name: "关闭"
				}
			]
		});
	}
	
}
function publish() {
	
	//判断条件是否满足，是否关联溯源信息，是否导出了标签等等
	//这里的操作就是要更新库存到产品表了
	
	var row = $dg.datagrid("getSelected");
	if (!row) { $.messager.alert("警告", "请选择一条数据。"); return;}
	
	//alert(JSON.stringify(row));//return;
	
	if("1" == row.isPublished) {
		$.messager.alert("警告", "该批产品已经发布!"); return;
	}
	if(!row.suDetailId){
		$.messager.alert("警告", "必须先关联溯源信息才能发布。"); return;
	}
	
	var url = "<%=base%>/administration/publishProduct/doPublish.do?inventoryId=" + row.inventoryId;
	$.post(url,function(datas){
		//var json = $.parseJSON(datas);
		if(!datas.success){
			$.dialog.alert("发布失败!");
		}else{
			$.dialog.alert("发布成功!", function(){
				$dg.datagrid("reload");
			}
			);
		}
	});
	<%-- $.dialog({
		title: "发布",
		content: "url: <%=base%>/administration/publishProduct/goPublish.do?inventoryId=" + row.inventoryId,
		zIndex: 10,
		button: [
			{
				name: "发布",
				callback: function() {
					var dialog = this;
					this.content.save(this, function() {
						//dialog.close();
						$dg.datagrid("reload");
					});
					return false;
				},
				focus: true
			},
			{
				name: "关闭"
			}
		]
	}); --%>
}

//关联溯源信息
function fillSuData(){
	var row = $dg.datagrid("getSelected");
	if (!row) { $.messager.alert("警告", "请选择一条数据。"); return;}
	$.dialog({
		title: "关联溯源信息",
		content: "url: <%=base%>/administration/publishProduct/goFillSuData.do?inventoryId=" + row.inventoryId,
		width:400,
		height:200,
		zIndex: 10,
		button: [
			{
				name: "确定",
				callback: function() {
					var dialog = this;
					this.content.save(this, function() {
						//dialog.close();
						$dg.datagrid("reload");
					});
					return false;
				},
				focus: true
			},
			{
				name: "关闭"
			}
		]
	});
}


function exportExcel() {
	var row = $dg.datagrid("getSelected");
	if (!row) { $.messager.alert("警告", "请选择一条数据。"); return;}
	var inventoryId = row['inventoryId'];
	 $.fileDownload("<%=base%>/administration/publishProduct/dexcel.do?inventoryId=" + inventoryId, {
		 failCallback: function (responseHtml, url) {
			 //console.log(responseHtml);
			 var t = "\"msg\":\"";
			 var pos = responseHtml.indexOf(t);
			 if (pos != -1) {
				 var pos2 = responseHtml.indexOf("\"", pos + t.length);
				 var msg = responseHtml.substring(pos + t.length, pos2);
				 $.messager.alert("警告", msg);
			 }
         }
	 });
}
</script>
</body>
</html>