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
    
    <title>叮叮点餐·历史点餐</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="./css/ratchet.css" rel="stylesheet">
    <link href="./css/dingding.css" rel="stylesheet">
    <script src="./js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="./js/dish/dishList.js"></script>
    <script type="text/javascript" src="./js/dish/history.js"></script>
    <!-- <script type="text/javascript" src="js/thumbs.0.6.0.js"></script> -->
    <script type="text/javascript">
    	$(function(){
    		var headh = $("header").height();
    		var newimgh = (document.body.clientHeight-headh)/8.5;
    		$("img").innerHeight(newimgh);
    		$("img").innerWidth(80);
    		if(document.body.clientHeight < 450){
    			$(".media-body p").hide();
    		}
    		$(".slide").innerHeight($("li").outerHeight()*5.5);
    		var val = $(".table-view").innerWidth();
    		var w = val-45;
    		$(".chosen").css({"margin-left":w+"px"});
    		$(".leftmenu").innerHeight(document.body.clientHeight);
    		var aw = $(".tab-item").width();
    		$(".menudiv").innerWidth(aw);
    		$(".menudiv").css({"display":"none"});
    		
    		
    		
    		
    	});
    	
    	function choose(e) {
    		if($(e).find(".chosen").attr("style").indexOf("display: none") >= 0) {
    			chooseshow(e);
    		} else {
    			chooseback(e);
    		}
    	}
    	
    	function chooseshow(e) {
    		var ele = e.parentNode;
    		$(ele).css({"border-right":"0"});
    		$(e).find(".chosen").css({"display":""});
    	}
    	
    	function chooseback(e) {
    		$(e).find(".chosen").css({"display":"none"});
    		var ele = e.parentNode;
    		$(ele).css({"border-right":"5px solid #FF6600"});
    	}
    	
    	function showmenu() {
    		$(".menudiv").slideToggle(50);
    	}
    </script>
  </head>
  
  <body style="background: #eee;">
    <!-- Make sure all your bars are the first things in your <body> -->
    <header class="bar bar-nav">
      <button class="btn pull-left back" onclick="javascript:history.back(-1);"></button>
      <h1 class="title" style="font-family: '微软雅黑';font-size: 24px">点餐历史</h1>
    </header>

    <!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
    <div class="content">
      <div>
        <ul class="table-view" style="margin-bottom:0" id="historyDish">
        <c:forEach items="${history.maps}"  var="dish">
          <li class="table-view-cell media">
            <a class="">
              <img class="media-object pull-left" src='<c:out value="${history.maps[dish.key].imageUrl}"></c:out>'>
              <div class="media-body">
                <div class="dishnm"><c:out value="${dish.key}"></c:out></div>
                <div class="dishinfo">
                	<div class="dishprice"><span>￥</span><span style="font-size: 20px;color: red"><c:out value="${history.maps[dish.key].price}"></c:out></span><span style="color: red">/份</span></div>
                	<div class="dishsell">已点<span style="color: #FF6600;font-size: 18px" class="orderamount"><c:out value="${history.maps[dish.key].numOfOrder}"></c:out></span>次</div>
                	<input type="hidden" value="<c:out value="${history.maps[dish.key].dishId}"></c:out>">
                </div>
                <div class="dishline"></div>
                <div class="dishcomm">
                	<div class="dishcommleft">
                		<div class="branddish"></div>
                		<div class="sale"></div>
                		<div class="bestsale"></div>
                		<div class="healthy"></div>
                	</div>
                	<div class="dishcommright">
                		<div class="hot"></div>
                		<div class="meat"></div>
                		<div class="sweat"></div>
                		<div class="spicy"></div>
                	</div>
                </div>
              </div>
              <div class="chosen" style="display:none"></div>
            </a>
          </li>
        </c:forEach>
        </ul>
        <div class="loadmore" id="historyclickmore">≡ 点击加载更多菜品...</div>
      </div>
    </div>
  </body>
  <script src="./js/ratchet.js"></script>
</html>
