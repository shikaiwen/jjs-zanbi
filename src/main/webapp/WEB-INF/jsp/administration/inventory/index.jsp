<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/comm/res.jsp" %>
<title></title>

<script type="text/javascript">
var dd;
$(function(){
	registerResize("#inventoryDg");
});

$(function(){
	dd =$("#inventoryDg").datagrid({
		title:'入库记录表',
		url:'<%=base%>/inventoryController/getListData.do',
		iconCls:'icon-list',
		pageList:[15,20,25,30],
		pageSize:15,
		width:getWidth(1),
		height:getHeight(1),
		resizable:true,
	//	singleSelect:true,
		//selectOnCheck:true,
		autoRowHeight: false,
		striped: true,		
		sortName: 'id',
		sortOrder: 'desc',
		idField:'id',
		loadMsg:'数据加载中...',
		toolbar:'#toolbar',		
		columns:[[
           {field:'ck',checkbox:true},    
		   {field:'inventoryId',title:'库存编号',name:'inventoryId',align:'center',width:100},
		   {field:"productId",title:'产品id',name:'productId',align:'center',width:150,hidden:true},
		   {field:"productName",title:'产品名称',name:'productName',align:'center',width:150,formatter:function(val,row){
			   return row.product.productName;
		   }},
		   {field:'batchNo',title:'批次号',name:'batchNo',align:'center',width:180},
		   {field:'produceDate',title:'生产日期',name:'produceDate',align:'center',width:180},
		   {field:'quantity',title:'数量',name:'quantity',align:'center',width:180},
		   {field:'inTime',title:'入库时间',name:'inTime',align:'center',width:180},
		   {field:'operatorName',title:'操作人',name:'operatorName',align:'center',width:180}
		 ]],
		 pagination:true
	});
	
	var p = $('#inventoryDg').datagrid('getPager');
	$(p).pagination({		
		beforePageText:'第',
		afterPageText:'页     共{pages}页',
		displayMsg:'当前显示 {from} - {to} 条记录',
		onBeforeRefresh:function(){
		}
	});
	
});
	
function toQuery(){
	var jsonObj  = getAllInputData($("#condition"));
	dd.datagrid("options").queryParams = jsonObj;	
	dd.datagrid('load');	
}	


function toDelete(){
	var rows = $('#inventoryDg').datagrid('getSelections');
	if(rows.length != 1){
		$.messager.alert("提示","请选择一条数据");return;
	}else{
		$.messager.confirm('确认','确定要删除这条数据吗?',function(r){
	        if ( !r ) return;
	        var id = rows[0]['inventoryId'];
	        $.post('<%=base%>/inventoryController/doDelete.do',{"inventoryId":id},function(data){
	            if("ok" == data){
	            	showMsg("操作成功!");
	            }
	            $("#inventoryDg").datagrid("reload");
	        });
	    });
	}
}


function add(){	
	var dialog = createDialog("addInventoryDg","<%=base%>/inventoryController/goAdd.do","添加库存",addCallback );
	//$(dialog).dialog('setTitle','添加理财客户');
	//$('#dlg').form('clear');
}	

function addCallback(dialog){
	$(dialog).dialog("close");
	$(dd).datagrid("reload");
}


//modify 
function update(){
	var row = $('#inventoryDg').datagrid('getSelected');
	if(!row){
		alert("请选择数据");
		return;
	}
	var dialog = createDialog("modifyInventoryDg","<%=base%>/inventoryController/goUpdate.do?inventoryId="+row['inventoryId'],"修改入库单",updateCallback );
}
function updateCallback(dialog){
	$(dialog).dialog("close");
	$(dd).datagrid("reload");
}
//提交保存
function save(){
	$("#fm").form('submit',{
		url:'${rc.contextPath}/customer/saveFinanceCus',
		onSubmit:function(){
		   var _issubmit= $(this).form('validate');
		   if(_issubmit){
			 openProgress(1,"正在执行保存操作...");
		   }
		   return _issubmit;
		},
		success:function(data){
			openProgress(0);
			if(data=="ok"){
			  $('#dlg').dialog('close');
			  showMsg(data);	
			  $("#inventoryDg").datagrid("reload");
			}else{
			  showAlertTip("保存失败");
			}
		}
	});	
}


//选择产品
function chooseProduct(){
//	alertMsg("成功了");
    var data = {callback:function(datas){
    	$("#productId").val(datas['productId']);
    	$("#productName").val(datas['productName']);
    }};
 	$.dialog({
		title:'选择产品',
		content:"url:<%=base%>/administration/product/popProductForInventory.do",
		width:800,
		height:500,
		data:data,
	}); 
}
</script>
</head>
<body class="easyui-layout" fit="true">        
    
    <div style="height:100%"> 
	        <table id="inventoryDg" class="easyui-layout" data-options="fit:true">
	   </table> 
    </div>  

	<div id="toolbar">	
	 <div>        	
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="update()">修改</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="toDelete()">删除</a>
     	
     	<div id="condition">
     	        <a style="padding-left: 21px;">产品：</a>
     	        <input type="text" disabled size="5" name="productName" id="productName"/>
     	        <input type="hidden" disabled size="5" name="productId" id="productId"/>
     	        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="chooseProduct()">选择产品</a>
				<a href="javascript:void(0);" style="margin-left:400px;" class="easyui-linkbutton" iconCls="icon-search" onclick="toQuery()">查询</a>
     	</div>
      </div>
    </div>     



</body>
</html>
