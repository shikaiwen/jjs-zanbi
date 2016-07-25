<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String base = request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimun-scale=1.0">
<link rel="stylesheet"
	href="<%=base%>/plugins/jquery-mobile-1.4.3/jquery.mobile-1.4.3.min.css">
<link rel="stylesheet"
	href="<%=base%>/plugins/jquery-mobile-1.4.3/themes/dz_green/green.min.css">
<link rel="stylesheet"
	href="<%=base%>/plugins/jquery-mobile-1.4.3/themes/dz_green/jquery.mobile.icons.min.css">
<link rel="stylesheet"
	href="<%=base%>/plugins/aui-artDialog/css/ui-dialog.css">
<link rel="stylesheet"
	href="<%=base%>/plugins/font-awesome-4.2.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=base%>/inc/themes/default/css/dialog.css">
<link rel="stylesheet"
	href="<%=base%>/inc/themes/default/css/commons.css">
<script src="<%=base%>/plugins/jquery.1.10.js"></script>
<script src="<%=base%>/inc/themes/default/js/commons.js"
	type="text/javascript"></script>
<script
	src="<%=base%>/plugins/jquery-mobile-1.4.3/jquery.mobile-1.4.3.min.js"></script>
<script type="text/javascript"
	src="<%=base%>/plugins/aui-artDialog/dist/dialog-min.js"></script>
<script src="<%=base%>/inc/themes/default/js/index.js"
	type="text/javascript"></script>
