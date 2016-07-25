<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${requestScope[\"suinfo\"] != null }">
	<%/*这里表示产品存在*/ %>
	<c:set value="${requestScope[\"suinfo\"].product.productTheme}" var="theme"></c:set>
	<jsp:include page="/WEB-INF/jsp/themes/${theme == null || theme == \"\" ? \"default\": theme}.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
	<%/*产品不存在*/ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产品不存在</title>
</head>
<body>

</body>
</html>
	</c:otherwise>
</c:choose>