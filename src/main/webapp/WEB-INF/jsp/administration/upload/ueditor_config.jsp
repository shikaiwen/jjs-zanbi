<%@ page language="java" contentType="text/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String base = request.getContextPath();
int type = 0x00020001;
%>
{
	"imageActionName": "pdescupload",
	"imageFieldName": "file",
	"imageMaxSize": 8192000,
	"imageAllowFiles": [".png", ".jpg", ".jpeg", ".gif", ".bmp"],
	"imageCompressEnable": true,
	"imageCompressBorder": 1600,
	"imageInsertAlign": "none",
	"imageUrlPrefix": "<%=base %>",
	"imagePathFormat": "/image/{yyyy}/{filename}"
}