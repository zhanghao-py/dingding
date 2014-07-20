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
    
    <title>叮叮点餐·订单列表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="./css/ratchet.css" rel="stylesheet">
    <link href="./css/dingding.css" rel="stylesheet">
    <script src="./js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="./js/dish/order.js"></script>
    <!-- <script type="text/javascript" src="js/thumbs.0.6.0.js"></script> -->
    
  </head>
  <body style="background-color: #eee">
    <!-- Make sure all your bars are the first things in your <body> -->
    <header class="bar bar-nav">
      <button class="btn pull-left back" onclick="javascript:history.back(-1);"></button>
      <h1 class="title" style="font-family: '微软雅黑'；;font-size: 24px">订单详情</h1>
    </header>
    <!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
    <div class="content" style="padding-bottom: 55px;">
    <div class="blk" id="blk" style="display:none">
	  <div class="smartdiv">
	  	<div class="blkclose"><img id="blkclose" alt="" src="img/order_return.png" style="height: 40px;margin-right: -20px"></div>
	  		<input type="hidden" id="orderblkdishid" value="">
        	<div style="float: left;margin-right: 20px;line-height: 50px">数量</div>
        	<div class="reducedish" id="orderperred"></div>
      	    <div id="orderperamount" style="float: left;width: 65px;text-align: center;line-height: 50px">1</div>
      	    <div class="adddish active" id="orderperadd"></div>
      	<div style="clear: both;"></div>
      	<input type="button" class="confirmcountbtn" id="confirmcount" value="确定">
      	<input type="button" class="confirmdelbtn" id="confirmdel" value="删除">
      </div>
	</div>
      <div class="ordertitle"><c:out value="${order.restName}"></c:out></div>
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
      <div class="ordertotalp">总计￥&nbsp;<span id="orderprice" style="color: #fe8302;font-size: 25px"><c:out value="${order.totalPrice}"></c:out></span>元</div>
      <input type="button" class="orderdtlbtn" id="orderSubmit" value="提交订单">
    </nav>
  </body>
  <script src="./js/ratchet.js"></script>
  <script src="./js/hoverableandtouchable.js"></script>
  <script type="text/javascript">
  function toDetail(dishId){
		//alert(dishId);
		
		location.href = "smart/dishDetail?dishId="+dishId;
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
    		
    		$("#orderperadd").unbind("click"); //防止多次绑定。
	    	$("#orderperadd").click(function() {
	    		$("#orderperred").attr("class","reducedish active");
	    		var newamount = Number($("#orderperamount").html()) + 1;
	    		$("#orderperamount").html(newamount);
	    	});
	    	
	    	$("#orderperred").unbind("click"); //防止多次绑定。
	    	$("#orderperred").click(function() {
	    		if($("#orderperred").attr("class") == "reducedish") {
	    			
	    		} else {
	    			if($("#orderperamount").html() == "2") {
	    				$("#orderperred").attr("class","reducedish");
	    			}
	    			var newamount = Number($("#orderperamount").html()) - 1;
		    		$("#orderperamount").html(newamount);
	    		}
	    	});
	    	
	    	$(".touchable").unbind("click"); //防止多次绑定。
	    	$(".touchable").click(function() {
	    		var id = $(this).find(".orderdishid").val();
	    		location.href = "smart/dishDetail?dishId="+id;
	    	});
    		
    		var pl = new PopupLayer({
    			trigger:".touchable",
    			popupBlk:"#blk",
    			closeBtn:"#blkclose",
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
    			$("#orderblkdishid").val($(this).find(".orderdishid").val());
    			$("#orderperamount").html($(this).find(".orderamount").html());
    			if($("#orderperamount").html()== "1") {
    				$("#orderperred").attr("class","reducedish");
    			} else {
    				$("#orderperred").attr("class","reducedish active");
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
    		$("#orderprice").html(price);
    	}
    	
    </script>
</html>