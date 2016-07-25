<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String base = request.getContextPath();
boolean isLogin = session.getAttribute("user") == null ? false:true;
%>
<script type="text/javascript">

	var productCode = '<%=request.getParameter("productCode")%>';
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimun-scale=1.0">

<link rel="stylesheet" href="<%=base%>/plugin/jquery.mobile-1.4.3/jquery.mobile-1.4.3.min.css">
 <script src="<%=base%>/plugin/jquery/jquery.1.10.js"></script> 
 <script src="<%=base%>/plugin/jquery.mobile-1.4.3/jquery.mobile-1.4.3.min.js"></script>
 <script src="<%=base%>/webpage/junyou/inc/js/index.js"></script>

<!-- photoSwipe -->
<%-- <script type="text/javascript" src="<%=base%>/plugin/code-photoswipe1.1/lib/simple-inheritance.min.js"></script>
<script type="text/javascript" src="<%=base%>/plugin/code-photoswipe1.1/lib/jquery.animate-enhanced.min.js"></script>
<script type="text/javascript" src="<%=base%>/plugin/code-photoswipe1.1/code-photoswipe-1.0.11.js"></script> --%>

<link rel="stylesheet" href="<%=base%>/plugin/jquery.mobile-1.4.3/mytheme/dz_green/green.css">
<link rel="stylesheet" href="<%=base%>/plugin/jquery.mobile-1.4.3/mytheme/dz_green/jquery.mobile.icons.min.css">

<script type="text/javascript">
var base='<%=base%>';

</script>

<style type="text/css">
	#product_basic_info{
		font-size:14px;
	}
</style>
</head>
<body>

<div data-role="page" id="pageone" data-theme="a" >
  <div data-role="header" >
   <h1>野生菌油</h1>
  </div>

	<!-- Content -->
  <div data-role="content">
 <div data-role="collapsible" data-collapsed="false" data-theme="a">
 
      <h3>产品信息</h3>
   <ul data-role="listview" data-theme="a">
	   		<li><div><span><strong>产品名称:</strong>农家野生菌油</span><input type="hidden" id="valid" value="${param.valid}"/></div></li>
	      <li><div ><span><strong>产品来源:</strong>湖南繁星物联网科技公司甘小平</span></div></li>
	      <li><div ><span><strong>生产日期:</strong>2014-12-01</span></div></li>
	      <li><div ><span><strong>保质期:</strong>12个月</span></div></li>
		<li><span><strong>价格:</strong>350元/瓶</span></li>
  <li><span><strong>查询次数:</strong>${query_count}</span></li>
	      	<li><div><span><strong>备注:</strong>农家土法秘制，会员内部专供 </span></div></li>
    <li>
						<div align="center">
							<button id="validateBtn" style="font-size: 0.8em"
								class="ui-btn ui-corner-all ui-btn-inline">验证真伪</button>
							<a href="#tsPage" style="font-size: 0.8em"
								class="ui-btn ui-corner-all ui-btn-inline">投诉举报</a>
								 <a
								href='#fkPage' 
								style="font-size: 0.8em"
								class="ui-btn ui-corner-all ui-btn-inline">信息反馈</a>
						</div>
					</li>
    </ul>
</div>
<div>
	<img width="110" height="130" src="<%=base%>/webpage/junyou/imgs/product/p1.jpg">
</div>
<style>
	#Gallery ul{
		list-style-type:none;
		margin:0px;
		padding:0px;
	}
	#Gallery ul img{
		margin-left:10px;
	}
	#Gallery ul img{
		float:left;
		width:80px;
		height:80px;
	}

</style>


<%-- <div class="ui-grid-a">
	<div class="ui-block-a"><img alt="" width="120" height="150" src="<%=base%>/webpage/dz_tea/imgs/product/1.jpg"/></div>
  <div class="ui-block-b"><img alt="" width="120" height="150" src="<%=base%>/webpage/dz_tea/imgs/product/2.jpg"/></div>
</div> --%>
    