<title><c:out value="${requestScope[\"title\"] }" /></title>
<style type="text/css">
.ui-collapsible-inset, .ui-collapsible-set {
	margin: 0;
}
.ui-content {
	padding: 0;
}
.separator {
	height: 10px;
}
.p2 .ui-collapsible-content {
	padding-left: 0;
	padding-right: 0;
}
.txt-required {
	border-color: red!important;
}
</style>
</head>
<body>
	<div data-role="page" id="pageone">
		<div data-role="header" >
		   <h1><c:out value="${requestScope[\"suinfo\"].product.productName}" /></h1>
		</div>
		<div class="separator"></div>
		<!-- Content -->
		<div data-role="content">
			<div data-role="collapsible" data-collapsed="false">
				<h3>产品信息</h3>
				<ul data-role="listview">
					<li><div>
							<span><strong>产品名称:</strong> <c:out
									value="${requestScope[\"suinfo\"].product.productName}" /></span>
						</div></li>
					<li><div>
							<span><strong>生产日期:</strong> <fmt:formatDate type="date"
									value="${requestScope[\"suinfo\"].inventory.produceDate}" pattern="yyyy-MM-dd" /></span>
						</div></li>
						<li><div>
							<span><strong>生产企业:</strong> <c:out
									value="${requestScope[\"suinfo\"].company.companyName}" /></span>
						</div></li>
					<li><div>
							<span><strong>保质期:</strong> <c:out
									value="${requestScope[\"suinfo\"].product.guaranteePeriodDesc}" /></span>
						</div></li>
					<li><span><strong>价格:</strong>￥<fmt:formatNumber
								type="number" minFractionDigits="2" maxFractionDigits="2"
								value="${requestScope[\"suinfo\"].product.productPrice}" /></span></li>
					<li><span><strong>查询次数:</strong> <c:out
								value="${requestScope[\"suinfo\"].suViewTimes}" /></span></li>
					<li>
						<div align="center" class="custom-btn-group">
						    
							<a id="validateBtn" data-role="button" data-rel="popup" href="#validationPopup" style="font-size: 0.8em; display: inline-block; padding: 10px 20px;">验证真伪</a>
							<!-- pupop page -->
							<div data-role="popup" id="validationPopup" style="padding: 10px;">
								<a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
							  	<p>请输入刮刮卡号：</p>
							  	<input type="text" placeholder="刮刮卡号" id="validcode-text" />
							  	<div style="text-align: right;">
							  		<a data-role="button" onclick="validateTrigger()" style="font-size: 0.8em; display: inline-block; padding: 10px 20px;">验证</a>
							  	</div>
							</div>
							<!-- 
							<span class="btn-separator"></span>
							<div class="ui-btn ui-input-btn ui-shadow btn-inline-block common-btn">
							<a id="juboBtn" data-role="button" style="font-size: 0.8em">投诉举报</a>
							</div>
							<span class="btn-separator"></span>
							<div class="ui-btn ui-input-btn ui-shadow btn-inline-block common-btn">
							<a id="withbtnBtn" data-role="button" style="font-size: 0.8em">信息反馈</a>
							</div>
							 -->
						</div>
					</li>

				</ul>
			</div>
			<div class="separator"></div>
			<div class="ui-grid-a">
			  <div class="ui-block-b" style="width: 100%; text-align: center;"><img alt="" style="max-width: 180px; max-height: 260px;" src="<%=base%><c:out value="${requestScope[\"suinfo\"].product.productPortrait}" />"/></div>
			</div>
			<div class="separator"></div>
			<c:choose>
				<c:when test="${requestScope[\"table\"] != null}">
					<div data-role="collapsible" data-collapsed="false" class="p2">
						<h3>溯源信息</h3>

						<table data-role="table" id="table-custom-2" data-mode="column"
							class="ui-body-d ui-shadow table-stripe ui-responsive"
							data-column-btn-theme="b" data-column-popup-theme="c">
							<thead>
								<tr class="ui-bar-d">
									<c:forEach var="column"
										items="${requestScope[\"table\"].table.columnDescriptions}">
										<th data-priority="1"><c:out value="${column.label}" /></th>
									</c:forEach>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row"
									items="${requestScope[\"table\"].table.rows}">
									<tr>
										<c:forEach var="cell" items="${row.cells}">
											<td><c:out value="${cell.value.value}" /></td>
										</c:forEach>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:when>
			</c:choose>
			<div class="separator"></div>
			<div data-role="collapsible" data-collapsed="false">
				<h3>开心-玩的开心</h3>
				<ul data-role="listview" data-theme="b">
					
					<li><a href="http://www.duopao.com/" rel="external"> <img
							src="<%=base%>/inc/themes/default/imgs/gaming_1.png">
							<h2>小游戏</h2>
					</a></li>
					<!-- 
					<li><a href="#"
						onclick="checkWinLottery(this, '<c:out value="${param.q}" />', '<%=base%>/vvc.do');">
							<img src="<%=base%>/inc/themes/default/imgs/present_1.png">
							<h2>抽奖活动</h2>
					</a></li>
					<li><a href="./hong_bao.jsp" rel="external"> <img
							src="<%=base%>/inc/themes/default/imgs/hong_bao.jpg">
							<h2>抢红包</h2>
							<p>百万红包等你抢哦！</p>
					</a></li>
					-->
					<li><a id="accumulate-credit" href="#scorePopup" data-rel="popup"><img alt=""
							src="<%=base%>/inc/themes/default/imgs/credit_card.png">
							<h2>累计积分</h2>
							<p style="white-space: normal;">
								&nbsp;&nbsp;&nbsp;关于积分：每个产品有一次积分的机会，点击累计积分，输入您的手机号和刮刮卡内的数字就可以完成积分，积分越多，福利越多^_^！</p>
					</a></li>
					<!-- pupop page -->
					<div data-role="popup" id="scorePopup" style="padding: 10px;">
						<a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
					  	<p>请输入手机号：</p>
					  	<input type="text" placeholder="手机号" id="score-mobile-text" />
					  	<p>请输入刮刮卡号：</p>
					  	<input type="text" placeholder="刮刮卡号" id="score-validcode-text" />
					  	<div style="text-align: right;">
					  		<a data-role="button" onclick="scoreTrigger()" style="font-size: 0.8em; display: inline-block; padding: 10px 20px;">马上积分</a>
					  	</div>
					</div>
				</ul>
			</div>
			<div class="separator"></div>
			<div data-role="collapsible" data-collapsed="false" >
				<h3>公司信息</h3>
				<c:out value="${requestScope[\"suinfo\"].company.companyDesc}" escapeXml="false" />
			</div>
			<div class="separator"></div>
			<div data-role="footer">
				<h6 style="padding-bottom: 0px; margin-bottom: 0px;">&copy;
					版权所有 湖南繁星物联网科技有限公司</h6>
				<h6 style="padding: 0px; margin: 0px;">微鹰溯源信息系统</h6>
				<div align="center"></div>
			</div>
		</div>
	</div>
	

<script type="text/javascript">
var t = 3000;
function validateTrigger() {
	var $validCodeText = $("#validcode-text");
	var vc = $validCodeText.val().trim();
	if (vc.length == 0) {
		$validCodeText.parent().addClass("txt-required");
		$validCodeText.focus();
	} else {
		$validCodeText.parent().removeClass("txt-required");
		window.code = vc;
		$("#validationPopup").popup("close");
		validateRequest();
	}
}
function scoreTrigger() {
	var $scoreMobileText = $("#score-mobile-text");
	var $scoreValidatecode = $("#score-validcode-text");
	var vc = $scoreMobileText.val().trim();
	var tc = $scoreValidatecode.val().trim();
	var flag = 0
	if (vc.length == 0) {
		$scoreMobileText.parent().addClass("txt-required");
		$scoreMobileText.focus();
	} else {
		$scoreMobileText.parent().removeClass("txt-required");
		window.jimobile = vc;
		flag++;
	}
	if (tc.length == 0) {
		$scoreValidatecode.parent().addClass("txt-required");
		$scoreValidatecode.focus();
	} else {
		$scoreValidatecode.parent().removeClass("txt-required");
		window.jicode = tc;
		flag++;
	}
	
	if (flag == 2) {
		$("#scorePopup").popup("close");
		scoreRequest();
	}
}
function validateRequest() {
	var wd = waitingDialog();
	wd.showModal();
	$.ajax("<%=base%>/v.do", {
		data: {"q": "<c:out value="${requestScope[\"q\"]}" />", code: code},
		dataType: "json",
		success: function(json) {
			wd.close();
			var html = "";
			if (json && typeof(json.success) !== "undefined") {
				if (json.success === true) {
					html = '<div><i class="fa fa-check" style="color: rgb(0, 255, 23);"></i>&nbsp;该产品为正品</div>';
				} else {
					html = '<div><i class="fa fa-cross" style="color: rgb(255, 0, 0);"></i>&nbsp;该产品不是正品</div>';
				}
				var d = dialog({
					content: html,
					quickClose: true
				});
				$(d.node).addClass("dialog-theme-b");
				d.showModal();
				setTimeout(function() {
					try {
						d.close().remove();
					} catch(e) {}
				}, t);
			}
		}
	});
}
$(document).ready(function() {
	/*
	$("#validateBtn").bind("click", function() {
		$.mydialog({
		    title: '产品验证',
		    content: '<input type="text" placeholder="刮刮卡号" style="width: 100%;height: 28px;border: 1px solid rgb(203, 203, 203);border-radius: 4px;font-size: 20px;color: gray;" />' +
		    '<span style="color:red;visibility: hidden;">请输入刮刮卡号</span>',
		    width: 280,
		    okValue: "验证",
		    ok: function () {
		    	var $p = $(d.node);
		    	var $inp = $p.find("input");
		    	if ($inp.val().trim().length == 0) {
			    	$p.find("span").css("visibility", "visible");
			    	return false;
		    	}
		    	code = $inp.val().trim();
		    	d.removeEventListener("close", validateRequest);
		    	d.addEventListener("close", validateRequest);
		    }
		}).width(240).showModal();
	});
	*//*
	$("#accumulate-credit").bind("click", function() {
		var d = dialog({
		    title: '积分活动',
		    content: '<input type="text" placeholder="手机号" style="width: 100%;height: 28px;border: 1px solid rgb(203, 203, 203);border-radius: 4px;font-size: 20px;color: gray;" />' +
		    '<span style="color:red;visibility: hidden;">请输入手机号</span>',
		    okValue: "验证",
		    ok: function () {
		    	var $p = $(d.node);
		    	var $inp = $p.find("input");
		    	if ($inp.val().trim().length == 0) {
			    	$p.find("span").css("visibility", "visible");
			    	return false;
		    	}
		    	window.jimobile = $inp.val().trim();
		    	d.removeEventListener("close", scoreRequest);
		    	d.addEventListener("close", scoreRequest);
		    }
		});
		d.width(240);
		d.showModal();
	});*/
});
function scoreRequest() {
	var wd = waitingDialog();
	wd.showModal();
	$.ajax("<%=base%>/score.do", {
		data: {"q": "<c:out value="${requestScope[\"q\"]}" />", mobile: jimobile, "validatecode": jicode},
		dataType: "json",
		success: function(json) {
			wd.close();
			var html = "";
			if (json && typeof(json.success) !== "undefined") {
				if (json.success === true) {
					html = '<div><i class="fa fa-check" style="color: rgb(0, 255, 23);"></i>&nbsp;' + json.msg + '</div>';
				} else if (json.msg != null){
					html = '<div><i class="fa fa-cross" style="color: rgb(255, 0, 0);"></i>&nbsp;' + json.msg + '</div>';
				} else
					html = '<div><i class="fa fa-cross" style="color: rgb(255, 0, 0);"></i>&nbsp;操作异常</div>';
				var d = dialog({
					content: html,
					quickClose: true
				});
				$(d.node).addClass("dialog-theme-b");
				d.showModal();
				setTimeout(function() {
					try {
						d.close().remove();
					} catch(e) {}
				}, t);
			}
				
		}
	});
}
</script>
</body>
</html>