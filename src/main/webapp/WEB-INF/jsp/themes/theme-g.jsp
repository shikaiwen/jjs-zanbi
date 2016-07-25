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
<script src="<%=base%>/plugins/jquery.1.10.js"></script>
<link rel="stylesheet"
	href="<%=base%>/plugins/jquery-mobile-1.4.3/jquery.mobile-1.4.3.min.css">
<link rel="stylesheet" href="<%=base%>/inc/themes/default/css/shop.css">
<link rel="stylesheet" href="<%=base%>/inc/themes/default/css/index.css">
<script
	src="<%=base%>/plugins/jquery-mobile-1.4.3/jquery.mobile-1.4.3.min.js"></script>
<link rel="stylesheet"
	href="<%=base%>/plugins/aui-artDialog/css/ui-dialog.css">
<link rel="stylesheet"
	href="<%=base%>/plugins/jquery-mobile-1.4.3/colors/green/green.min.css">
	<link rel="stylesheet"
	href="<%=base%>/plugins/jquery-mobile-1.4.3/colors/green/jquery.mobile.icons.min.css">
<script type="text/javascript"
	src="<%=base%>/plugins/aui-artDialog/dist/dialog-min.js"></script>
<link rel="stylesheet"
	href="<%=base%>/plugins/font-awesome-4.2.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=base%>/inc/themes/default/css/dialog.css">
<script src="<%=base%>/inc/themes/default/js/index.js"
	type="text/javascript"></script>
<script src="<%=base%>/plugins/jnotify/jNotify.jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=base%>/plugins/jnotify/jNotify.jquery.css" />
<title><c:out value="${requestScope[\"title\"] }" /></title>
</head>
<body>
	<div data-role="page" id="pageone">
		<div id="content"></div>
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
									value="${requestScope[\"suinfo\"].inventory.produceDate}" /></span>
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
								value="${requestScope[\"suinfo\"].product.productViewTimes}" /></span></li>
					<li>
						<!-- 
						<div align="center" class="custom-btn-group">
						    <div class="ui-btn ui-input-btn ui-shadow btn-inline-block common-btn">
							<a id="validateBtn" data-role="button" style="font-size: 0.8em">验证真伪</a>
							</div>
							<span class="btn-separator"></span>
							<div class="ui-btn ui-input-btn ui-shadow btn-inline-block common-btn">
							<a id="juboBtn" data-role="button" style="font-size: 0.8em">投诉举报</a>
							</div>
							<span class="btn-separator"></span>
							<div class="ui-btn ui-input-btn ui-shadow btn-inline-block common-btn">
							<a id="withbtnBtn" data-role="button" style="font-size: 0.8em">信息反馈</a>
							</div>
						</div>
						-->
					</li>

				</ul>
			</div>
			<div class="ui-grid-a">
			  <div class="ui-block-b"><img alt="" width="120" height="150" src="<%=base%><c:out value="${requestScope[\"suinfo\"].product.productPortrait}" />"/></div>
			</div>
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
			<div data-role="collapsible" data-collapsed="false">
				<h3>开心-玩的开心</h3>
				<ul data-role="listview">
					<li><a href="http://www.duopao.com/" rel="external"> <img
							src="<%=base%>/inc/themes/default/imgs/gaming_1.png">
							<h2>小游戏</h2>
					</a></li>
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
					<li><a id="accumulate-credit"> <img alt=""
							src="<%=base%>/inc/themes/default/imgs/credit_card.png">
							<h2>累计积分</h2>
							<p style="white-space: normal;">
								&nbsp;&nbsp;&nbsp;关于积分：每包槟榔有有一次积分的机会，点击累计积分，输入您的手机号和上方刮刮卡内的数字就可以完成积分，
								积分满500分就可以再来一包哦！</p>
					</a></li>
				</ul>
			</div>
			<div data-role="collapsible" data-collapsed="false" >
				<h3><c:out value="${requestScope[\"suinfo\"].company.companyName}" /></h3>
				<c:out value="${requestScope[\"suinfo\"].company.companyDesc}" escapeXml="false" />
			</div>
			
			<div data-role="footer">
				<h6 style="padding-bottom: 0px; margin-bottom: 0px;">&copy;
					版权所有 繁星物联网科技有限公司</h6>
				<h6 style="padding: 0px; margin: 0px;">微鹰溯源信息系统</h6>
				<div align="center"></div>
			</div>
			
			<!-- 输入刮刮卡号  -->
			<div data-role="popup" id="pagescrab-popup" data-overlay-theme="a"
				data-tolerance="15,15">
				<a href="#" data-rel="back" data-role="button" data-theme="a"
					data-icon="delete" data-iconpos="notext"
					class="ui-btn-right ui-btn ui-shadow ui-btn-corner-all ui-btn-icon-notext ui-btn-up-a"
					data-corners="true" data-shadow="true" data-iconshadow="true"
					data-wrapperels="span" title="Close"><span
					class="ui-btn-inner ui-btn-corner-all"><span
						class="ui-btn-text">Close</span><span
						class="ui-icon ui-icon-delete ui-icon-shadow">&nbsp;</span></span></a>
				<div style="padding: 10px 20px;" id="scan-code-content">
					<h3>请先输入刮刮卡号然后进入抽奖活动:</h3>
					<label for="un" class="ui-hidden-accessible">刮刮卡号:</label>
					<div>
						<input type="text" name="scrabcode" id="scrabcode" value=""
							placeholder="刮刮卡号">
					</div>
					<button data-role="button"
						onclick="validateScrabCode(this, '<%=base%>/themes/default/choujiang/index.jsp');"
						id="scrabcode-input"
						style="width: 144px; margin-left: auto; margin-right: auto;">进入抽奖活动</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>