<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/comm/res.jsp" %>
<style type="text/css">
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
var api = frameElement.api, W = api.opener;
$(function(){
	registerResize("#dg");
	api.button(
			 {
	    id:'valueOk',
	    name:'确定',
	    callback:getSelected
	},{
	    id:'value',
	    name:'取消',
	});
});

function getSelected(){
	
	var row = $dg.datagrid('getSelected');
	if(!row){
		alert("请选择产品 ");
		return false;
	}else{
		api.data.callback(row);
	}
}
</script>
<title>产品维护</title>
</head>
<body>
	<div id="content" style="width: 80%;">
	<table id="dg" title="产品" class="easyui-datagrid" style="width: auto;height:auto"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true"
            url="<%=base%>/administration/product/list.do">
        <thead>
            <tr>
                <th field="productName" width="50">名称</th>
                <th field="productPrice" width="50">价格</th>
                <th field="productStatus" width="50" formatter="productStatusFormmater">状态</th>
                <th field="productBatchPrefix" width="50">批次号前缀码</th>
                <th field="productViewTimes" width="50">查询次数</th>
                <th field="productTheme" width="50">主题</th>
            </tr>
        </thead>
    </table>
    </div>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newProduct()">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProduct()">编辑</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyProduct()">删除</a>
    </div>
    <div id="dlg" class="easyui-dialog" style="width:400px;height:auto;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">产品信息</div>
        <form id="fm" method="post">
        	<input type="hidden" name="productId" value="" />
            <div class="fitem">
                <label><span class="rf">*</span>产品名称：</label>
                <input name="productName" class="easyui-validatebox" data-options="required:true" />
            </div>
            <div class="fitem">
                <label><span class="rf">*</span>产品价格：</label>
                <input name="productPrice" class="easyui-validatebox" data-options="required:true" />
            </div>
            <div class="fitem">
                <label>&nbsp;产品状态：</label>
                <select name="productStatus">
                	<option value="0">在销</option>
                	<option value="1">下架</option>
                </select>
            </div>
            <div class="fitem">
                <label>&nbsp;批次前缀：</label>
                <input name="productBatchPrefix" class="easyui-textbox" />
            </div>
            <div class="fitem">
                <label>&nbsp;产品主题：</label>
                <input name="productTheme" class="easyui-textbox" validType="email" />
            </div>
            <div class="fitem">
                <label>&nbsp;查询次数：</label>
                <input name="productViewTimes" class="easyui-textbox" value="0" readonly="readonly" />
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveProduct()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>
<script type="text/javascript">
var base = "<%=base %>";
var urls = ["<%=base%>/administration/product/doAdd.do", "<%=base%>/administration/product/doUpdate.do", "<%=base%>/administration/product/doDelete.do"];
</script> 
<script type="text/javascript" src="<%=base%>/inc/js/administration/product-manage.js"></script>
</body>
</html>