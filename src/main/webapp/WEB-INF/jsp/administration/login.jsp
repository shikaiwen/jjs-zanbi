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
<title>管理员登录</title>
<link href="<%=base%>/inc/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=base%>/inc/js/jquery.js"></script>
<script type="text/javascript" src="<%=base%>/inc/js/jquery.i18n.properties-1.0.9.js" ></script>
<script type="text/javascript" src="<%=base%>/inc/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="<%=base%>/inc/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=base%>/inc/js/md5.js"></script>
<script type="text/javascript" src="<%=base%>/inc/js/page_login.js?lang=zh"></script>
<!--[if IE]>
  <script src="resources/js/html5.js"></script>
<![endif]-->
<!--[if lte IE 6]>
	<script src="resources/js/DD_belatedPNG_0.0.8a-min.js" language="javascript"></script>
	<script>
	  DD_belatedPNG.fix('div,li,a,h3,span,img,.png_bg,ul,input,dd,dt');
	</script>
<![endif]-->
</head>
<body class="loginbody">
<div class="dataEye">
	<div class="loginbox">
		<div class="logo-a">
			<h2>微鹰溯源管理平台</h2>
			<c:if test="${requestScope[\"error\"] != null}"></c:if>
			<label style="color: red;">
			<c:out value="${requestScope[\"error\"]}"></c:out>
			</label>
		</div>
		<div class="login-content">
			<div class="loginbox-title">
				<h3>登录</h3>
			</div>
			<form id="signupForm" method="POST" action="<%=base%>/administration/login.do">
			<div class="login-error"></div>
			<div class="row">
				<!-- 
				<label class="field">用户名</label>
				 -->
				<input type="text" class="input-text-user input-click" placeholder="用户名" name="username" id="username">
				<div class="input-text-user-icon"></div>
			</div>
			<div class="row">
				<!-- 
				<label class="field">密码</label>
				 -->
				<input type="password" class="input-text-password input-click" placeholder="密码" name="password" id="password">
				<div class="input-text-password-icon"></div>
			</div>
			<div class="row btnArea">
				<a class="login-btn" id="submit">登录</a>
			</div>
			</form>
		</div>
	</div>
	
</div>
<div class="loading">
	<div class="mask">
		<div class="loading-img">
		<img src="<%=base %>/inc/imgs/loading.gif" width="31" height="31">
		</div>
	</div>
</div>
</body>
</html>