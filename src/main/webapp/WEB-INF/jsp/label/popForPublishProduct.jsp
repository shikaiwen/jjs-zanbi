<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/comm/res.jsp" %>
<title></title>

<script type="text/javascript">
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
	
	var row = $(dd).datagrid('getSelected');
	if(!row){
		alert("请选择产品 ");
		return false;
	}else{
		api.data.callback(row);
	}
}




var dd;
$(function(){
	registerResize("#labelDg");
});

$(function(){
	dd =$("#labelDg").datagrid({
		title:'入库记录表',
		url:'<%=base%>/labelController/getListData.do',
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
		   {field:'labelId',title:'模板编号',name:'labelId',align:'center',width:100},
		   {field:"productId",title:'产品id',name:'productId',align:'center',width:150,hidden:true},
		   {field:"productName",title:'所属产品',name:'productId',align:'center',width:150},
		   {field:"qrHeight",title:'二维码高',name:'qrHeight',align:'center',width:70},
		   {field:"qrWidth",title:'二维码宽',name:'qrWidth',align:'center',width:70},
		   {field:"qrStartX",title:'二维码左边距',name:'qrStartX',align:'center',width:70},
		   {field:"qrStartY",title:'二维码上边距',name:'qrStartY',align:'center',width:70},
		   {field:"bgImg",title:'背景图片',name:'bgImg',align:'center',width:150},
		   {field:'remarks',title:'备注',name:'remarks',align:'center',width:180}
		 ]],
		 pagination:true
	});
	
	var p = $('#labelDg').datagrid('getPager');
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
	var rows = $('#labelDg').datagrid('getSelections');
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
	            $("#labelDg").datagrid("reload");
	        });
	    });
	}
}

function add(){	
	var dialog = createDialog("addLabelDg","<%=base%>/labelController/goAdd.do","添加模板",addCallback );
}	

function addCallback(dialog){
	$(dialog).dialog("close");
	$(dd).datagrid("reload");
}


//modify 
function update(){
	var row = $('#labelDg').datagrid('getSelected');
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

function design(){
	var rows = $('#labelDg').datagrid('getSelections');
	if(rows.length != 1){$.messager.alert("提示","请选择一条数据");return;}
	var dialog = createDialog("designLabelDg","<%=base%>/labelController/goDesign.do?labelId="+rows[0].labelId,"添加模板",designCallback,900,500 );
}

function designCallback(dialog){
	$(dialog).dialog("close");
	$(dd).datagrid("reload");
}
</script>
</head>
<body class="easyui-layout" fit="true">        
    
    <div style="height:100%"> 
    
    <!-- 可编辑表格 -->
	 <table id="labelDg" class="easyui-layout" data-options="fit:true"> </table> 
	  
    </div>  

	<div id="toolbar">	
	 <div>        	
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="design()">设计模板</a>
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
