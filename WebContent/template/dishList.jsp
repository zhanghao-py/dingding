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
    
    <title>叮叮点餐·菜单列表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="./css/ratchet.css" rel="stylesheet">
    <link href="./css/dingding.css" rel="stylesheet">
    <script src="./js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="./js/dish/dishList.js"></script>
    <!-- <script type="text/javascript" src="js/thumbs.0.6.0.js"></script> -->
    <script type="text/javascript">
    	$(function(){
    		var headh = $("header").height();
    		var navh = $("nav").height();
    		var newimgh = (document.body.clientHeight-navh-headh)/6;
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
    		$(".discoverydiv").innerWidth(aw);
    		$(".discoverydiv").css({"display":"none"});
    		$(".historydiv").innerWidth(aw);
    		$(".historydiv").css({"display":"none"});
    		
    		$("#dishhistory").click(function(){
    			location.href="history";
    		});
    		$("#dishallorder").click(function(){
    			location.href="orders/allOrders";
    		});
    		$("#dishrestdisc").click(function(){
    			location.href="restrDiscovery";
    		});
    		$("#dishgroup").click(function(){
    			location.href="groupPurchase";
    		});
    		
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
    		$(".discoverydiv").slideUp(50);
    		$(".historydiv").slideUp(50);
    	}
    	
    	function showdisc() {
    		$(".discoverydiv").slideToggle(50);
    		$(".menudiv").slideUp(50);
    		$(".historydiv").slideUp(50);
    	}
    	
    	function showhis() {
    		$(".historydiv").slideToggle(50);
    		$(".menudiv").slideUp(50);
    		$(".discoverydiv").slideUp(50);
    	}
    	
    	function toRestDetail(){
    		location.href = "rest/restDetail";
    	}
    </script>
  </head>
  
  <body style="background: #eee;">
    <!-- Make sure all your bars are the first things in your <body> -->
    <header class="bar bar-nav">
      <button class="btn pull-left back" onclick="toRestDetail()"></button>
      <button class="btn pull-right order" id="toOrderList"></button>
      <h1 class="title" style="font-family: '微软雅黑'">北京工业大学第一食堂</h1>
    </header>

    <!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
    <div class="content">
    <div class="slider">
      <div class="slide-group"  id="mySlider">
      	<div class="slide" id="slide1" style="width: 75px">
      		<div class="leftmenu" id="leftmenu">
      			<div class="leftmenuitem">搜索<input type="hidden" value="0" class="leftmenuvalue"></div>
      			<div class="leftmenuitem active">凉菜<input type="hidden" value="1" class="leftmenuvalue"></div>
      			<div class="leftmenuitem">热菜<input type="hidden" value="2" class="leftmenuvalue"></div>
      			<div class="leftmenuitem">主食<input type="hidden" value="3" class="leftmenuvalue"></div>
      			<div class="leftmenuitem">汤<input type="hidden" value="4" class="leftmenuvalue"></div>
      			<!--  <div class="leftmenuitem">饮料<input type="hidden" value="5" class="leftmenuvalue"></div>-->
      			<div class="leftmenuitem">酒水<input type="hidden" value="5" class="leftmenuvalue"></div>
      		</div>
      	</div>
         <div class="slide">
      <div>
        <ul class="table-view" style="margin-bottom:0" id="displayDish">
        <c:forEach items="${list}"  var="dish">
          <li class="table-view-cell media">
            <a class="" onclick='choose(this)'>
              <img class="media-object pull-left" src='<c:out value="${dish.imageUrl}"></c:out>'>
              <div class="media-body">
                <div class="dishnm"><c:out value="${dish.dishName}"></c:out></div>
                <div class="dishinfo">
                	<div class="dishprice"><span>￥</span><span style="font-size: 20px;color: red"><c:out value="${dish.price}"></c:out></span><span style="color: red">/份</span></div>
                	<div class="dishsell">月销量：<span style="color: #FF6600;font-size: 18px">207</span></div>
                	<input type="hidden" value="<c:out value="${dish.dishId}"></c:out>">
                </div>
                <div class="dishline"></div>
                <div class="dishcomm">
                	<div class="dishcommleft">
                		<div class="branddish"></div>
                		<!-- <div class="sale"></div> -->
                		<!-- <div class="bestsale"></div> -->
                		<div class="healthy"></div>
                	</div>
                	<div class="dishcommright">
                		<div class="hot"></div>
                		<div class="meat"></div>
                		<div class="sweat"></div>
                		<!-- <div class="spicy"></div> -->
                	</div>
                </div>
              </div>
              <div class="chosen" style="display:none"></div>
            </a>
          </li>
        </c:forEach>
        </ul>
        <div class="loadmore" id="clickmore">≡ 点击加载更多菜品...</div>
      </div></div>
      </div></div>
    </div>
    <nav class="bar bar-tab">
      <a class="tab-item active" href="javascript:void(0)" onclick="showmenu()">
        <span class="icon order"></span>
        <span class="tab-label">点餐模式</span>
        <div class="menudiv" id="dishfollowmenu" style="bottom:128px;">按菜单</div>
    	<div class="menudiv" id="dishfollowmeat" style="bottom:88px;">按荤素</div>
    	<div class="menudiv" id="dishfollowmaterial" style="bottom:48px">按食材</div>
      </a>
      <a class="tab-item" href="javascript:void(0)">
        <span class="icon noopsyche"></span>
        <span class="tab-label">智能点餐</span>
      </a>
      <a class="tab-item" href="javascript:void(0)" onclick="showhis()">
        <span class="icon history"></span>
        <span class="tab-label">历史点餐</span>
        <div class="historydiv" id="dishhistory" style="bottom:88px;">历史点餐</div>
    	<div class="historydiv" id="dishallorder" style="bottom:48px;">全部订单</div>
      </a>
      <a class="tab-item" href="javascript:void(0)" onclick="showdisc()">
        <span class="icon discovery"></span>
        <span class="tab-label">餐厅发现</span>
        <div class="discoverydiv" id="dishrestdisc" style="bottom:88px;">餐厅发现</div>
    	<div class="discoverydiv" id="dishgroup" style="bottom:48px;">叮叮团</div>
      </a>
    </nav>
  </body>
  <script src="./js/ratchet.js"></script>
</html>
