<%@page import="java.util.Date" %>
<% 
String base = request.getContextPath();
%>

<!-- jQuery -->
<%-- <script src="<%=base%>/plugins/jquery-1.8.3.min.js"></script> --%>


<script src="<%=base%>/comm/js/jquery-1.11.0.min.js"></script>

<!-- lhgdialog -->
<link rel="stylesheet" type="text/css" href="<%=base%>/plugins/lhgDialog/skins/default.css"/>
<script src="<%=base%>/plugins/lhgDialog/lhgdialog.min.js"></script>

<!-- easyui -->
<link rel="stylesheet" type="text/css" href="<%=base%>/plugins/jquery-easyui-1.4.1/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=base%>/plugins/jquery-easyui-1.4.1/themes/icon.css"/>
<script src="<%=base%>/plugins/jquery-easyui1.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=base %>/plugins/jquery-easyui1.3/locale/easyui-lang-zh_CN.js"></script>

<!-- Date picker-->
<script src="<%=base%>/plugins/My97DatePicker/WdatePicker.js"></script>

<!-- uploadify -->
<link rel="stylesheet" type="text/css" href="<%=base%>/plugins/uploadify/uploadify.css"/>
<script src="<%=base%>/plugins/uploadify/jquery.uploadify.js?t=<%=new Date().getTime()%>"></script>

<!-- tools  -->
<script type="text/javascript" src="<%=base%>/comm/js/easyui_utils.js"></script>


<!-- self js  -->
<script type="text/javascript" src="<%=base%>/comm/js/resizeDg.js"></script>
<script type="text/javascript" src="<%=base%>/comm/js/comm.js"></script>
