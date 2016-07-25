<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/comm/res.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script>
var api = frameElement.api, W = api.opener;
/* $(function(){
	api.button(
			 {
	    id:'valueOk',
	    name:'确定',
	    callback:ok
	},{
	    id:'value',
	    name:'取消',
	});
}); */

//提交表单
$(function(){
	$('#jsonFile').uploadify({
	    'swf'      : '<%=base %>/plugins/uploadify/uploadify.swf',
	    'uploader' : '<%=base%>/administration/publishProduct/importJson.do',
	    'buttonText' : '上传文件',
	    'fileObjName': 'jsonFile',
	    'onUploadSuccess':function(filename, data, response) {
	    	var d = $.parseJSON(data);
	    	if(d.success == true){
	    		$.dialog.confirm("上传完成，是否导入数据?",okCallback);
	    	}
	    }
	});
});

//确认导入
function okCallback(){
	$.post("<%=base%>/administration/publishProduct/doImportJson.do",{},function(datas){
		//调用主页面
		api.data.callback();
		api.close();
	});
}
</script>
<body>
	<table>
		<tr>
			<td><input type="file" name="jsonFile" id="jsonFile" ></input></td>
		</tr>
	</table>
</body>

</html>