<div data-role="collapsible" data-collapsed="false" >
     <h3>产品溯源</h3>
     <p>
     	&nbsp;&nbsp;消费者通过扫描包装的 封口标签上的二维码可以得到本包产品的制作的流程以及负责人，确保产品质量，
     	从而可以放心消费。并且，一旦发现质量问题或有伪造嫌疑可以及时直接向相关人员投诉举报。
     </p>
     
<table data-role="table" id="table-custom-2" data-mode="columntoggle" 
class="ui-body-d ui-shadow table-stripe ui-responsive"
 data-column-btn-theme="b" data-column-btn-text="显示列" 
 data-column-popup-theme="c">
    <thead>
      <tr class="ui-bar-d">
       <th data-priority="1">工序</th>
       <th data-priority="1">配料</th>
        <th data-priority="1">来源</th>
        <th data-priority="1">负责人</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>采购原料、清洗</td>
        <td>野生重阳菌</td>
        <td>湖南永州道县</td>
        <td>甘小平、吴德山</td>
      </tr>
      <tr>
        <td>农家菜油现榨</td>
      <td>农家有机菜籽油</td> 
        <td>湖南永州道县</td>
        <td>吴德山</td>
      </tr>
      <tr>
        <td>菌油熬制</td>
        <td>野生菌、现榨菜油、农家生姜</td>
        <td>自供</td>
        <td>胡振华、甘小平、吴德山等</td>
      </tr>
     <tr>
     	<td colspan="1">总监制:</td>
     	<td>胡振华</td>
     </tr>
    </tbody>
  </table>
</div>  
    
    

<div data-role="collapsible" data-collapsed="false" >
     <h3>福利</h3>
   <ul data-role="listview" data-theme="b">
   	<li>
   	<!-- <a href="<%=base%>/webpage/pangge/game/ppl/pp.html" rel="external"> -->
   	<a href="http://www.duopao.com/" rel="external">
	   	<img src="<%=base%>/webpage/kouweiwang/imgs/gaming_1.png">
   	<h2>小游戏</h2>
   	</a>
   	</li>

  <li>
   	<a id="accumulate-credit">
   	<img alt="" src="<%=base%>/webpage/kouweiwang/imgs/credit_card.png">
   	<h2>累计积分</h2>
   	  <p style="white-space:normal;">
   	&nbsp;&nbsp;&nbsp;关于积分：每瓶包产品有有一次积分的机会，点击累计积分，积分可以到积分商城兑换产品。
   	</p>	
   	</a>
   	</li>
   	
   	 <%--  <li>
   	<a id="donate-btn">
   	<img alt="" src="<%=base%>/webpage/dz_tea/imgs/love.ico">
   	<h2>献爱心</h2>
   	  <p style="white-space:normal;">
   	&nbsp;&nbsp;&nbsp;  您可以通过点击下面的按钮向灾区捐款，每包产品可以捐款1元，所捐的款项有企业统一捐出
   	</p>	
   	</a>
   	</li>
   	<li>
   		<a href="<%=base%>/webpage/pangge/choujiang/index.html" rel="external">
   		<img src="<%=base%>/webpage/kouweiwang/imgs/present_1.png">
   	<h2>抽奖活动</h2>
   	<p>试试手气，有机会赢取精美小礼品额^_^！</p>
   	</a>
   	</li> --%>
   </ul>
</div>    
  
 
<div data-role="collapsible" data-collapsed="false">
<h3>公司信息</h3>

<p>
湖南繁星物联网科技有限公司成立于湖南长沙高新区，是一家专注于从事物联网相关产品与解决方案服务的高科技公司，
主要技术涵盖物联网应用、卫星定位技术、电子商务、食品安全、溯源防伪、微信营销等。
目前公司自主研发了微鹰溯源食品安全信息系统，微鹰传播电子商务客户服务管理系统（CRM)，
微泊车城市级车位引导及查车系统。公司坐落在湖南省长沙市解放中路276号鸿富大厦14层G座，欢迎各界朋友前来洽谈合作。
</p>

