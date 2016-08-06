<!DOCTYPE HTML>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>WebSocket demo</title>
    <%
	String path = request.getContextPath();
    String url = request.getRequestURI().toString();
    //String username = url.substring(beginIndex, endIndex);
    
%>
<style>
body {padding: 40px;}
#outputPanel {margin: 10px;padding:10px;background: #eee;border: 1px solid #000;/* min-height: 300px; */}
</style>

<link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=path%>/jquery.js"></script>
<script src="<%=path %>/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>



  <nav class="navbar navbar-inverse" role="navigation" >
   <div class="navbar-header">
      <a class="navbar-brand"  style="font-size: 32px; color: white; " href="#">内外网调用工具</a>
   </div>
   
</nav>


<div class="container">
  

  
  
  <div class="form-group form-inline">
    <label for="">内网调用地址:</label>
    <input type="text" class="form-control"  id="setInurlInput" 
    value="127.0.0.1:8899/testn" 
    placeholder="调用内网地址"
    size="50"
     />
    <button  id="setInurlBtn"   type="button" class="btn btn-success">设置</button>
  </div>
  
  <div>
  <label>Websocket服务器交互信息:</label>
  <textarea id="msgPanel" class="form-control" rows="3" cols="100"></textarea>
</div>

<br>


<h2>收到的请求</h2>
<table id="dataTable" width="80%" class="table table-bordered">

	<tr id="headTr">
	
	<td width="16%">请求主机</td>
	<td width="8%">方法</td>
	<td width="60%">收到的数据</td>
	<td width="8%">操作</td>
	</tr>
	
	<tr id="hiddenTr" style="display:none;">
	<td width="16%"></td>
	<td width="8%"></td>
	<td width="60%"></td>
	<td width="8%">    
		<button name="inUrlBtn" onclick="invokeInUrl(this)" type="button" class="btn btn-success">调用本地</button>
	</td>
	</tr>
</table>
  
  
</div>


 
</body>
<script type="text/javascript">


	// 控制台输出对象
	var console = {
			log : function(text) {
				
				var oldVal = $("#msgPanel").val();
				if(oldVal){
					$("#msgPanel").val(oldVal + "\n" + text );
				}else{
					$("#msgPanel").val( text );
				}
			}};
	
$(function(){
	
	//点击事件
	$("#setInurlBtn").click(function(){
		
		var inurl = $("#setInurlInput").val();
		var data = "2:"+inurl;
		socket.send(data);
		
	});
	
	//获取连接
	window.WebSocket = window.WebSocket || window.MozWebSocket;
	if (!window.WebSocket) {	// 检测浏览器支持
		console.log('Error: WebSocket is not supported .');
		return;
	}
	
	host=(window.location.protocol == 'http:') ? 'ws://' : 'wss://' ;
	host += window.location.host + '<%=path%>/websocket/say';
	
	socket = new WebSocket(host); // 创建连接并注册响应函数
	socket.onopen = function(){
		//console.log("websocket is opened .");
		
		//将当前用户名发送到服务器端
		//username = window.location.href.substring(  window.location.href.lastIndexOf("/") + 1 );
		//socket.send( "1:" +  username );
		
		};
	
	
		
	
	//收到服务器发送的数据
	socket.onmessage = function(message) {
		var data = message.data;
		if(data.indexOf("_kp:") != 0){
			//非协议数据
			console.log(message.data);
			return;
		}
		data = data.replace("_kp:","")
		var arr = data.split(":");
		
		if(arr[0] == "1"){
			
			if(arr[1] == "1"){
			//	alert("添加成功");
			}else{
			//	alert("添加失败");
			}
		}
		
		if(arr[0] == "2"){
			
			if(arr[1] == "1"){
			//	alert("url添加成功");
			}else{
			//	alert("添加失败");
			}
			
		}
		
		if(arr[0] == "3"){
			
			handleReceivedData( data.substring(2) );
		}
		
		
		};
		
	socket.onclose = function(){
		console.log("websocket is closed .");
		socket = null; // 清理
	};
	
});
	
	
function handleReceivedData(data){
	
	var json = $.parseJSON(data);
	
	var tr = $("#hiddenTr").clone();
	var method = json.method;
	var host = json.host;
	var respStr = JSON.stringify(json.paramContent);
	$(tr).find("td").eq(0).html(host);
	$(tr).find("td").eq(1).html(method);
	$(tr).find("td").eq(2).html(respStr);
	$(tr).find("td").eq(3).find("[name=inUrlBtn]").attr("reqStr",json.reqBase64Str);
	
	$(tr).show();
	$(tr).appendTo($("#dataTable"));
}	
	
	
function invokeInUrl(btn){
	var reqStr = $(btn).attr("reqStr");
	socket.send("4:"+reqStr);
	
}	
</script>



</html>