<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>叮叮点餐·智能点餐·菜品详情</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="./css/ratchet.css" rel="stylesheet">
    <link href="./css/dingding.css" rel="stylesheet">
    <script src="./js/jquery-1.11.0.js"></script>
    <!-- <script type="text/javascript" src="js/thumbs.0.6.0.js"></script> -->
    <script type="text/javascript">
    	$(function(){
    		var bodywidth = document.body.clientWidth;
    		$(".orderdishbtn").innerWidth(bodywidth-20);
    		$(".dishdtl img").innerWidth(bodywidth);
    		$(".changedtlbtn").innerWidth(bodywidth/4);
    		$(".dishdtl img").innerHeight(bodywidth*210/368);
    		var layerh = $(".dishdtl").innerHeight();
    		$("#dishlayer").innerHeight(layerh);
    		
	    	$("#nadddish").unbind("click"); //防止多次绑定。
	    	$("#nadddish").click(function() {
	    		$("#nreducedish").attr("class","reducedish active");
	    		var newamount = Number($("#ndishamount").html()) + 1;
	    		$("#ndishamount").html(newamount);
	    	});
	    	
	    	$("#nreducedish").unbind("click"); //防止多次绑定。
	    	$("#nreducedish").click(function() {
	    		if($("#nreducedish").attr("class") == "reducedish") {
	    			
	    		} else {
	    			if($("#ndishamount").html() == "2") {
	    				$("#nreducedish").attr("class","reducedish");
	    			}
	    			var newamount = Number($("#ndishamount").html()) - 1;
		    		$("#ndishamount").html(newamount);
	    		}
	    	});
    	});
    </script>
  </head>
  
  <body>
    <!-- Make sure all your bars are the first things in your <body> -->
    <header class="bar bar-nav" style="border:0">
      <button class="btn pull-left back" onclick="javascript:history.back(-1);"></button>
      <button class="btn pull-right share"></button>
      <h1 class="title" style="font-family: '微软雅黑';font-size: 24px">菜品详情</h1>
    </header>

    <!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
    <div class="content">
    <div id="dishlayer" style="overflow: auto;">
      <div class="dishdtl">
      	<img alt="" src="<c:out value='${dish.imageUrl}'></c:out>">
      	<div class="dishdtlcont">
      	  <div style="height: 40px;">
      	    <div style="float:left"><c:out value="${dish.dishName}"></c:out></div>
      	    <div style="float:right">价格：<span style="color:#FF6600">￥<c:out value="${dish.price}"></c:out></span></div>
      	  </div>
      	  <div class="dishdtlinfo">月销量：205份<span style="margin-left:30px">甜、辣</span><span class="recommend">推荐</span></div>
      	  <div class="dishdtlinfo">食材：<c:out value="${dish.material}"></c:out></div>
      	  <div class="dishdtlinfo" style="border:0;padding-top: 10px;height: 60px;line-height:50px">
      	    <div style="float: left">数量：</div>
      	    <div class="reducedish" id="nreducedish"></div>
      	    <div id="ndishamount" style="float: left;margin-left: 20px;margin-right: 20px;">1</div>
      	    <div class="adddish active" id="nadddish"></div>
      	  </div>
      	</div>
      </div>
      <div class="dishdtlbtns">
      	换一换
      	<div align="center">
      	  <input type="button" id="samematerial" class="changedtlbtn" value="同食材">&nbsp;
      	  <input type="button" id="sametaste" class="changedtlbtn" value="同口味">&nbsp;
      	  <input type="button" id="sameprice" class="changedtlbtn" value="同价格">
      	</div>
      	</div>
      	</div>
      <input type="button" class="orderdishbtn" value="加入订单" style="position: fixed;bottom: 0;">
    </div>
  </body>
  <script src="./js/ratchet.js"></script>
</html>