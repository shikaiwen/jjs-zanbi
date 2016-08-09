
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@include file="/comm/res.jsp" %>

    <script type="text/javascript">



    </script>
    <style>

        #container{
            margin: 0px auto;
            background-color:yellow;
            width:920px;
            background: url("./imgs/header.jpg") no-repeat center top;
            padding-top: 184px;
        }

        #itemContainer{
            /* padding-top:100px; */
            /* width:500px; */
            height:600px;
            background-color: white;
            padding-left: 50px;
        }

        .title{
            padding-top: 19px;
            color: rgb(13, 195, 223);
            text-align:center;margin:0px;
        }

        body{
            padding: 0px;
            margin: 0px;
            background: #f3faf1 url("./imgs/side.jpg") repeat-x ;
            font-family: "微软雅黑","Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        }


        .roundinput{
            padding: 6px 12px;
            border-radius : 5px;
            border: 1px solid #ccc;
        }

        .roundinput:focus{
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
        }

        .itemDiv{
            margin: 20px 40px;
            padding-bottom: 20px ;
            border-bottom: 1px solid #EFEFEF;
        }

        .attrst li{
            list-style:none;
            float: left;
            margin-left:20px;
        }

        .submitBtn{
            padding:0px 24px;
            border-radius: 5px;
            background: #45aaca;
            color:#fff;
            cursor: pointer;
            font-size: 16px;
            line-height: 30px;
        }

        #searchDiv{

        }
        #searchDiv ul{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
            box-shadow: 0px 1px 5px rgba(0,0,0,0.3);
        }

        #searchDiv li{

        }

        #searchDiv li a{
            text-decoration:none;
            color:#000000;
            width:100%;
            height:100%;
            display:block;
        }

        #searchDiv li a:hover{
            color: #ffffff;
            background-color:#474752;
        }





        #senderSearchDiv{

        }
        #senderSearchDiv ul{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
            box-shadow: 0px 1px 5px rgba(0,0,0,0.3);
        }

        #senderSearchDiv li{

        }

        #senderSearchDiv li a{
            text-decoration:none;
            color:#000000;
            width:100%;
            height:100%;
            display:block;
        }

        #senderSearchDiv li a:hover{
            color: #ffffff;
            background-color:#474752;
        }
    </style>
</head>
<body>



<script>


    $(function(){

//        bindSearch();
        bindKeyEvent();

        $("#searchDiv").find("ul").delegate("a","click",function(){
            //清空input
            $(toWhoInput).val('');
            var tag = $(this).text();
            var wid = $(this).attr("wid");
            $("<span name='tag'></span>").text(tag).attr("wid",wid).appendTo($("#tagsDiv"));
            setToWhoInputLeftPadding();
            $("#searchDiv").hide();
        });


        $("#senderSearchDiv").find("ul").delegate("a","click",function(){

            var tag = $(this).text();
            $("#senderInput").val($(this).text());

            var wid = $(this).attr("wid");
            $("#senderInput").attr("wid",wid);

            $("#senderSearchDiv").hide();

        });



        $("#submitBtn").click(function(){

            var receiverList = [];
            var sender = $("#senderInput").attr("wid");
            $("#tagsDiv").children("span").each(function(){

                receiverList.push($(this).attr("wid"));

            });

            var data = {'senderid': sender, "receiverId": receiverList};
            data['remark'] = $("#remark").val();

            data['isProPrize'] = $("#isProPrize").is(":checked");
            data['isQAPrize'] = $("#isQAPrize").is(":checked");
            data['countUnit'] = $(countUnit).val();

            $.post("<%=base%>/dosend",data,function(datas){

                if(datas.status == 'ok'){
                    alert("发送成功");
                }else{
                    alert("发送失败");
                }

            });


        });


    });


    function setToWhoInputLeftPadding(){
        //设置位置
        var tagsWidth = 0;
        $(tagsDiv).children().each(function(){
            tagsWidth += $(this).get(0).offsetWidth;
        });

        if($(tagsDiv).children().length >= 2){
            tagsWidth += $(tagsDiv).children().length * 1 ;
        }

        //留的左padding
        var left = 5 ;
        var toSetLeftPadding = tagsWidth + left + 5 + "px";
        $(toWhoInput).css("padding-left", toSetLeftPadding);
        // $(searchDiv).css("margin-left",tagsWidth + 10 + "px" );
    }


    function bindKeyEvent(){


        $("input[name='toWhoInput']").on("keydown",function(event){

            //处理删除键
            if(event.keyCode == 8){
                //如果没有内容了，则删除前一个标签
                if(!$(this).val()){
                    $(tagsDiv).children().last().remove();

                    setToWhoInputLeftPadding();
                }
            }
        });


        //按键事件
        $("input[name='toWhoInput']").on("input",function(event){

            var keywords = $("#toWhoInput").val().trim();
            if(!keywords) return;
            if(!/^[\u4E00-\u9FA5]+$/.test(keywords)) return;
            $.post("/zan/worker/queryByKeywords",{"keywords":keywords},function(datas){

                var list = datas.data.list;

                $("#receiverUl").children().remove();

                for(var v =0;v<list.length;v++) {

                    var worker = list[v];
                    var str = "<li><a wid='"+ worker.id +"'href='javascript:;'>" + worker.name  +"</a></li>";
                    $(str).appendTo($("#receiverUl"));

                }

                setToWhoInputLeftPadding();
                $("#searchDiv").show();


            });

        });


        //发送人
        $("input[name='senderInput']").on("input",function(event){

            var keywords = $("#senderInput").val().trim();
            if(!keywords) return;
            if(!/^[\u4E00-\u9FA5]+$/.test(keywords)) return;
            $.post("/zan/worker/queryByKeywords",{"keywords":keywords},function(datas){

                var list = datas.data.list;

                $("#senderUl").children().remove();

                for(var v =0;v<list.length;v++) {

                    var worker = list[v];
                    var str = "<li><a wid='"+ worker.id +"'href='javascript:;'>" + worker.name  +"</a></li>";
                    $(str).appendTo($("#senderUl"));

                }




                $("#senderSearchDiv").show();


            });

        });
    }



