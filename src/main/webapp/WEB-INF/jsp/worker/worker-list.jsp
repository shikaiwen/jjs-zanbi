
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%@include file="/comm/res.jsp" %>
    <script type="text/javascript">


        var dd;
        $(function () {
            registerResize("#inventoryDg");
        });

        $(function () {
            dd = $("#inventoryDg").datagrid({
                title: '人员列表',
                url: '<%=base%>/worker/listData',
                iconCls: 'icon-list',
                pageList: [15, 20, 25, 30],
                pageSize: 15,
                width: getWidth(1),
                height: getHeight(1),
                resizable: true,
                singleSelect:true,
                //selectOnCheck:true,
                autoRowHeight: false,
                striped: true,
//                sortName: 'id',
//                sortOrder: 'desc',
                idField: 'id',
                loadMsg: '数据加载中...',
                toolbar: '#toolbar',
                columns: [[
                    {field: 'ck', checkbox: true},
                    {field: 'id', title: 'id', name: 'id', align: 'center', width: 150},
                    {field: "name", title: 'name', name: 'name', align: 'center', width: 150},
                    {
                        field: "orgName",
                        title: 'orgName',
                        name: 'orgName',
                        align: 'center',
                        width: 150,
                        formatter: function (val, row) {
                            return row.org.orgName;
                        }
                    },
                    {
                        field: "roleName",
                        title: 'roleName',
                        name: 'roleName',
                        align: 'center',
                        width: 150,
                        formatter: function (val, row) {
                            return row.role.roleName;
                        }
                    },

                    {
                        field: "zbCount",
                        title: 'zbCount',
                        name: 'zbCount',
                        align: 'center',
                        width: 150,
                        formatter: function (val, row) {

                            var rule = row.role.zbRule;

                            if(rule.zbComputeType == 1){
                                return rule.zbCount ;
                            }

                            if(rule.zbComputeType == 2) {
                                return rule.calculate;
                            }

                            return ;
                        }
                    },

                ]],
                pagination: true
            });

            var p = $('#inventoryDg').datagrid('getPager');
            $(p).pagination({
                beforePageText: '第',
                afterPageText: '页     共{pages}页',
                displayMsg: '当前显示 {from} - {to} 条记录',
                onBeforeRefresh: function () {
                }
            });

        });


        function chooseProduct(){

            var data = {callback:function(datas){
                $("#productId").val(datas['productId']);
                $("#productName").val(datas['productName']);
            }};
            $.dialog({
                title:'选择产品',
                content:"url:<%=base%>/administration/product/popProductForInventory.do",
                width:400,
                height:300,
                data:data
            });
        }


        function add(){
            var dialog = createDialog("addInventoryDg","<%=base%>/worker/goAdd","添加库存",addCallback,500,300 );
            //$(dialog).dialog('setTitle','添加理财客户');
            //$('#dlg').form('clear');
        }

        function addCallback(dialog){
            $(dialog).dialog("close");
            $(dd).datagrid("reload");
        }


        function toQuery(){
            var jsonObj  = getAllInputData($("#condition"));
            dd.datagrid("options").queryParams = jsonObj;
            dd.datagrid('load');
        }


        function toDelete(){
            var rows = $('#inventoryDg').datagrid('getSelections');
            if(rows.length != 1){
                $.messager.alert("提示","请选择一条数据");return;
            }else{
                $.messager.confirm('确认','确定要删除这条数据吗?',function(r){
                    if ( !r ) return;
                    var id = rows[0]['id'];
                    $.post('<%=base%>/worker/doDelete',{"id":id},function(data){
                        if("ok" == data){
                            showMsg("操作成功!");
                        }
                        dd = $("#inventoryDg").datagrid("reload");
                    });
                });
            }
        }


    </script>

</head>
<body class="easyui-layout" fit="true">

<div style="height:100%">
    <table id="inventoryDg" class="easyui-layout" data-options="fit:true">
    </table>
</div>

<div id="toolbar">
    <div>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>
        <%--<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"--%>
           <%--onclick="update()">修改</a>--%>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="toDelete()">删除</a>

        <div id="condition">
            <a style="padding-left: 21px;">所属组：</a>
            <select name="orgId">${orgSelectHtml}</select>

            <a href="javascript:void(0);" style="margin-left:40px;" class="easyui-linkbutton" iconCls="icon-search"
               onclick="toQuery()">查询</a>
        </div>
    </div>
</div>


</body>
</html>
