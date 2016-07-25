<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.starryconn.weiyin.utils.PropertyUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/comm/res.jsp" %>
<script type="text/javascript" src="<%=base%>/plugins/jquery.fileDownload.js"></script>
<title>订单管理</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
<div id="content" style="width: 100%;">
	<table id="dg" title="订单管理" class="easyui-datagrid" style="width: auto;height:auto"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true"
            checkOnSelect="false"
            selectOnCheck="false"
            >
            <thead>
            	<tr>
            	    <th data-options="field:'ck',checkbox:true"></th>
            		<th data-options="field:'orderId',width:40">订单编号</th>
            		<th data-options="field:'orderTime',width:80">下单时间</th>
            		<th data-options="field:'orderStatus',width:40,formatter: orderStatus">状态</th>
            		<th data-options="field:'needPay',width:50, formatter: currencyFormatter">应付款</th>
            		<th data-options="field:'payedMoney',width:50, formatter: currencyFormatter">实付款</th>
            		<th data-options="field:'memberId',width:60,formatter: userName">用户名</th>
            		<th data-options="field:'tel',width:60,formatter: telFormatter">联系电话</th>
            		<th data-options="field:'address',width:80,formatter: address">配送地址</th>
            		<th data-options="field:'remarks',width:80">备注</th>
            	</tr>
            </thead>
    </table>
    </div>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="alterOrderStatus()">修改交易状态</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="alterAsDelivering()">标记为“配送中”</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="exportPrintableTicket()">导出打印小票</a>
        <div class="filter">
		   	订单编号：<input type="text" class="simple-textbox" style="width: 150px;" id="search-productid-text" placeholder="订单编号" />
	        <select id="cc" style="width:150px;">
	        </select>
		    <div id="sp" style="height: 150px;">
		    	<div style="color:#99BBE8;background:#fafafa;padding:5px;">请勾选要查询的订单状态</div>
		        <div style="padding:10px; height: 120px;">
		            <input type="checkbox" name="lang" data-text="已提交" value="0" checked="checked"><span>已提交</span><br/>
		            <input type="checkbox" name="lang" data-text="配送中" value="2" checked="checked"><span>配送中</span><br/>
		            <input type="checkbox" name="lang" data-text="配送结束" value="4" checked="checked"><span>配送结束</span><br/>
		            <input type="checkbox" name="lang" data-text="交易完成" value="7" checked="checked"><span>交易完成</span><br/>
		            <input type="checkbox" name="lang" data-text="已取消" value="9" checked="checked"><span>已取消</span><br/>
		        </div>
		    </div>
		    <a href="javascript:void(0);" style="margin-left:10px;" class="easyui-linkbutton" iconCls="icon-search" onclick="toQuery()">查询</a>
        </div>
        <div style="position: relative; top: 0px; right: 0px;">
        	<div style="position: absolute; top: -48px; right: 10px;">
        	<a href="javascript: listNewOrder();" style="color: black;">未处理&nbsp;<span style="color: green; font-weight: bold;" id="new-order-count">0</span>&nbsp;份订单</a>
        	</div>
        </div>
    </div>
