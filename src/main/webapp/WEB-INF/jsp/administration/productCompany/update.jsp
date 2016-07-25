<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/comm/res.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<script type="text/javascript">

function save( dialog ,okcallback ){
	$("#fm").form('submit',{
		url:'<%=base%>/productCompanyController/doUpdate.do',
		onSubmit:function(params){
			 openProgress(1,"正在执行保存操作...");
			 var html = ue.getContent();
			// params.companyDesc = html;
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
//	alertMsg("成功了");
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

</script>
</head>
<body>        
   
      <form id="fm" method="post" >
          <input type="hidden" id="cusId" name="companyId" value="<c:out value="${requestScope[\"company\"].companyId}"></c:out>" />
          <table style="margin-top:20px; margin-bottom:20px;" width="90%" align="center" class="table" border="0" cellspacing="1" cellpadding="3">
            <tbody>
              <tr>
                <td class="td_lable" style="font-family: 微软雅黑">公司名称:</td>
                <td class="td_edit">
                <input type="text"  id="companyName" name="companyName" value="<c:out value="${requestScope[\"company\"].companyName}"></c:out>" />
                </td>
              </tr>
              <tr>
                <td class="td_lable" style="font-family: 微软雅黑">公司网站:</td>
                <td class="td_edit"><input type="text" id="website" name="website" value="<c:out value="${requestScope[\"company\"].website}"></c:out>" /></td>
              </tr>   
              <tr>
                <td class="td_lable" style="font-family: 微软雅黑">网上商城:</td>
                <td class="td_edit"><input type="text" id="mall" name="mall" value="<c:out value="${requestScope[\"company\"].mall}"></c:out>" /></td>
              </tr>  
            </tbody>
          </table>
              <script id="container" name="companyDesc" type="text/plain"><c:out value="${requestScope[\"company\"].companyDesc}"></c:out></script>
     </form>
     
 <script type="text/javascript" src="<%=base%>/plugins/ueditor1_4_3/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=base%>/plugins/ueditor1_4_3/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container');
    </script>
</body>
</html>