<div align="center">
<a href='#' rel="external" style="font-size:0.8em"  class="ui-btn ui-corner-all ui-btn-inline">公司主页</a>
<a href='#' rel="external" style="font-size:0.8em"  class="ui-btn ui-corner-all ui-btn-inline">关注微信</a>
<a href='#' rel="external" style="font-size:0.8em"  class="ui-btn ui-corner-all ui-btn-inline">网上商城</a>
</div>
</div>
  
  		<!-- 捐赠页面 -->
		<div data-role="popup" id="popupDonate" 
			data-theme="a" data-tolerance="15,15" class="ui-content">
			<h3>捐赠</h3>
			<a href="#" data-rel="back"
				class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
			<label for="un" class="ui-hidden-accessible">手机号:</label> 
			<input	type="text" name="mobile" id="donateMobile" value="" placeholder="手机号"
					data-theme="a"/> 
			<label for="un" class="ui-hidden-accessible">刮刮卡号:</label> 
			<input	type="text" name="mobile" id="donateValidCode" value="" placeholder="刮刮卡号"
					data-theme="a"/> 
			<div style="padding: 10px 20px;" id="popupDonateContent">
				<button id="donate-confirm-btn" data-theme="a"
					class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ">捐赠</button>
			</div>
		</div>
  
  
</div>

  <div data-role="footer" >
    <h6 style="padding-bottom:0px;margin-bottom:0px;">&copy; 版权所有 湖南繁星物联网科技有限公司</h6>
    <h6 style="padding:0px;margin:0px;">微鹰溯源信息系统</h6>
    <div align="center">
    	
    </div>
  </div>

<!-- 验证真伪 -->
<div data-role="popup" id="popValidateDg" data-overlay-theme="b"
			data-theme="a" data-tolerance="15,15" class="ui-content">
			<a href="#" data-rel="back"
				class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
			<div style="padding: 10px 20px;" id="">
				<h3>产品验证</h3>
				<label for="un" class="ui-hidden-accessible">刮刮卡:</label> 
				<input type="text" name="popupValidateCode" id="popupValidateCode" value="" placeholder="刮刮卡号"
					data-theme="a"> 
				<button id="popValidateSubmit"
					class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check">验证</button>
			</div>
</div>



		<!-- 捐赠详细页面 -->
		<div data-role="popup" id="popupListDonate" data-overlay-theme="b"
			data-theme="a" data-tolerance="15,15" class="ui-content">
			<a href="#" data-rel="back"
				class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
			<div style="padding: 10px 20px;" id="popupListDonateContent">
				<p></p>
			</div>
		</div>
		
		<!-- 累计积分页面 -->
		<div data-role="popup" id="popupAccumulationCredit" data-overlay-theme="b"
			data-theme="a" data-tolerance="15,15" class="ui-content">
			<a href="#" data-rel="back"
				class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
			<div style="padding: 10px 20px;" id="popupLoginContent">
				<h3>积分累计</h3>
				<label for="un" class="ui-hidden-accessible">手机号:</label> 
				<input type="text" name="user" id="creditMobile" value="" placeholder="手机号" data-theme="a">
				<label for="un" class="ui-hidden-accessible">刮刮卡号:</label> 
				<input type="text" name="cardNo" id="creditCardNo" value="" placeholder="刮刮卡号" data-theme="a">
				
				<button id='accumulate-credit-btn' type="submit"
					class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check show-page-loading-msg"
					data-textonly="false" data-textvisible="true" data-msgtext="" >获取积分</button>
			</div>
		
		
		<!-- 状态提示 -->
		<div data-role="popup" id="popupStatusInfo" data-overlay-theme="b"
			data-theme="a" data-tolerance="15,15" class="ui-content">
			<div style="padding: 10px 20px;" id="popupStatusInfoContent">
				
			</div>
		</div>
	</div>

