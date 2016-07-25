<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/comm/res.jsp" %>

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
<title>产品维护</title>
<script type="text/javascript">
$(function(){
	registerResize("#dg");
});
</script>
</head>
<body>
	<div id="content" style="width: 100%;">
	<table id="dg" title="产品" class="easyui-datagrid" style="width: auto;height:auto"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true"
            url="<%=base%>/administration/product/list.do<%= request.getAttribute("name") == null?"":"?name=" + request.getAttribute("name") %>">
        <thead>
            <tr>
                <th field="productName" width="120px">名称</th>
                <th field="productPrice" width="50px">价格</th>
                <th field="productStatus" width="50px" formatter="productStatusFormmater">状态</th>
                <th field="productStoreCount" width="50px">库存量</th>
                <th field="productUnit" width="50px">产品单位</th>
                <th field="guaranteePeriodDesc" width="50px">保质期</th>
                <th field="productBatchPrefix" width="50px">批次号前缀码</th>
                <!-- 
                <th field="productViewTimes" width="50px">查询次数</th>
                -->
                <th field="productTheme" width="50px">主题</th>
                <th field="productPortrait" width="100px">产品图片</th>
                <th field="productProduceCompany" width="120px" formatter="produceCompanyFormatter">生产企业</th>
                <th field="productSpec" width="50px">规格</th>
                <!-- 
                <th field="productDesc" width="80px">描述</th>
                 -->
            </tr>
        </thead>
    </table>
    </div>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newProduct2()">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProduct2()">编辑</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyProduct()">删除</a>
        <div id="condition">
     	        <a style="padding-left: 21px;">产品名称：</a><input type="text" name="productName" id="productNameSearchField" value="" style="width: 160px;" />
				<a href="javascript:void(0);" style="margin-left:10px;" class="easyui-linkbutton" iconCls="icon-search" onclick="toQuery()">查询</a>
     	</div>
    </div>
    
<script type="text/javascript">
var base = "<%=base %>";
var listUrl = "<%=base%>/administration/product/list.do";
var urls = ["<%=base%>/administration/product/doAdd.do", "<%=base%>/administration/product/doUpdate.do", "<%=base%>/administration/product/doDelete.do"];
$(function() {
    
});
function selectProduceCompany(t) {
	$.dialog({
		title: "选择标签模板",
		content: "url: <%=base%>/productCompanyController/index.do",
		width:700,
		height:450,
		zIndex: 10000,
		button: [
		    {
		    	name: "选择",
		    	focus: true,
		    	callback: function() {
		    		var row = this.content.$("#companyDg").datagrid("getSelected");
		    		if (row) {
		    			$(t).val(row.companyId);
		    		}
		    	}
		    },
			{
				name: "关闭"
			}      
		]
	});
}
function produceCompanyFormatter(t, row) {
	if (row && row.company)
		return row.company.companyName;
	return "";
}
function newProduct2() {
	var title = "添加产品";
	var actionText = "保存";
	addOrUpdate(null, title, actionText);
}
function editProduct2() {
	var title = "修改产品";
	var actionText = "更新";
	var row = $dg.datagrid("getSelected");
	if (!row) { $.messager.alert("警告", "请选择一条数据。"); return;}
	addOrUpdate(row, title, actionText);
}
function addOrUpdate(row, title, actionText) {
	$.dialog({
		title: title,
		content: "url: <%=base%>/administration/product/goAddOrUpdate.do" + (row != null ? "?id=" + row.productId : ""),
		zIndex: 10,
		width: 700,
		height: 450,
		button: [
			{
				name: actionText,
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
</script> 
<script type="text/javascript" src="<%=base%>/inc/js/administration/product-manage.js"></script>
</body>
</html>