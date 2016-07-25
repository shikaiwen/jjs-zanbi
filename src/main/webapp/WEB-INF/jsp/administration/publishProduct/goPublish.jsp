<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/comm/res.jsp" %>
<title>发布</title>
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
</head>
<body>
	<div class="content">
		<div class="ftitle">产品发布信息</div>
		<form id="fm" method="post">
			<input type="hidden" name="isPublished" value="1" />
			<div class="fitem">
				<label><span class="rf">*</span>入库编号：</label>
				<input type="text" name="inventoryId" value='<c:out value="${requestScope[\"inventory\"].inventoryId }"></c:out>' readonly="readonly" />
			</div>
			<div class="fitem">
				<label><span class="rf">*</span>溯源详细：</label>
				<input type="text" name="sudetailRemark" id="sudetailRemark" value="<c:out value="${requestScope[\"inventory\"].suDetailId }" />" readonly="readonly" />
				<input type="hidden" name="suDetailId" id="sudetailId" value="<c:out value="${requestScope[\"inventory\"].suDetailId }" />" />
				暂无:<input type="checkbox" id="emptyNow" name="emptyNow" />
			</div>
		</form>
	</div>
	<script type="text/javascript">
	
	$(function(){
		$("#emptyNow").click(function(){
			var checked = $(this).is(":checked");
			//alert(checked);
			if(checked){
				$("#sudetailRemark").val(-1);
				$("#sudetailId").val(-1);
			}else{
				$("#sudetailRemark").val(0);
				$("#sudetailId").val(0);
			}
		});
	});
	
	$(document).ready(function() {
		$("#sudetailRemark").bind("click", function() {
			$.dialog({
				title: "发布信息", 
				content: "url: <%=base%>/administration/su/manage.do",
				zIndex: 20,
				width: 800,
				height: 400,
				button: [
					{
						name: "选择",
						focus: true,
						callback: function() {
							var row = this.content.$dg.datagrid("getSelected");
							if (!row) {
								$.messager.alert("警告", "请选择一行数据");
								return false;
							}
							$("#sudetailRemark").val(row.detail.sudetailId + ":" + row.detail.sudetailRemark);
							$("#sudetailId").val(row.detail.sudetailId);
						}
					},
					{
						name: "关闭"
					}
				]
			});
		});
	});
	function save(dialog ,okcallback ){
		if ($("#sudetailId").val().length == 0) {
			$.messager.alert("警告", "请选择溯源信息");
			return false;
		}
    	$("#fm").form('submit',{
    		url:'<%=base%>/administration/publishProduct/doFillSuData.do',
    		onSubmit:function(param){
    			openProgress(1,"正在执行保存操作...");
    		    return true;
    		},
    		success:function(data){
    			openProgress(0);
    			var d = $.parseJSON(data);
    			if(d.success == true){
    				dialog.close();
    				$.dialog.alert("保存成功", function(){
    					okcallback(dialog);
    				});
    			}else{
    			  alert("保存失败\n" + d.msg);
    			}
    		}
    	});	
    }
	</script>
</body>
</html>