<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/comm/res.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<script type="text/javascript">

function save( dialog ,okcallback ){
//	alert(dialog);
//	 $(dialog).dialog("close");
	$("#fm").form('submit',{
		url:'<%=base%>/labelController/doAdd.do',
		onSubmit:function(){
			 openProgress(1,"正在执行保存操作...");
		   return true;
		},
		success:function(data){
			openProgress(0);
			var d = $.parseJSON(data);
			if(d.success == true){
				$.dialog.alert("保存成功", function(){
				okcallback(dialog)} );
			}else{
			  alert("保存失败");
			}
		}
	});	
}

//选择产品
function chooseProduct(){
    var data = {callback:function(datas){
    	$("#productId").val(datas['productId']);
    	$("#productName").val(datas['productName']);
    	$("#batchNo").val(datas['productBatchPrefix']);
    }};
 	$.dialog({
		title:'选择产品',
		content:"url:<%=base%>/administration/product/popProductForInventory.do",
		width:800,
		height:500,
		data:data,
	}); 
}

$(function(){
	$('#file_upload').uploadify({
	    'swf'      : '<%=base %>/plugins/uploadify/uploadify.swf',
	    'uploader' : '<%=base %>/labelController/uploadBackgroundImg.do',
	    'buttonText' : '上传图片',
	    'fileObjName': 'bgImg',
	    'onUploadSuccess':function(filename, data, response) {
	    	var d = $.parseJSON(data);
	    	if(d.success == true){
	    		$("#bgImg").val(d.attributes.filePath);
	    	}
	    }
	});
});



</script>
</head>
<body>        
   
      <form id="fm" method="post" >
          <table style="margin-top:20px; margin-bottom:20px;" width="90%" align="center" class="table" border="0" cellspacing="1" cellpadding="3">
            <tbody>
              <tr>
                <td class="td_lable" style="font-family: 微软雅黑">所属产品:</td>
                <td class="td_edit">
                <input type="hidden"  id="productId" name="productId"/>
                <input type="text"   id="productName" name="productName"/>
                <a  href="#" onclick="chooseProduct()"  iconCls="icon-search" class="easyui-linkbutton">选择</a>
                </td>
                <td class="td_lable" style="font-family: 微软雅黑">批次号：</td>
                <td class="td_edit"><input type="text" id="batchNo" name="batchNo"/></td>
              </tr>
              <tr>
              <td>背景图片:</td>
              	<td>
              		<input type="text"  name="bgImg" id="bgImg" value="" />
              		<input  id="file_upload" type="button" value="上传"></input>
              	</td>
              	<td></td>
              </tr>
            </tbody>
          </table>           
     </form>

</body>
</html>
