<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/comm/res.jsp" %>
<script type="text/javascript" src="<%=base%>/plugins/JSON-js/json2.js"></script>
<title>添加溯源详细信息</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-size: 12px;
}
#content {
	width: 100%;
}
#dg {
	width: 100%;
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
	width: 100%;
}
.rf {
	color: red;
}
</style>

<script>
	var $dg = null;
	$(function(){
		$dg = $("#dg");
		$("#createTableMenu").bind("click", function() {
			$.messager.prompt("创建表格", "请输入表格的行与列，例如创建3x3的表格可以输入“3”或者“3 3”：", function(r) {
				if (r) {
					var rc = parseRowColText(r);
					if (rc.row <= 0 || rc.col <= 0)
						return false;
					var columns = [];
					for (var i = 0; i < rc.col; i++) {
						var f = String.fromCharCode(65 + i);
						columns.push({
							field: f,
							title: f,
							width: 120,
							editor: "text"
						});
					}
					$dg.datagrid({"columns": [columns], onClickCell: onClickCell});
					//删除所有的行
					$dg.datagrid("loadData", []);
					for (var i = 0; i < rc.row; i++) {
						$dg.datagrid("insertRow", {row: {}});
					}
				}
				return false;
			});
		});
		/**
		 * 在上方插入行单击事件
		 * */
		$("#insertRowUp").bind("click", function() {
				if (hasColumns(true)) return;
				endEditing();
				if (isSelectRow(false)) {
					var index = $dg.datagrid("getRowIndex", $dg.datagrid("getSelected"));
				} else
					index = 0;
				if (index >= 0) {
					$dg.datagrid("insertRow", {index: index, row:{}});
				}
		});
		/**
		 * 在下方插入行单击事件
		 * */
		$("#insertRowBelow").bind("click", function() {
				if (hasColumns(true)) return;
				endEditing();
				if (isSelectRow(false)) {
					var index = $dg.datagrid("getRowIndex", $dg.datagrid("getSelected"));
				} else
					index = 0;
				if (index >= 0) {
					$dg.datagrid("insertRow", {index: ++index, row:{}});
				}
		});
		$("#deleteSelectedRow").bind("click", function() {
			if (hasColumns(true)) return;
			endEditing();
			if (!isSelectRow(true)) return;
			var index = $dg.datagrid("getRowIndex", $dg.datagrid("getSelected"));
			$dg.datagrid("deleteRow", index);
		});
		/**
		 * 在左边插入列单击事件
		 * */
		$("#insertColumnLeft").bind("click", function() {
			if (hasColumns(true)) return;
			if (isSelectRow(true)) {
				if (window.editField === undefined) {
					$.messager.alert("警告", "请先编辑一列");
					return;
				}
				var editField = window.editField;
				endEditing();
				var columns = $dg.datagrid("options").columns[0];
				var newColumns = [];//新列集合
				var j = editField.charCodeAt(0) - 65;//当前选择的列
				var k = j; //j的备份
				for (var i = 0; i < columns.length; i++) {
				if (i < j) {//比j小的不要改变字段名称
					newColumns.push(columns[i]);
				} else if (i == j) {
				var name = String.fromCharCode(65 + i);
				newColumns.push({field: name, title: name, width: 120, editor: "text"});
				i--;
				j -= 2;
				} else {
					//后续列名都加1
					var name = String.fromCharCode(66 + i);
					columns[i].field = name;
					columns[i].title = name;
					newColumns.push(columns[i]);
				}
				}
				//更新列
				$dg.datagrid({columns: [newColumns]});
				//更新行
				var rows = $dg.datagrid("getData").rows;
				for (var i = 0; i < rows.length; i++) {
					var row = rows[i];
					var m = 0;
					for(var r in row) {
						if (r)
							m++;
					}
					//逆序
					for (j = m - 1; j >= k; j--) {
						var name = String.fromCharCode(65 + j);
						if (row[name]) {
							//交换
							var name2 = String.fromCharCode(66 + j);
							row[name2] = row[name];
							row[name] = undefined;
						}
					}
				}
				$dg.datagrid("loadData", rows);
			}
		});
		/**
		 * 在右边插入列单击事件
		 * */
		$("#insertColumnRight").bind("click", function() {
			if (hasColumns(true)) return;
			if (isSelectRow(true)) {
				if (window.editField === undefined) {
					$.messager.alert("警告", "请先编辑一列");
					return;
				}
				var editField = window.editField;
				endEditing();
				var columns = $dg.datagrid("options").columns[0];
				var newColumns = [];//新列集合
				var j = editField.charCodeAt(0) - 65;//当前选择的列
				var k = j; //j的备份
				if (j == columns.length - 1) { //选择最后一列时直接在尾部添加一个列即可
					newColumns = columns;
					var name = String.fromCharCode(66 + j);
					newColumns.push({field: name, title: name, width: 120, editor: "text"});
				} else
					for (var i = 0; i < columns.length; i++) {
						if (i <= j) {//直到j右边第一个元素都不需要改动
							newColumns.push(columns[i]);
						} else if (i == j + 1) {
							var name = String.fromCharCode(66 + j);
							newColumns.push({field: name, title: name, width: 120, editor: "text"});
							i--;
							j -= 2;
						} else {
							//后续列名都加1
							var name = String.fromCharCode(66 + i);
							columns[i].field = name;
							columns[i].title = name;
							newColumns.push(columns[i]);
						}
					}
				//更新列
				$dg.datagrid({columns: [newColumns]});
				//更新行
				var rows = $dg.datagrid("getData").rows;
				for (var i = 0; i < rows.length; i++) {
					var row = rows[i];
					var m = 0;
					for(var r in row) {
						if (r)
							m++;
					}
					//逆序
					for (j = m - 1; j > k; j--) {
						var name = String.fromCharCode(65 + j);
						if (row[name]) {
							//交换
							var name2 = String.fromCharCode(66 + j);
							row[name2] = row[name];
							row[name] = undefined;
						}
					}
				}
				$dg.datagrid("loadData", rows);
			}
		});
		/* *
		 * 删除当前列
		 * */
		$("#deleteCurrentColumn").bind("click", function() {
			if (hasColumns(true)) return;
			if (isSelectRow(true)) {
				if (window.editField === undefined) {
					$.messager.alert("警告", "请先编辑一列");
					return;
				}
				var editField = window.editField;
				endEditing();
				var columns = $dg.datagrid("options").columns[0];
				var newColumns = [];//新列集合
				var j = editField.charCodeAt(0) - 65;//当前选择的列
				var k = j; //j的备份
				var n = 0;
				for (var i = 0; i < columns.length; i++) {
					if (i < j) {//不需改动
						newColumns.push(columns[i]);
						n++;
					} else if (i > j ) {
						//后续列名都加1
						var name = String.fromCharCode(65 + n);
						columns[i].field = name;
						columns[i].title = name;
						newColumns.push(columns[i]);
						n++;
					}
				}
				//更新列
				$dg.datagrid({columns: [newColumns]});
				//更新行
				var rows = $dg.datagrid("getData").rows;
				for (var i = 0; i < rows.length; i++) {
					var row = rows[i];
					var m = 0;
					for(var r in row) {
						if (r)
							m++;
					}
					//正序
					for (j = k + 1; j < m ; j++) {
						var name = String.fromCharCode(65 + j);
						if (row[name]) {
							//交换
							var name2 = String.fromCharCode(65 + j - 1);
							row[name2] = row[name];
							row[name] = undefined;
						}
					}
				}
				$dg.datagrid("loadData", rows);
			}
	});
		$("#productNameField").bind("click", function() {
			$.dialog({
				width: 820,
				height: 400,
				title: "选择产品",
				content: "url: <%=base%>/administration/product/manage.do",
				zIndex: 4000,
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
		});
		$(window).bind("resize",function(){
			$dg.datagrid("resize",{
				width:getWidth(1)
			});
		});
	});
	function selectProduct(row) {
		// get child iframe window
		var productName = row.productName;
		var productId = row.productId;
		$("#productNameField").val(productName);
		$("#productIdField").val(productId);
	}
	function parseRowColText(t) {
		var rc = {"row": 0, "col": 0};
		if (t) {
			var arr = t.split(" ");
			for (var i = 0; i < arr.length; i++) {
				var tmp = parseInt(arr[i]);
				if (isNaN(tmp))
					continue;
				if (i == 0) {
					rc.row = tmp;
					rc.col = tmp;
				} else {
					rc.col = tmp;
					break;
				}
			}
		}
		return rc;
	}
	
	$.extend($.fn.datagrid.methods, {
        editCell: function(jq,param){
            return jq.each(function(){
                var opts = $(this).datagrid('options');
                var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
                for(var i=0; i<fields.length; i++){
                    var col = $(this).datagrid('getColumnOption', fields[i]);
                    col.editor1 = col.editor;
                    if (fields[i] != param.field){
                        col.editor = null;
                    }
                }
                $(this).datagrid('beginEdit', param.index);
                for(var i=0; i<fields.length; i++){
                    var col = $(this).datagrid('getColumnOption', fields[i]);
                    col.editor = col.editor1;
                }
            });
        }
    });
    
    var editIndex = undefined;
    var editField = undefined;
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($dg.datagrid('validateRow', editIndex)){
            $dg.datagrid('endEdit', editIndex);
            editIndex = undefined;
	    editField = undefined;
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * 点击时编辑，按回车结束编辑
     */
    function onClickCell(index, field, value){
        if (endEditing()){
            $dg.datagrid('selectRow', index)
            $dg.datagrid('editCell', {index:index,field:field});
            var editor = $dg.datagrid("getEditor", {index: index, field: field});
            var $target = $(editor.target);
            $target.focus();
            $target.bind("keypress", function(e) {
            	if (e.which == 13) { //输入回车
            		endEditing();
            	}
            });
            editIndex = index;
	    editField = field;
        }
    }
    function save(dialog ,okcallback ){
    	$("#fm").form('submit',{
    		url:'<%=base%>/administration/su/doAdd.do',
    		onSubmit:function(param){
    			openProgress(1,"正在执行保存操作...");
    			var rows = $dg.datagrid("getRows");
    			if (rows.length < 1) {$.messager.alert("警告", "请填写溯源详细信息表内容"); return false; }
    			param.rows = JSON.stringify(rows);
    		    return true;
    		},
    		success:function(data){
    			openProgress(0);
    			var d = $.parseJSON(data);
    			if(d.success == true){
    				dialog.close();
    				$.dialog.alert("保存成功", function(){
    				okcallback(dialog, $("#productIdField").val(), $("#productNameField").val())});
    			}else{
    			  alert("保存失败\n" + d.msg);
    			}
    		}
    	});	
    }
    
    /**
     * 检查数据网格$dg是否有选择的行，如果有，返回true，否则返回false。
     * @param flag 如果flag为true时，当返回值为false时将弹出警告对话框。如果 flag为false就不弹出对话框。
     * return boolean
     */
    function isSelectRow(flag) {
    	var row = $dg.datagrid("getSelected");
    	var r = false;
    	if (row != null)
    		r = true;
    	else if(flag === true) {
    		$.messager.alert("警告", "请选择一行");
    	}
    	return r;
    }

    /* *
     * 检查数据网格$dg是否存在列，这个一般可以判断是否创建了表格。
     * @param flag 如果flag为true，当返回值为false（没有列）时弹出警告对话框。
     * return boolean
     * */
    function hasColumns(flag) {
	var len = 0;
	var r = false;
	var columns = $dg.datagrid("options").columns;
	for (var i = 0; i < columns.length; i++) {
		len += columns[i].length;
	}
	if (len > 0)
		r = true;
	if (flag === true && !r) {
		$.messager.alert("警告", "请先创建表");
	}
    }
</script>
</head>
<body>
	<div class="content">
		<div class="ftitle">溯源详细信息</div>
		<form id="fm" method="post">
			<c:if test="${requestScope[\"sdtable\"].detail.sudetailId > 0}">
			<input type="hidden" name="sudetailId" value="<c:out value="${requestScope[\"sdtable\"].detail.sudetailId}" />" />
			<div class="fitem">
			<label><input type="checkbox" name="createFlag" value="true" id="createFlag" />新建</label>
			</div>
			</c:if>
			<div class="fitem">
				<label>&nbsp;&nbsp;&nbsp;&nbsp;<span class="rf">*</span>产品：</label> <input
					name="productName" class="easyui-validatebox"
					data-options="required:true" readonly="readonly" id="productNameField" />
					<input type="hidden" name="productId" id="productIdField" />
			</div>
			<div class="fitem">
				<label><span class="rf">*</span>溯源描述：</label>
				<textarea name="sudetailRemark"  class="easyui-validatebox" data-options="required:true"><c:out value="${requestScope[\"sdtable\"].detail.sudetailRemark}" /></textarea>(1024)
			</div>
			<div class="fitem">
				<table id="dg" class="easyui-datagrid" title="溯源信息表"
					style="width: inherit; height: auto"
					data-options="singleSelect:true" toolbar="#toolbar">
					<thead>
						<tr>

						</tr>
					</thead>
				</table>
				<div id="toolbar">
					<a href="#" class="easyui-menubutton"
						data-options="menu:'#mm1',iconCls:'icon-edit'">表格</a>
					<a href="#" class="easyui-menubutton"
						data-options="menu:'#mm2',iconCls:'icon-edit'">行</a>
					<a href="#" class="easyui-menubutton"
						data-options="menu:'#mm3',iconCls:'icon-edit'">列</a>
				</div>
				<div id="mm1" style="width: 150px;">
					<div id="createTableMenu">创建...</div>
				</div>
				<div id="mm2" style="width: 150px;">
					<div id="insertRowUp">在上方插入一行</div>
					<div id="insertRowBelow">在下方插入一行</div>
					<div id="deleteSelectedRow">删除当前行</div>
				</div>
				<div id="mm3" style="width: 150px;">
					<div id="insertColumnLeft">在左边插入一列</div>
					<div id="insertColumnRight">在右边插入一列</div>
					<div id="deleteCurrentColumn">删除当前列</div>
				</div>
			</div>
			<div class="fitem">
				
			</div>
		</form>
	</div>
	<script type="text/javascript">
	<c:if test="${requestScope[\"sdtable\"].detail.sudetailId > 0}">
	//初始化数据
	(function(pid) {
		$.ajax("<%=base%>/administration/product/get.do", {
			dataType: "json",
			data: {productId: pid},
			type: "GET",
			success: function(json) {
				if (json && json.obj && json.obj != null) {
					$("#productIdField").val(json.obj.productId);
					$("#productNameField").val(json.obj.productName);
				}
			}
		});
	})(<c:out value="${requestScope[\"sdtable\"].detail.productId}" />);
	var columns = [];
	var rows = [];
	var i = 0;
	var row = {};
	<c:forEach var="column" items="${requestScope[\"sdtable\"].table.columnDescriptions}">
		row[String.fromCharCode(65 + i)] = "<c:out value="${column.label}" />";
		columns.push({field: String.fromCharCode(65 + i), title:String.fromCharCode(65 + i), width: 120, editor: "text"});
		i++;
	</c:forEach>
	rows.push(row);
	<c:forEach var="row" items="${requestScope[\"sdtable\"].table.rows}">
		row = {};
		i = 0;
		<c:forEach var="cell" items="${row.cells}">
			row[String.fromCharCode(65 + i)] = "<c:out value="${cell.value}" />";
			i++;
		</c:forEach>
		rows.push(row);
	</c:forEach>
	$(document).ready(function() {
		$dg.datagrid({columns: [columns], onClickCell: onClickCell});
		for (i = 0; i < rows.length; i++)
			$dg.datagrid("insertRow", {row: rows[i]});
	});
	</c:if>
	</script>
</body>
</html>
