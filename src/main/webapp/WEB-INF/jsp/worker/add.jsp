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
		url:'<%=base%>/worker/doAdd',
		onSubmit:function(){
			 openProgress(1,"正在执行保存操作...");
		   return true;
		},
		success:function(d){
			openProgress(0);
            var data = $.parseJSON(d)
			if(data.status == 'ok'){
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
          <input type="hidden" id="cusId" name="cus_id" />
          <table style="margin-top:20px; margin-bottom:20px;" width="90%" align="center" class="table" border="0" cellspacing="1" cellpadding="3">
            <tbody>

              <tr>
                <td class="td_lable" style="font-family: 微软雅黑">姓名:</td>
                <td class="td_edit"><input type="text" id="name" name="name"/></td>


                <%--<td class="td_lable" style="font-family: 微软雅黑">：</td>--%>
                	<%--<input type="text" id="inTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'});"--%>
                	<%--name="inTime"/></td>--%>
              </tr>

              <tr>
                  <td class="td_lable" style="font-family: 微软雅黑">所属组:</td>
                  <td class="td_edit">
                      <select id="orgSelect" name="orgId">
                          ${orgSelectHtml}
                      </select>
                  </td>
              </tr>

              <tr>
                  <td class="td_lable" style="font-family: 微软雅黑">角色:</td>
                  <td>
                      <select id="roleSelect" name="roleId">
                          ${roleSelectHtml}
                      </select>
                  </td>
              </tr>

            </tbody>
          </table>           
     </form>

</body>
</html>
