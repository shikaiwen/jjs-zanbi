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
	registerResize("#companyDg");
});

$(function(){
	dd =$("#companyDg").datagrid({
		title:'公司信息',
		url:'<%=base%>/productCompanyController/getListData.do',
		iconCls:'icon-list',
		pageList:[15,20,25,30],
		pageSize:15,
		width:getWidth(1),
		height:getHeight(1),
		resizable:true,
		singleSelect:true,
		selectOnCheck:true,
		autoRowHeight: false,
		striped: true,		
		sortName: 'id',
		sortOrder: 'desc',
		idField:'id',
		loadMsg:'数据加载中...',
		toolbar:'#toolbar',		
		columns:[[
           {field:'ck',checkbox:true},    
		   {field:'companyId',title:'公司编号',name:'companyId',align:'center',width:100},
		   {field:"companyName",title:'公司名称',name:'companyName',align:'center',width:150},
		   {field:"website",title:'公司网站',name:'website',align:'center',width:150},
		   {field:'mall',title:'网上商城',name:'mall',align:'center',width:180}
		 ]],
		 pagination:true
	});
	
	var p = $('#companyDg').datagrid('getPager');
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
	var rows = $('#companyDg').datagrid('getSelections');
	if(rows.length != 1){
		$.messager.alert("提示","请选择一条数据");return;
	}else{
		$.messager.confirm('确认','确定要删除这条数据吗?',function(r){
	        if ( !r ) return;
	        var id = rows[0]['companyId'];
	        $.post('<%=base%>/productCompanyController/doDelete.do',{"companyId":id},function(data){
	            if("ok" == data){
	            	showMsg("操作成功!");
	            }
	            $("#companyDg").datagrid("reload");
	        });
	    });
	}
}


function add(){	
	var dialog = createDialog("addcompanyDg","<%=base%>/productCompanyController/goAdd.do","公司信息",addCallback );
}	

function addCallback(dialog){
	$(dialog).dialog("close");
	$(dd).datagrid("reload");
}


//modify 
function update(){
	var row = $('#companyDg').datagrid('getSelected');
	if(!row){
		alert("请选择数据");
		return;
	}
	var dialog = createDialog("modifycompanyDg","<%=base%>/productCompanyController/goUpdate.do?company="+row['companyId'],"修改公司",updateCallback );
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
			  $("#companyDg").datagrid("reload");
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
	        <table id="companyDg" class="easyui-layout" data-options="fit:true">
	   </table> 
    </div>  
	<div id="toolbar">	
	 <div>        	
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="update()">修改</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="toDelete()">删除</a>
      </div>
    </div>     
</body>
</html>
