<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>叮叮点餐·智能点餐·订单列表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="./css/ratchet.css" rel="stylesheet">
    <link href="./css/dingding.css" rel="stylesheet">
    <script src="./js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="./js/dish/smart.js"></script>
    <!-- <script type="text/javascript" src="js/thumbs.0.6.0.js"></script> -->
    
  </head>
  <body style="background-color: #eee">
    <!-- Make sure all your bars are the first things in your <body> -->
    <header class="bar bar-nav">
      <button class="btn pull-left back" onclick="javascript:history.back(-1);"></button>
      <h1 class="title" style="font-family: '微软雅黑'；;font-size: 24px">智能点餐</h1>
    </header>

    <!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
    <div class="content" style="padding-bottom: 55px;">
    <div class="blk" id="smblk" style="display:none">
	  <div class="smartdiv">
	  	<div class="blkclose"><img id="smblkclose" alt="" src="img/order_return.png" style="height: 40px;margin-right: -20px"></div>
	  		<input type="hidden" id="smorderblkdishid" value="">
        	<div style="float: left;margin-right: 20px;line-height: 50px">数量</div>
        	<div class="reducedish" id="smorderperred"></div>
      	    <div id="smorderperamount" style="float: left;width: 65px;text-align: center;line-height: 50px">1</div>
      	    <div class="adddish active" id="smorderperadd"></div>
      	<div style="clear: both;"></div>
      	<input type="button" class="confirmcountbtn" id="smconfirmcount" value="确定">
      	<input type="button" class="confirmdelbtn" id="smconfirmdel" value="删除">
      </div>
	</div>
      <div class="ordertitle" style="text-align: left;padding-left: 30px"><span style="font-size: 18px;color: #555">人数：</span><c:out value="${order.personNum}"></c:out>人&nbsp;<span style="font-size: 18px;color: #555">人均：</span>￥<c:out value="${order.averPrice}"></c:out></div>
      <c:forEach items="${order.dishs}" var="dishes" varStatus="st">
      <div class="orderdtl">
      	<div class="orderdtltitle"><c:out value="${dishes.key}"/>：<span class="ordercount"><c:out value="${fn:length(order.dishs[dishes.key])}"></c:out></span></div>
      	<ul class="table-view" style="border: 0;margin: 0">
      	  <c:set value="${st.index}" var="si"/>
      	  <c:forEach items="${order.dishs[dishes.key]}" var="dish">
          <li class="table-view-cell media" style="border: 0;margin: 0">
            <a class="touchable">
      	    <img class="media-object pull-left" src="img/dishpng.png" style="width: 60px;height: 45px">
      	    <div class="media-body">
      	      <table>
      	      	<tr style="height: 45px">
      	      	  <td style="width: 130px;padding-right: 10px"><input class="orderdishid" type="hidden" value="${dish.dishId}"/><span class="orderdishnm"><c:out value="${dish.dishName}"/></span></td>
      	      	  <td style="width: 50px"><span class="orderamount"><c:out value="${dish.num}"></c:out></span>份</td>
      	      	  <td style="width: 80px;color: #ff6600">￥<span class="orderprdata"><c:out value="${dish.price}"></c:out></span>/份</td>
      	      </tr></table>
      	    </div>
      	    </a>
      	  </li>
      	  </c:forEach>
      	</ul>
      </div>
      </c:forEach>
    </div>
    <nav class="bar bar-tab" style="background-color: #eee;">
      <div class="ordertotalp">总计￥&nbsp;<span id="smartorderprice" style="color: #fe8302;font-size: 25px">0</span></div>
      <input type="button" class="orderdtlbtn" id="postSmartOrder" value="提交订单">
    </nav>
  </body>
  <script src="./js/ratchet.js"></script>
  <script src="./js/hoverableandtouchable.js"></script>
  <script type="text/javascript">
  function toDetail(dishId){
		//alert(dishId);
		
		location.href = "dishPage/dishDetail?dishId="+dishId;
	}
  </script>
  <script src="./js/popup_layer.js"></script>
  <script type="text/javascript">
    	$(function(){
    		var bodywidth = document.body.clientWidth;
    		$(".orderdtl").innerWidth(bodywidth);
    		$(".orderdtlbtn").innerWidth(bodywidth/2);
    		$(".ordertotalp").innerWidth(bodywidth/2);
    		countprice();
    		
    		$("#smorderperadd").unbind("click"); //防止多次绑定。
	    	$("#smorderperadd").click(function() {
	    		$("#smorderperred").attr("class","reducedish active");
	    		var newamount = Number($("#smorderperamount").html()) + 1;
	    		$("#smorderperamount").html(newamount);
	    	});
	    	
	    	$("#smorderperred").unbind("click"); //防止多次绑定。
	    	$("#smorderperred").click(function() {
	    		if($("#smorderperred").attr("class") == "reducedish") {
	    			
	    		} else {
	    			if($("#smorderperamount").html() == "2") {
	    				$("#smorderperred").attr("class","reducedish");
	    			}
	    			var newamount = Number($("#smorderperamount").html()) - 1;
		    		$("#smorderperamount").html(newamount);
	    		}
	    	});
	    	
	    	$(".touchable").unbind("click"); //防止多次绑定。
	    	$(".touchable").click(function() {
	    		var id = $(this).find(".orderdishid").val();
	    		location.href = "smart/dishDetail?dishId="+id;
	    	});
    		
    		var pl = new PopupLayer({
    			trigger:".touchable",
    			popupBlk:"#smblk",
    			closeBtn:"#smblkclose",
    			useOverlay:true,
    			eventType:"",
    			offsets:{x:5,y:-80}
    		});
    		$t=$('.touchable').Hoverable({disableHover:true, logging:true});
    		$t.newHover(function(e, touch){
    			$(".touchable").unbind("click");
    			if(pl.isSetPosition){
    				pl.setPosition(pl.trigger.offset().left + pl.options.offsets.x, pl.trigger.offset().top + pl.trigger.get(0).offsetHeight + pl.options.offsets.y);
    			}
    			pl.options.useOverlay?pl._loadOverlay():null;
    			(pl.isOverlay && pl.options.useOverlay)?$(pl.overlay).show():null;
    			if(pl.isDoPopup && (pl.popupLayer.css("display")== "none")){
    				pl.options.useFx?pl.doEffects("open"):$(pl.popupLayer).show();
    			}
    			$("#smorderblkdishid").val($(this).find(".orderdishid").val());
    			$("#smorderperamount").html($(this).find(".orderamount").html());
    			if($("#smorderperamount").html()== "1") {
    				$("#smorderperred").attr("class","reducedish");
    			} else {
    				$("#smorderperred").attr("class","reducedish active");
    			}
    		  }, function(e, touch){
    		  });
    	});
    	
    	function countprice() {
    		var pricelist = new Array();
    		pricelist = $(".orderprdata");
    		var amountlist = new Array();
    		amountlist = $(".orderamount");
    		var price = 0;
    		for(var i = 0; i < pricelist.length; i++){
    			price += Number(pricelist[i].innerHTML) * Number(amountlist[i].innerHTML);
    		}
    		$("#smartorderprice").html(price);
    	}
    </script>
</html>