</div>


	<div data-role="page" id="tsPage" data-url="tsPage">
		<script>
			$(function() {
				$("#tsBtn").click(function() {
					setTimeout(function() {
						alert("您的投诉举报应经保存，我们会尽快进行处理,请保持手机通畅!");
					}, 500);
				});
			});
		</script>
		<div data-role="header">
			<h1>农家野生菌油</h1>
			<a href="#"
				class="ui-btn-left ui-btn ui-btn-icon-left ui-btn-corner-all ui-shadow ui-btn-active ui-btn-up-a"
				data-rel="back" data-icon="arrow-l" data-theme="a"><span
				class="ui-btn-inner ui-btn-corner-all"><span
					class="ui-btn-text">返回</span><span
					class="ui-icon ui-icon-arrow-l ui-icon-shadow"></span></span> </a>
		</div>
		<div data-role="content">
			<div data-role="collapsible" data-collapsed="false" data-theme="a">
				<h3>投诉举报</h3>
				<ul data-role="listview" data-theme="a">
					<li><p style="white-space: normal;">如果您怀疑您购买的产品有问题，请填写相关信息，我们将会为您解决问题</p></li>
					<li>店铺地址: <input type="text" name="text-1" id="text-1"
						value=""></li>
					<li>您的手机号: <input type="text" name="text-1" id="text-1"
						value="">
					</li>
					<li>您的问题: <textarea name="textarea-1" rows="10"
							id="textarea-1"></textarea>
					</li>
					<li>店铺照片: <input type="file" data-clear-btn="true"
						name="file-2" id="file-2" value="">
					</li>
					<li>
						<div align="center">
							<button id="tsBtn" class="ui-btn ui-corner-all ui-btn-inline">立即举报</button>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
<div data-role="page" id="fkPage" data-url="fkPage">
		<script>
			$(function() {
				$("#fkBtn").click(function() {
					setTimeout(function() {
						alert("您的反馈已经保存，我们会尽快进行处理,谢谢您的支持!");
					}, 500);
				});
			});
		</script>
		<div data-role="header">
			<h1>农家野生菌油</h1>
			<a href="#"
				class="ui-btn-left ui-btn ui-btn-icon-left ui-btn-corner-all ui-shadow ui-btn-active ui-btn-up-a"
				data-rel="back" data-icon="arrow-l" data-theme="a"><span
				class="ui-btn-inner ui-btn-corner-all"><span
					class="ui-btn-text">返回</span><span
					class="ui-icon ui-icon-arrow-l ui-icon-shadow"></span></span> </a>
		</div>
		<div data-role="content">
			<div data-role="collapsible" data-collapsed="false" data-theme="a">
				<h3>信息反馈</h3>
				<ul data-role="listview" data-theme="a">
					<li>信息内容: <textarea name="textarea-1" rows="10"
							id="textarea-1"></textarea>
					</li>
					<li>
						<div align="center">
							<button id="fkBtn" class="ui-btn ui-corner-all ui-btn-inline">提交</button>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>




<!-- 抢红包页面 -->
<div data-role="page" id="hbPage" data-url="hongbao">
  <div data-role="header" >
   <h1>农家野生菌油</h1>
   			<a href="#"
				class="ui-btn-left ui-btn ui-btn-icon-left ui-btn-corner-all ui-shadow ui-btn-active ui-btn-up-a"
				data-rel="back" data-icon="arrow-l" data-theme="a"><span
				class="ui-btn-inner ui-btn-corner-all"><span
					class="ui-btn-text">返回</span><span
					class="ui-icon ui-icon-arrow-l ui-icon-shadow"></span></span> </a>
  </div>

	<!-- Content -->
  <div data-role="content" >
 <div data-role="collapsible" data-collapsed="false" data-theme="a"  >
      <h3>抢红包活动</h3>
   <ul data-role="listview" data-theme="a">
   
   <li>每瓶菌油有一次抢红包的机会</li>
   <li>剩余红包总金额: <span id="allMoney">100000￥</span></li>
		<li> <div align="center">
		 <button id="qBtn" class="ui-btn ui-corner-all ui-btn-inline">抢红包</button> 
		 </div></li>		
    </ul>
</div>
</div>
  <script>
  	$(function(){
		$("#qBtn").click(function(){
			$.mobile.loading( "show", {
	            text: '请稍后...',
	            textVisible: true,
	            textonly: false,
			});
			
		$.post("<%=base%>/kww?action=hongbao",{},function(datas){
			var d = $.parseJSON(datas);
			$.mobile.loading( "hide");
			$("#qBtn").attr("disabled","");
		//	$(this).addClass("ui-state-disabled");
			alert(d['message']);
			$("#allMoney").html(d['allMoney']);
		});
		});
	});
</script>
</div>
</body>
</html>