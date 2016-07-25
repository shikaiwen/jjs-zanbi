<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/comm/res.jsp" %>
<style type="text/css">
body {
	padding: 0;
	margin: 0;
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
.searchbox-wrapper-outside {
	position: relative;
	top: 0;
	left: 0;
	display: inline-block;
	width: 160px;
}
.searchbox-wrapper-inside {
	position: absolute;
	top: -15px;
	left: 0;
}
.searchbox-text {
	outline: none;
}
.sucol-table {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
	margin: 5px 0;
}
.sucol-table th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
.sucol-table td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>
<title>溯源信息管理</title>
</head>
<body>
<div id="content" style="width: 100%; height: 100%;">
	<table id="dg" title="溯源信息管理" class="easyui-datagrid" style="width: auto;height:auto"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
            <thead>
            	<tr>
            		<th data-options="field:'product',width:20,formatter: productFormatter">产品</th>
            		<th data-options="field:'detail',width:30,formatter: sudetailRemarkFormatter">溯源描述</th>
            		<th data-options="field:'table',width:80,formatter: sudetailTableFormatter">溯源信息表</th>
            	</tr>
            </thead>
    </table>
    </div>
    <div id="toolbar">
    	<span>&nbsp;&nbsp;</span>
    	<span class="searchbox-wrapper-outside">
    		<span class="searchbox-wrapper-inside">
    			<input class="easyui-searchbox" data-options="prompt:'请输入产品名称',searcher:doSearch" style="width:160px"></input>
    		</span>
    	</span>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newSuDetail()">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editSuDetail()">编辑</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroySuDetail()">删除</a>
    </div>
<script type="text/javascript">
var base = "<%=base %>";
var page_urls = ["<%=base%>/administration/su/goAdd.do", "<%=base%>/administration/su/goUpdate.do", "<%=base%>/administration/product/manage.do"];
var urls = [null, null, "<%=base%>/administration/su/doDelete.do", "<%=base%>/administration/su/list.do"];

$(document).ready(function() {
	$(window).bind("resize", function() {
		$("#dg").datagrid("resize", {height: $(window).height() - 2, width: $(window).width()});
	});
});
</script> 
<script type="text/javascript" src="<%=base%>/inc/js/administration/su-manage.js"></script>
</body>
</html>