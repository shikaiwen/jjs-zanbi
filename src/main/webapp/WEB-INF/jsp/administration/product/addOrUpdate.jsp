<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理产品</title>
<%@include file="/comm/res.jsp" %>
<%
long millis = java.util.Calendar.getInstance().getTimeInMillis();
%>
<link rel="stylesheet" type="text/css" href="<%=base %>/plugins/uploadify/uploadify.css" />
<script type="text/javascript" src="<%=base %>/plugins/uploadify/jquery.uploadify.min.js?_t=<%=millis%>"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#file_upload').uploadify({
		'swf'      : '<%=base %>/plugins/uploadify/uploadify.swf?_t=' + new Date().getTime(),
		'uploader' : '<%=base %>/administration/upload/singleUpload.do',
		'buttonText': '请选择产品图片',
		fileObjName: "file",
		formData: {type: 0x00010001},
		onUploadSuccess: function(file, data, response) {
			var json = null;
			try {
				json = eval("(" + data + ")");
			} catch (e) {}
			if (json != null) {
				$("#productPortraitField").val(json.url);
			}
		}
	});
});
</script>
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
<script type="text/javascript">

function save(dialog, callback) {
	$("#fm").form("submit", {
		url:'<%=base%>/administration/product/<c:choose><c:when test="${requestScope[\"product\"] != null}">doUpdate.do</c:when><c:otherwise>doAdd.do</c:otherwise></c:choose>',
		onSubmit:function(param){
			param.productDesc = ue.getContent();
		    return true;
		},
		success:function(data){
			openProgress(0);
			var d = $.parseJSON(data);
			if(d.success == true){
				dialog.close();
				$.dialog.alert("保存成功", function(){
					callback && callback(dialog, $("#productIdField").val(), $("#productNameField").val())
				});
			}else{
			  alert("保存失败\n" + d.msg);
			}
		}
	});
}
function selectProduceCompany(t) {
	$.dialog({
		title: "选择生产商",
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
</script>
</head>
<body>
	<div id="panel">
        <div class="ftitle">产品信息</div>
        <form id="fm" method="post">
        	<input type="hidden" name="productId" value="<c:out value="${requestScope[\"product\"].productId}"></c:out>" />
        	<table>
        		<tr>
        			<td>
	        			<div class="fitem">
			                <label><span class="rf">*</span>产品名称：</label>
			                <input name="productName" class="easyui-validatebox" value="<c:out value="${requestScope[\"product\"].productName}"></c:out>" data-options="required:true" />
			            </div>
			            <div class="fitem">
			                <label><span class="rf">*</span>产品价格：</label>
			                <input name="productPrice" class="easyui-validatebox" value="<c:out value="${requestScope[\"product\"].productPrice}"></c:out>" data-options="required:true" />
			            </div>
			            <div class="fitem">
			                <label>产品状态：</label>
			                <select name="productStatus">
			                	<option value="0" <c:if test="${requestScope[\"product\"].productStatus == 0}">selected="selected"</c:if>>在销</option>
			                	<option value="1" <c:if test="${requestScope[\"product\"].productStatus == 1}">selected="selected"</c:if>>下架</option>
			                </select>
			            </div>
			            <div class="fitem">
			                <label>保质期：</label>
			                <input name="guaranteePeriod" class="easyui-validatebox" value="<c:out value="${requestScope[\"product\"].guaranteePeriod}"></c:out>" data-options="required:true" />个月
			            </div>
			            <div class="fitem">
			                <label>单位：</label>
			                <input name="productUnit" class="easyui-validatebox" value="<c:out value="${requestScope[\"product\"].productUnit}"></c:out>" data-options="required:true" />
			            </div>
        			</td>
        			<td width="10"></td>
        			<td>
        				<div class="fitem">
			                <label>生产企业：</label>
			                <input name="productProduceCompany" class="easyui-textbox" value="<c:out value="${requestScope[\"product\"].productProduceCompany}"></c:out>" onclick="selectProduceCompany(this);" />
			            </div>
			            <div class="fitem">
			                <label>批次前缀：</label>
			                <input name="productBatchPrefix" value="<c:out value="${requestScope[\"product\"].productBatchPrefix}"></c:out>" class="easyui-textbox" />
			            </div>
			            <div class="fitem">
			                <label>产品主题：</label>
			                <input name="productTheme" class="easyui-textbox" value="<c:out value="${requestScope[\"product\"].productTheme}"></c:out>" />
			            </div>
			            <div class="fitem">
			                <label>产品规格：</label>
			                <input name="productSpec" class="easyui-validatebox" value="<c:out value="${requestScope[\"product\"].productSpec}"></c:out>" data-options="required:true" />
			            </div>
        			</td>
        		</tr>
        	</table>
            <div class="fitem">
                <label>产品图片：</label>
                <input name="productPortrait" id="productPortraitField" class="easyui-textbox" value="<c:out value="${requestScope[\"product\"].productPortrait}"></c:out>" />
                <input type="file" name="file" id="file_upload" />
            </div>
            
            <div class="fitem">
                <label>产品描述：</label>
                <script id="container" name="content" type="text/plain"><c:out escapeXml="false" value="${requestScope[\"product\"].productDesc}"></c:out></script>
                <!-- 配置文件 -->
    <script type="text/javascript" src="<%=base %>/plugins/ueditor1_4_3/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=base %>/plugins/ueditor1_4_3/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container', {
        	autoWidth: true,
        	toolbars: [
				['fullscreen', 'source', 'undo', 'redo', 'fontsize', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify'],
				['bold', 'italic', 'underline', 'strikethrough', 'insertorderedlist', 'insertunorderedlist', 'forecolor', 'backcolor', 'simpleupload']
        	],
        	width: 300,
        	serverUrl: "<%=base%>/administration/upload/ueditor.do"
        });
        ue.addListener("serverConfigLoaded", function(err) {

        })
        function errorHandler(err) {
            window.console && console.log && console.log(err);
        }
    </script>
            </div>
        </form>
    </div>

</body>
</html>