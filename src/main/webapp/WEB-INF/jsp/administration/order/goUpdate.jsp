<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/comm/res.jsp" %>
<title>修改订单状态</title>
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
		<div class="ftitle">订单状态</div>
		<form id="fm" method="post">
			<input type="hidden" name="orderId" value="<c:out value= "${requestScope[\"order\"].orderId}" />" />
			<div class="fitem">
				<label>订单编号：</label>
				<label><c:out value="${requestScope[\"order\"].orderId }" /></label>
			</div>
			<div class="fitem">
				<label>应付款：</label>
				<label><fmt:formatNumber value="${requestScope[\"order\"].needPay }" pattern="0.00" /></label>
			</div>
			<div class="fitem">
				<label>实付款：</label>
				<input name="payedMoney" id="payedMoneyText" value="<fmt:formatNumber value="${requestScope[\"order\"].payedMoney }" pattern="0.00" />" />
			</div>
			<div class="fitem">
				<label>状态：</label>
				<select name="orderStatus" id="orderStatusSelection">
					<option value="0" <c:if test="${requestScope[\"order\"].orderStatus==\"0\"}">selected</c:if>>已提交</option>
					<option value="2" <c:if test="${requestScope[\"order\"].orderStatus==\"2\"}">selected</c:if>>配送中</option>
					<option value="4" <c:if test="${requestScope[\"order\"].orderStatus==\"4\"}">selected</c:if>>配送结束</option>
					<option value="7" <c:if test="${requestScope[\"order\"].orderStatus==\"7\"}">selected</c:if>>交易完成</option>
					<option value="9" <c:if test="${requestScope[\"order\"].orderStatus==\"9\"}">selected</c:if>>已取消 </option>
				</select>
			</div>
			<div class="fitem">
				<label>备注：</label>
				<textarea name="remarks" style="width: 342px;height: 50px;"><c:out value="${requestScope[\"order\"].remarks}" /></textarea>
			</div>
		</form>
</div>
<script type="text/javascript">
var oldOrderStatus = <c:out value="${requestScope[\"order\"].orderStatus}" /> ;
var needPay = "<fmt:formatNumber value="${requestScope[\"order\"].needPay }" pattern="0.00" />";
var payed = "";
$(document).ready(function() {
	payed = $("#payedMoneyText").val();
	$("#orderStatusSelection").bind("change", function() {
		var $this = $(this);
		if ($this.val() == "4" || $this.val() == "7") {
			if ($("#payedMoneyText").val().length == 0)
				$("#payedMoneyText").val(needPay);
		} else if (payed.length == 0)
			$("#payedMoneyText").val("");
	});
});
function updateOrder(dialog, callback) {
	var $fm = $("#fm");
	var fm = $fm[0];
	if ($(fm["orderStatus"]).val() == 9) {
		if ($(fm["remarks"]).val().trim().length == 0) {
			$.messager.alert("警告", "订单取消时需要输入备注信息");
			return;
		}
	}

	if ($(fm["orderStatus"]).val() != oldOrderStatus) {
		$.messager.confirm("请确认", "您确定要更新订单状态吗？", function(r) {
				if (r) {
					submitForm(dialog, callback);
				}
				});
	} else
		submitForm(dialog, callback);
}
function submitForm(dialog, callback) {
					$("#fm").form('submit',{
						url:'<%=base%>/administration/order/doUpdate.do',
						onSubmit:function(){
							 openProgress(1,"正在执行保存操作...");
						   return true;
						},
						success:function(data){
							openProgress(0);
							var d = $.parseJSON(data);
							if(d.success == true){
							dialog.close();
								$.dialog.alert("修改成功!",function(){
								});
								if (callback)
									callback(dialog);
									} else if (d.msg) {
										$.messager.alert("警告", d.msg);
									}
									else{
							  showAlertTip("保存失败");
							}
						}
					});

}
</script>
</body>
</html>