</script>
<div id="container">

    <div id="content">

        <div id="itemContainer">

            <h2 class="title" >暂币发送</h2>

            <div class="itemDiv">
                <div>1、发送人：</div>
                <input id="senderInput" name="senderInput" size="80" style="margin-top: 15px; margin-left: 10px;" />
                <div id="senderSearchDiv" style="display:none;border:1px solid #e2e6ff;">
                    <ul id="senderUl">


                    </ul>
                </div>


            </div>


            <div class="itemDiv">

                <div>2、toWho：
                </div>


                <style>

                    .tagsDiv{
                        font-size:10px;
                    }

                    .tagsDiv span{
                        float:left;margin-left:1px;border: 1px solid red;background-color: pink;padding:2px 2px;
                    }
                    #my1{
                        list-style-type: none;
                        display:inline;
                    }
                    #my1 li{
                        float:left;
                        margin-left:8px;
                    }
                </style>


                <input size="80" id="toWhoInput" class="roundinput" name="toWhoInput" style="margin-top: 15px; margin-left: 10px;"/>
                <div></div>

                <script>
                    $(function(){

                        var tagsWidth = 0;
                        $(tagsDiv).children().each(function(){
                            tagsWidth += $(this).get(0).offsetWidth;
                        });


                        //留的左padding
                        var left = 5 ;
                        var toSetLeftPadding = tagsWidth + left + 5 + "px";
                        $(toWhoInput).css("padding-left", toSetLeftPadding);

                        var top = -toWhoInput.offsetHeight;

                        $(tagsDiv).css("left",left);
                        $(tagsDiv).css("top",top + 2);

                    })
                </script>


                <div id="tagsDiv" class="tagsDiv" style="position:relative;margin-left:10px;">
                </div>


                <div id="searchDiv" style="display:none;border:1px solid #e2e6ff;">
                    <ul id="receiverUl">

                    </ul>
                </div>
            </div>


            <div class="itemDiv">
                <ul class="attrst">
                    <li><span>每人&nbsp;<input type="text" id="countUnit" value="1" size="1" name="sender"/>&nbsp;个</span></li>
                    <li><span><input type="checkbox" id="isProPrize"  name="sender"/>产品贡献</span></li>
                    <li><span><input type="checkbox"  id="isQAPrize" name="sender"/>质量贡献</span></li>
                </ul>
                <div style="clear:both;"></div>
            </div>

            <div class="itemDiv">

                <div style="">3、事实依据：</div>
                <textarea id="remark" style="margin-top: 15px; margin-left: 10px;" rows="8" cols="80"></textarea>
            </div>

            <div style="margin-left:200px;">
                <input class="submitBtn" id="submitBtn" type="button" value="提交"/>
            </div>
        </div>
    </div>

</div>
</body>
</html>