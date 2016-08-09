
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
                title: '入库记录表',
                url: '<%=base%>/listData',
                iconCls: 'icon-list',
                pageList: [15, 20, 25, 30],
                pageSize: 15,
                width: getWidth(1),
                height: getHeight(1),
                resizable: true,
                //	singleSelect:true,
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
                    {field: "productId", title: '产品id', name: 'productId', align: 'center', width: 150, hidden: true},
                    {field: 'id', title: 'id', name: 'id', align: 'center', width: 150},
                    {field: 'senderId', title: 'senderId', name: 'senderId', align: 'center', width: 100},
                    {field: 'receiverId', title: 'receiverId', name: 'receiverId', align: 'center', width: 100},
                    {field: 'sendTime', title: 'sendTime', name: 'sendTime', align: 'center', width: 180},
                    {
                        field: "senderOrg",
                        title: 'senderOrg',
                        name: 'senderOrg',
                        align: 'center',
                        width: 150,
                        formatter: function (val, row) {
                            return row.receiver.org.orgName;
                        }
                    },
                    {
                        field: "sender",
                        title: 'sender',
                        name: 'sender',
                        align: 'center',
                        width: 150,
                        formatter: function (val, row) {
                            return row.sender.name;
                        }
                    },
                    {
                        field: "receiverOrg",
                        title: 'receiverOrg',
                        name: 'receiverOrg',
                        align: 'center',
                        width: 150,
                        formatter: function (val, row) {
                            return row.receiver.org.orgName;
                        }
                    },
                    {
                        field: "receiver",
                        title: 'receiver',
                        name: 'receiver',
                        align: 'center',
                        width: 150,
                        formatter: function (val, row) {
                            return row.receiver.name;
                        }
                    },

                    {field: 'remark', title: 'remark', name: 'remark', align: 'center', width: 200},

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
//	alertMsg("成功了");
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
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
           onclick="update()">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="toDelete()">删除</a>

        <div id="condition">

            <a style="padding-left: 21px;">所属组：</a>
            <select name="orgId">${orgSelectHtml}</select>
            <a style="padding-left: 21px;">：</a>
            <a href="javascript:void(0);" style="margin-left:400px;" class="easyui-linkbutton" iconCls="icon-search"
               onclick="toQuery()">查询</a>
        </div>
    </div>
</div>


</body>
</html>
