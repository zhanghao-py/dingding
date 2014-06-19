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
    
    <title>叮叮菜单列表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="./css/ratchet.css" rel="stylesheet">
    <link href="./css/dingding.css" rel="stylesheet">
    <script src="./js/jquery-1.11.0.js"></script>
	    <script type="text/javascript" src="./js/dish/order.js"></script>
    <!-- <script type="text/javascript" src="js/thumbs.0.6.0.js"></script> -->
    <script type="text/javascript">
    	$(function(){
    		var bodywidth = document.body.clientWidth;
    		$(".orderdtl").innerWidth(bodywidth);
    		$(".orderdtlbtn").innerWidth(bodywidth/2);
    		$(".ordertotalp").innerWidth(bodywidth/2);
    		countprice();
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
  </head>
  <body style="background-color: #eee">
    <!-- Make sure all your bars are the first things in your <body> -->
    <header class="bar bar-nav">
      <button class="btn pull-left back"></button>
      <h1 class="title" style="font-family: '微软雅黑'；;font-size: 24px">订单详情</h1>
    </header>

    <!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
    <div class="content" style="padding-bottom: 55px;">
      <div class="ordertitle"><c:out value="${order.restName}"></c:out></div>
      <c:forEach items="${order.dishs}" var="dishes" varStatus="st">
      <div class="orderdtl">
      	<div class="orderdtltitle"><c:out value="${dishes.key}"/>：<span class="ordercount"><c:out value="${fn:length(order.dishs[dishes.key])}"></c:out></span></div>
      	<ul class="table-view" style="border: 0;margin: 0">
      	  <c:set value="${st.index}" var="si"/>
      	  <c:forEach items="${order.dishs[dishes.key]}" var="dish">
          <li class="table-view-cell media" style="border: 0;margin: 0">
            <a class="">
      	    <img class="media-object pull-left" src="img/dishpng.png" style="width: 60px;height: 45px">
      	    <div class="media-body">
      	      <table>
      	      	<tr style="height: 45px">
      	      	  <td style="width: 130px;padding-right: 10px"><span class="orderdishnm"><c:out value="${dish.dishName}"/></span></td>
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
</html>