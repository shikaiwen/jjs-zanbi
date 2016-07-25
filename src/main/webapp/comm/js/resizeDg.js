
function registerResize(datagrid){
	$(window).bind("resize",function(){
		$(datagrid).datagrid("resize",{
			width:getWidth(1),
			height:getHeight(1)
		});
	});
}

function getWidth(percent){  
    return $(window).width() * percent;  
}  
function getHeight(percent){
	return $(window).height() * percent;
}