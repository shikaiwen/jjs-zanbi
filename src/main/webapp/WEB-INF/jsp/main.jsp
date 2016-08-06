<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@include file="/comm/res.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>微鹰溯源管理平台</title>
<style type="text/css">
#northArea {
	background-image: url(<%=base%>/inc/imgs/bg.jpg);
}
#northArea .l-btn-text {
	color: white;
}
#northArea .m-btn-plain-active .l-btn-text {
	color: black;
}
</style>
<script type="text/javascript">
   function logout(){
	   $.messager.confirm("确定","确定退出系统吗？", function(r){
		   if(!r)return;
		   $.ajax("<%=base%>/administration/logout.do", {
			   success: function(e) {
				   
		   window.location.href="<%=base%>/administration/login.do";
			   }
		   })
	   });	   
   }
   function modify(){
	   $("<div id='eps'/>").dialog({
		   title:'修改密码',
		   iconCls:'icon-psd-edit',
		   width:600,
		   height:300,
		   modal:true,		   
		   href:'/ftl/sys/passwordEdit.html',
		   buttons:[{text:'确认',
			        iconCls:"icon-ok",
			        handler:function(){save()}
		   },{
			        text:'关闭',
			        iconCls:"icon-cancel",
			        handler:function(){
			        	$('#eps').dialog('close');
			        }
		   }],
		   onClose:function(){
			 $(this).dialog('destroy'); 
		   }
	   });
   }
   
   function save(){
	  $("#fm").form('submit',{
		url:'/modifyPwd',
		onSubmit:function(){
		   var _issubmit= $("#fm").form('validate');
		   if(_issubmit){
			   openProgress(1,"正在执行保存操作...");
		   }
		   return _issubmit;
		},
		success:function(data){
		   openProgress(0);
		   if(data=="ok"){
			  $('#eps').dialog('close');  
			  showMsg(data);
		   }else if(parseInt(data)==3){
			   showAlertTip("原密码有误"); 
		   }else if(parseInt(data)==5){
			   showAlertTip("两次输入密码不一样");
		   }else{
			   showAlertTip("密码修改失败");
		   }
		}
	  });
   }
</script>
</head>
<body style="padding:0px;margin:0px;" class="easyui-layout">
	
		<div id="northArea" data-options="region:'north',split:true" style="height:90px;">
              <table width="100%">
              	<tr>
				   <td><h1 style="margin-left: 52px; margin-top: 16px;">微鹰溯源管理平台</h1></td>
				   <td style="width: 15%;"><p style="padding-top:25px; line-height:150%;"><span style=" visibility: hidden;">欢迎您！</span><br/>
				    
				   <a icon="icon-panel" class="easyui-menubutton" style="font-size: small;font-family: inherit; visibility: hidden;" href="#" menu="#panel-menu">控制面板</a>
				   
				   <a icon="icon-log-off" class="easyui-menubutton" style="font-size: small;font-family: inherit;" href="#" menu="#topbar-menu">注销</a> 
				  
				   <div id="panel-menu" style=" visibility: hidden;">				      
     			     <div data-options="iconCls:'icon-psd-edit'" class="menu-item" onclick="modify();">修改密码</div>
				   </div>
				   
				   <div id="topbar-menu">				      
     			     <div data-options="iconCls:'icon-exit'" class="menu-item" onclick="logout();">退出系统</div>
     			     <div class="menu-sep"></div>
				   </div>				   
				   </p>				        
				   </td>
	            </tr>
              </table>
		</div>
			
		<div data-options="region:'west',split:true" title="导航菜单" style="width:150px;">
			<div class="easyui-accordion" data-options="fit:true,border:false">
			    <div title="产品管理" iconCls="icon-users" data-options="selected:true" style="padding:10px;text-align: center;">
					<a href="javascript:void(0);" onClick="addTab('明细','<%=base%>/getListPage')">
					<img src="<%=base %>/inc/imgs/product-icon.jpg" border="0" width="60px" height="60px" /><br/>
					产品信息管理</a><br/>
					
					<a href="javascript:void(0);" onClick="addTab('公司信息管理','<%=base%>/worker/getListPage')">
					<img src="<%=base %>/inc/imgs/company.png" border="0" width="60px" height="60px" /><br/>
					公司信息管理</a>
				</div>
		
				<div title="溯源信息管理" iconCls="icon-users" data-options="selected:true" style="padding:10px;text-align: center;">
					<a href="javascript:void(0);" onClick="addTab('溯源信息管理','<%=base%>/administration/su/manage.do')">
					<img src="<%=base %>/inc/imgs/suyuan-icon.jpg" border="0" width="60px" height="60px" /><br/>
					溯源信息管理</a><br/>
				</div>
				
				<div title="产品发布管理" iconCls="icon-users" data-options="selected:true" style="padding:10px;text-align: center;">
					<a href="javascript:void(0);" onClick="addTab('发布信息查询','<%=base%>/administration/publishProduct/manage.do')">
					<img src="<%=base %>/inc/imgs/fabu-icon.jpg" border="0" width="60px" height="60px" /><br/>
					发布信息查询
					</a>
				</div>
				
				<div title="库存管理" iconCls="icon-users" data-options="selected:true" style="padding:10px;text-align: center;">
					<a href="javascript:void(0);" onClick="addTab('库存记录维护','<%=base%>/inventoryController/index.do')">
					<img src="<%=base %>/inc/imgs/kucun-icon.jpg" border="0" width="60px" height="60px" /><br/>
					库存记录维护
					</a>
				</div>
				
				<div title="标签管理" iconCls="icon-users" data-options="selected:true" style="padding:10px;text-align: center;">
					<a href="javascript:void(0);" onClick="addTab('标签模板管理','<%=base%>/labelController/index.do')">
					<img src="<%=base %>/inc/imgs/qrcode-icon.jpg" border="0" width="60px" height="60px" /><br/>
					标签模板管理
					</a>
				</div>
				
				<div title="订单管理" iconCls="icon-users" data-options="selected:true" style="padding:10px;text-align: center;">
					<a href="javascript:void(0);" onClick="addTab('订单管理','<%=base%>/administration/order/manage.do')">
					<img src="<%=base %>/inc/imgs/order-icon.png" border="0" width="60px" height="60px" /><br/>
					订单管理
					</a>
				</div>
			</div>

		</div>
		
		
		<div data-options="region:'center'">
			<div class="easyui-tabs" fit="true" border="false" id="tabs">
			  <div title="首页" style="padding:10px;" fit="true">
				<div id="container" style="width: 1200px;height: 400px;margin: 0 auto auto 0;"></div>	
			  </div>
			</div>
		</div>
		
		<div data-options="region:'south'" style="height:20px;" align="center"></div> 

<script>
		
	//add tab
function addTab(title, url){
	if ($('#tabs').tabs('exists', title)){
		$('#tabs').tabs('select', title);//选中并刷新
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		if(url != undefined && currTab.panel('options').title != 'Home') {
			$('#tabs').tabs('update',{
				tab:currTab,
				options:{
					content:createFrame(url)
				}
			})
		}
	} else {
		var content = createFrame(url);
		$('#tabs').tabs('add',{
			title:title,
			content:content,
			closable:true
		});
	}
	//tabClose();
}
function createFrame(url) {
	var s = '<iframe scrolling="no" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	return s;
}
</script>
</body>
</html>
