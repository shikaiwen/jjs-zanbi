<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String base = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimun-scale=1.0">
<title>未找到产品信息</title>
<link rel="stylesheet"
	href="<%=base%>/plugins/jquery-mobile-1.4.3/jquery.mobile-1.4.3.min.css">
<link rel="stylesheet"
	href="<%=base%>/plugins/jquery-mobile-1.4.3/themes/dz_green/green.min.css">
<link rel="stylesheet"
	href="<%=base%>/plugins/jquery-mobile-1.4.3/themes/dz_green/jquery.mobile.icons.min.css">
<script src="<%=base%>/plugins/jquery.1.10.js"></script>
<script
	src="<%=base%>/plugins/jquery-mobile-1.4.3/jquery.mobile-1.4.3.min.js"></script>
<style type="text/css">
[data-role=page]{height: 100% !important; position:relative !important;}
[data-role=footer]{bottom:0; position:absolute !important; top: auto !important; width:100%;}
.tip {
	text-align: center;
}
.flag {
	flag: <c:out value="${requestScope[\"flag\"]}" />;/*2: inventory error, 1: not found*/
}
</style>
</head>
<body>
	<div data-role="page" id="pageone">
	  <div data-role="header" >
   <h1>提示信息</h1>
  </div>
		<h2 class="tip">未查询到产品信息！</h2>
		<div data-role="footer">
			<h6 style="padding-bottom: 0px; margin-bottom: 0px;">&copy;
				版权所有 湖南繁星物联网科技有限公司</h6>
			<h6 style="padding: 0px; margin: 0px;">微鹰溯源信息系统</h6>
			<div align="center"></div>
		</div>
	</div>
</body>
</html>