<script type="text/javascript" src="<%=base%>/inc/js/administration/datagrid-detailview.js"></script>
<script type="text/javascript">
var base = "<%=base %>";
var $dg = null;
$(document).ready(function() {
	$("#dg").datagrid("resize", {height: $(window).height() - 2, width: $(window).width()});
	$dg = $("#dg");
	renderOrderDetailPartion("<%=base%>/administration/order/list.do");
});
$(function(){
	registerResize("#dg");
});
$(function(){
    $('#cc').combo({
        required:true,
        editable:false
    });
    $('#sp').appendTo($('#cc').combo('panel'));
    /*
    $('#sp input').click(function(){
    	updateStatusSelection();
    });
    updateStatusSelection();
    */
    $("#cc").combo('setText', "订单状态");
    peekNewOrder();
    setInterval(peekNewOrder, <%=PropertyUtil.getMisProperty().get("order.peeknew")%> * 1000);
});
function currencyFormatter(val) {
	if (val != null && typeof(val) === "number")
		return val.toFixed(2);
	return "";
}
function exportPrintableTicket() {
	var rows = $('#dg').datagrid("getChecked");
	if (!rows)
		$.messager.alert("警告", "请选择一行数据");
	var orders = [];
	for (var i = 0; i < rows.length; i++) {
		orders.push(rows[i].orderId);
	}
	downloadPrintableTicket(orders);
}
function downloadPrintableTicket(orders) {
	 $.fileDownload("<%=base%>/administration/order/exportExcel.do", {
		 failCallback: function (responseHtml, url) {
			 //console.log(responseHtml);
			 var t = "\"msg\":\"";
			 var pos = responseHtml.indexOf(t);
			 if (pos != -1) {
				 var pos2 = responseHtml.indexOf("\"", pos + t.length);
				 var msg = responseHtml.substring(pos + t.length, pos2);
				 $.messager.alert("警告", msg);
			 }
         },
         data: {"orders": orders}
	 });
}
function listNewOrder() {
	if (parseInt($("#new-order-count").text()) > 0) {
		var option = $dg.datagrid("options");
	    option.queryParams.status = 0;
		$dg.datagrid("reload");
	}
}
function peekNewOrder() {
	$.ajax("<%=base%>/administration/order/peekNewOrder.do", {
		dataType: "json",
		success: function(json) {
			if (json)
				$("#new-order-count").text(json.obj);
		}
	});
}
function updateStatusSelection() {
	var $status_list =  $("#sp input:checked");
    var status_arr = $status_list;
    var html = "";
    for (var i = 0 ; i < status_arr.length; i++) {
    	if (html.length > 0)
    		html += ";";
    	html += $(status_arr[i]).attr("data-text");
    }
    $("#cc").combo('setText', html);
}
function alterAsDelivering() {
	var rows = $('#dg').datagrid("getChecked");
	if (!rows)
		$.messager.alert("警告", "请选择一行数据");
	var orders = [];
	for(var i = 0; i < rows.length; i++) {
		if (rows[i].orderStatus != '0') {
			$.messager.alert("警告", "只能标记状态为“已提交”的订单，订单编号为" + rows[i].orderId + "不能标记为“配送中”");
			return;
		}
		orders.push(rows[i].orderId);
	}
	$.ajax("<%=base%>/administration/order/delivering_flag.do", {
		dataType: "json",
		data: {"orders": orders},
		success: function(json) {
			if (json.success && json.success === true) {
				$.messager.confirm("提示", "标记成功，是否需要将其导出excel文件？", function(flag) {
					if (flag === true) {
						//导出excel文件
						downloadPrintableTicket(orders);
					}
				});
				$dg.datagrid("reload");
			}
		}
	});
}
function renderOrderDetailPartion(url) {

	$('#dg').datagrid({
        view: detailview,
	url: url,
	queryParams: {},
        detailFormatter:function(index,row){
            return '<div style="padding:2px"><table class="ddv"></table></div>';
        },
        onExpandRow: function(index,row){
            var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
            ddv.datagrid({
                url:'<%=base%>/administration/order/detail.do?orderId='+row.orderId,
                fitColumns:true,
                singleSelect:true,
                rownumbers:true,
                loadMsg:'',
                height:'auto',
                columns:[[
                    {field:'productName',title:'产品名称',width:200, formatter: productName},
                    {field:'productQuantity',title:'产品数量',width:100,align:'right'},
                    {field:'productPrice',title:'单价',width:100,align:'right', formatter: currencyFormatter},
                    {field:'productTotalPrice',title:'小计',width:100,align:'right', formatter: orderSingleTotalPrice}
                ]],
                onResize:function(){
                    $('#dg').datagrid('fixDetailRowHeight',index);
                },
                onLoadSuccess:function(){
                    setTimeout(function(){
                        $('#dg').datagrid('fixDetailRowHeight',index);
                    },0);
                }
            });
            $('#dg').datagrid('fixDetailRowHeight',index);
        }
    });
}
function orderStatus(val) {
	if (val == "0")
		return "<span style=\"color: green\">已提交</span>";
	else if (val == "2")
		return "配送中";
	else if (val == "4")
		return "配送结束";
	else if (val == "7")
		return "交易完成";
	else if (val == "9")
		return "已取消";
}
function orderSingleTotalPrice(val, row) {
	return (row.productQuantity * row.productPrice).toFixed(2);
}
function productName(val, row) {
	return row.product.productName;
}
function alterOrderStatus() {
	var row = $('#dg').datagrid("getSelected");
	if (row == null) {
		$.messager.alert("警告", "请选择一条记录");
		return;
	}
	$.dialog({
		title: "修改订单状态",
		content: "url:<%=base%>/administration/order/goUpdate.do?orderId=" + row.orderId,
		width: 400,
		height: 280,
		button: [
		         {
		        	 name: "修改",
		        	 focus: true,
		        	 callback: function() {
		        		 var dialog = this;
		        		 this.content.updateOrder(this, function(dialog) {
						$dg.datagrid("reload");
						return true;
		        		 });
		        		 return false;
		        	 }
		         }, 
		         {
		        	 name: "关闭"
		         }
		]
	});
}
function userName(val, row) {
	if (row && row.member)
	return row.member.memberName;
	return "";
}
function address(val, row) {
	if (row && row.member)
	return row.member.address;
	return "";
}
function searchOrder(val) {
	var option = $dg.datagrid("options");
	option.queryParams.orderId = val;
	$dg.datagrid("reload");
}
function toQuery() {
	var option = $dg.datagrid("options");
	var $productId = $("#search-productid-text");
	option.queryParams.orderId = $productId.val();
	var $status_list =  $("#sp input:checked");
    var status_arr = $status_list;
    var status = "";
    for (var i = 0 ; i < status_arr.length; i++) {
    	var val = $(status_arr[i]).val();
    	if (status.length > 0)
    		status += ",";
    	status += parseInt(val);
    }
    option.queryParams.status = status;
	$dg.datagrid("reload");
}
function telFormatter(val, row) {
	if (row && row.member && row.member.mobile)
		return row.member.mobile
	return "";
}
</script> 
</body>
</html>
