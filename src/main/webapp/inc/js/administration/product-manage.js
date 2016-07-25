var $dg = null;//datagrid
var doType;
$(document).ready(function() {
	$dg = $("#dg");
	$dg.datagrid("resize", {
		height: getHeight(1)
	});
});

function refreshDatas() {
	$.ajax(base + "/administration/product/list.do", {
		dataType: "json",
		data: {},
		type: "GET",
		success: function(json) {
			if (json && json.ok) {
				if (json.citems > 0) {
					$dg.datagrid("loadData", json.datas);
				}
			} else if (json && !json.ok) {
				//error
			}
		}
	});
}
function toQuery() {
	var productName = $("#productNameSearchField").val().trim();
	$dg.datagrid({
		url: listUrl + "?name=" + productName
	});
}
function productStatusFormmater(d) {
	var t = null;
	switch(d) {
	case 0:
		t = "在销";
		break;
	default:
		t = "下架";
	}
	return t;
}
function newProduct() {
	$('#dlg').dialog('open').dialog('setTitle','添加产品');
	$('#fm').form('clear');
	$("#fm").form("load", {"productStatus": 0});
	doType = 0;
}
function editProduct() {
	var row = $dg.datagrid('getSelected');
    if (row){
        $('#dlg').dialog('open').dialog('setTitle','修改产品');
        $('#fm').form('load',row);
        doType = 1;
    }
}
function destroyProduct() {
	var row = $('#dg').datagrid('getSelected');
    if (row){
        $.messager.confirm('请确定','你确定要删除该产品吗',function(r){
            if (r){
                $.post(urls[2],{"productId":row.productId},function(result){
                    if (result.success){
                        $('#dg').datagrid('reload');    // reload the user data
                    } else {
                        $.messager.show({    // show error message
                            title: '错误',
                            msg: result.msg
                        });
                    }
                },'json');
            }
        });
    }
}
function saveProduct() {
	var url = urls[doType];
	$('#fm').form('submit',{
        url: url,
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(result){
            var result = eval('('+result+')');
            if (result && result.success) {
            	$('#dlg').dialog('close');        // close the dialog
                $('#dg').datagrid('reload'); 
            } else if (result && result.msg) {
            	$.messager.show({
                    title: '错误',
                    msg: result.msg
                });
            }
        }
    });
}