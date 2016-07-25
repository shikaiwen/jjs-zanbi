
//创建dialog
function createDialog(id,url,title,okcallback,width,height){
	
	var dialog = null;
	
	var parentWindow = $(window);
	var dialogDiv = $("<div id='"+id+"'></div>");
	
	if(!title){
		title = "信息";
	}
	if(!width){
		width = 800;
	}
	if(!height){
		height = 400;
	}
	
	//$(parentWindow).append( $(dialogDiv) );
	$(dialogDiv).appendTo( document.documentElement );
	
	dialog = $(dialogDiv).dialog({
		title:title,
		width:width,
		height:height,
		modal:true,
		resizable:true,
		content: '<iframe src="' + url + '" width="100%" height="100%" frameborder="0"></iframe>',
		onLoad:function(){
/*			if(callback && typeof(callback) == "function" ){
				callback();
			}*/
		},
		buttons: [{
			iconCls: 'icon-ok',
			text:"确定",
			handler: function(){

				var win = getDialogIframeWindow(dialog);
				if(typeof(win.save) == "function"){
						win.save(dialog,okcallback);
				}
				
				//如果如果有回调，则回调主窗口的方法
				if(okcallback && typeof(okcallback) == "function" ){
				//	okcallback(dialog);
				}
			}
		},{
			iconCls: 'icon-cancel',
			text:"取消",
			handler: function(){
				$(dialog).dialog("close");
			}
		}]
	});
	return dialog;
}

//获取easyui中dialog的iframe的window对象
function getDialogIframeWindow(dialog){
	var win = null;
	try{
		win = $(dialog).find("iframe").get(0).contentWindow;
	}catch(e){
		//所有异常均不处理，直接返回
	}
	return win;	
}


//进度条 param:是否显示(1显示0关闭),进度条显示的内容(不填或者填""则显示默认值)
function openProgress(_openprogress,_msg){

	if(_openprogress){
		if(_msg=="" || typeof(_msg) =="undefined") _msg = "正在处理中...";
		$.messager.progress({
			title:'请稍等',
			msg:_msg,
			text:"",
			interval:100
		});
	}else{
		//setTimeout("$.messager.progress('close')",0);  //此处不用setTimeout调用IE6会报JS,暂不知为何
		$.messager.progress('close');
	}
}

//show message , the param data is the one send from data
function showMsg(data){
	$.messager.show({
		title:' ',
	    msg: data,
	    timeout:2000
	});
}


//get all input data 
function getAllInputData(containerObj ,excludeObjs){
	
	var jsonObj = {};
	$(containerObj).find("input,select,textarea").each(function(){
		var id = $(this).attr("id");
		jsonObj[$(this).attr("name")] = $(this).val();
	});
	
	// remove the exclude Objs from jsonObj
	if(typeof(excludeObjs) != 'undefined'){
		$(exclude).each(function(){
			var id = $(this).attr("id");
			delete jsonObj[$(this).attr("name")];
		});
	}

	return jsonObj;
}


//进度条 param:是否显示(1显示0关闭),进度条显示的内容(不填或者填""则显示默认值)
function openProgress(_openprogress,_msg){

	if(_openprogress){
		if(_msg=="" || typeof(_msg) =="undefined") _msg = "正在处理中...";
		$.messager.progress({
			title:'请稍等',
			msg:_msg,
			text:"",
			interval:100
		});
	}else{
		//setTimeout("$.messager.progress('close')",0);  //此处不用setTimeout调用IE6会报JS,暂不知为何
		$.messager.progress('close');
	}
}

//提示信息 , lhdialog
function alertMsg( msg , okfun){
	$.dialog({
		title:"消息",
		content:msg,
		width:"100px",
		height:"60px",
		okVal:"确定",
		ok:function(){
			if(typeof okfun == "function") okfun();
		}
	});
}