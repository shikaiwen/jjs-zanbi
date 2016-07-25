<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/comm/res.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<script type="text/javascript">

function save( dialog ,okcallback ){
	$("#fm").form('submit',{
		url:'<%=base%>/inventoryController/doUpdate.do',
		onSubmit:function(){
			 openProgress(1,"正在执行保存操作...");
		   return true;
		},
		success:function(data){
			openProgress(0);
			var d = $.parseJSON(data);
			if(d.success == true){
				$.dialog.alert("修改成功!",function(){
				okcallback(dialog);
				});
			}else{
			  showAlertTip("保存失败");
			}
		}
	});	
}

//选择产品
function chooseProduct(){
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
<body>        
   
      <form id="fm" method="post" >
          <table style="margin-top:20px; margin-bottom:20px;" width="90%" align="center" class="table" border="0" cellspacing="1" cellpadding="3">
            <tbody>
              <tr>
              
              <input type="hidden" name="inventoryId" id="inventoryId" value="${inventory.inventoryId}"/>
              
                <td class="td_lable" style="font-family: 微软雅黑">所属产品:</td>
                <td class="td_edit">
                <input type="hidden"  id="productId" name="productId" value="${inventory.product.productId}"/>
                <input type="text"  id="productName" name="productName" value="${inventory.product.productName}"/>
                <a  href="#" onclick="chooseProduct()"  iconCls="icon-search" class="easyui-linkbutton">选择</a>
                </td>
                <td class="td_lable" style="font-family: 微软雅黑">批次号：</td>
                <td class="td_edit"><input type="text" id="batchNo" name="batchNo" value="${inventory.batchNo}" /></td>
              </tr>
              <tr>
                <td class="td_lable" style="font-family: 微软雅黑">产品数量:</td>
                <td class="td_edit"><input type="text" id="quantity" name="quantity" value="${inventory.quantity}"/></td>
                <td class="td_lable" style="font-family: 微软雅黑">入库时间：</td>
                <td class="td_edit">
                
                	<input type="text" id="inTime" class="Wdate" disabled value="<fmt:formatDate value="${inventory.inTime}" pattern="yyyy-MM-dd HH:mm:ss" />" 
                	 onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'});"
                	name="inTime"/></td>
              </tr>   
              <tr>
                <td class="td_lable" style="font-family: 微软雅黑">生产日期:</td>
                <td class="td_edit">
                	<input type="text" id="produceDate" class="Wdate" value="<fmt:formatDate value="${inventory.produceDate}" pattern="yyyy-MM-dd" />" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});"
                	name="produceDate"/></td>
              </tr>
            </tbody>
          </table>           
     </form>

</body>
</html>
