<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/comm/res.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<script type="text/javascript">

function save( dialog ,okcallback ){
	$("#fm").form('submit',{
		url:'<%=base%>/labelController/saveDesign.do',
		onSubmit:function(){
			 openProgress(1,"正在执行保存操作...");
		   return true;
		},
		success:function(data){
			openProgress(0);
			var d = $.parseJSON(data);
			if(d.success == true){
				$.dialog.alert("保存成功", function(){
				okcallback(dialog)} );
			}else{
			  alert("保存失败");
			}
		}
	});	
}



var currentQr = null;
var draggable = false;
$(function(){
/*  	currentQr = document.getElementById("cur");
	
	
	$(currentQr).bind("mousedown",function(e){
		draggable = !draggable;
		//将 当前点距离二维码左边距spanx 和上边距spany记录下来
		window.spanX = e.pageX - currentQr.offsetLeft;
		window.spanY = e.pageY - currentQr.offsetTop;
	});
	
	$(currentQr).bind("mousemove",function(e){
		if(draggable){
			var pageX = e.clientX;
			var pageY = e.clientY;
			currentQr.style.left = pageX - window.spanX;
			currentQr.style.top = pageY - window.spanY;
		}
		
	});
	return;  */
	
	
	//获取二维码
	$("#getQrCode").bind("click",function(){
		var data = {
				"qrContent":$("#qrContent").val(),
				"qrWidth":$("#qrWidth").val(),
				"qrHeight":$("qrHeight").val()
		};
		
		if(currentQr){
			$(currentQr).remove();
		}
		var timeStr = new Date().getTime();
		var src = "<%=base%>/labelController/getQrCode.do?qrContent="+$("#qrContent").val()+"&qrWidth="+$("#qrWidth").val() +"&qrHeight="+$("#qrHeight").val()+"&timeStr="+timeStr;
		
		var img = $("<img id='qr'></img>").attr("src",src);
		img.appendTo( $(".workdiv") );
		
		currentQr = document.getElementById("qr");
		$(currentQr).addClass("qrcode");
		
		$(currentQr).bind("mousedown",function(e){
			draggable = !draggable;
			//将 当前点距离二维码左边距spanx 和上边距spany记录下来
			window.spanX = e.pageX - currentQr.offsetLeft;
			window.spanY = e.pageY - currentQr.offsetTop;
		});
		
		$(currentQr).bind("mousemove",function(e){
			if(draggable){
				currentQr.style.left =  e.clientX - window.spanX;
				currentQr.style.top = e.clientY - window.spanY;
				
				//更新状态栏
				var qrLabelLeft = e.clientX - window.spanX - workDiv.offsetLeft; 
				var qrLabelTop = e.clientY - window.spanY - workDiv.offsetTop;
				$("#qrStartX").val(qrLabelLeft);
				$("#qrStartY").val(qrLabelTop);
			}
		});
	});
});

</script>
</head>

<style>
	.qrcode{
		position:absolute;
	}
	#cur{
	position:absolute;
	}
</style>

<style>
.workdiv{
	margin-left:20px;
	margin-top:10px;
	width:400;
	height:400;
	background: white url('<%=base%>/${label.bgImg}') no-repeat;
}

</style>
<script>
$(function(){
	
	$("#workDiv").click(function(e){
		var left = e.pageX - workDiv.offsetLeft;
		var top = e.pageY - workDiv.offsetTop;
		$("#validStartX").val(left);
		$("#validStartY").val(top);
	});
});
</script>
<body>        
   
      <form id="fm" method="post" >

<div>
<div>
	<table>
		<tr>
			<td>二维码内容<input id="qrContent" value="http://localhost:8080/weiyin/labelController/goDesign.do?labelId=2par22222" type="text" style="width:200px;"></input>
			长:<input size="3" id="qrHeight" name="qrHeight" type="text" value="${label.qrHeight}" />
			宽: <input id="qrWidth" name="qrWidth" value="${label.qrWidth}"  type="text" size="3"/>
			&nbsp;<input type="button" id="getQrCode" value="获取二维码" />	
			</td>
		</tr>
	</table>
</div>
	<input type="hidden" name="labelId" value="${label.labelId}"/>

	<div id="left" style="float:left;width:600px;height:500px;background-color:gray;">
		<div id="workDiv" class="workdiv">
			<%-- <img id="cur" src="<%=base%>/upload/getQrCode.ds" /> --%>
		</div>
	</div>
	<div id="right" style="width:100px;float:left;">
		<table>
			<tr>
				<td>左边距:<input size="3" name="qrStartX" id="qrStartX" value="${label.qrStartX }" type="text" value=""/></td>
			</tr>
			<tr>
				<td>上边距:<input size="3" name="qrStartY" id="qrStartY"  value="${label.qrStartY }" type="text" value=""/></td>
			</tr>
			
			<tr>
				<td>验证码左边距:<input size="3" name="validStartX" value="${label.validStartX }" id="validStartX" type="text" value=""/></td>
			</tr>
			<tr>
				<td>验证码上边距:<input size="3" name="validStartY" value="${label.validStartY }"  id="validStartY" type="text" value=""/></td>
			</tr>
		</table>
	</div>
</div>






        
     </form>

</body>
</html>
