<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <!-- <script type="text/javascript" src="js/thumbs.0.6.0.js"></script> -->
    <script type="text/javascript">
    	$(function(){
    		var headh = $("header").height();
    		var navh = $("nav").height();
    		var newimgh = (document.body.clientHeight-navh-headh)/6;
    		$("img").innerHeight(newimgh);
    		if(document.body.clientHeight < 450){
    			$(".media-body p").hide();
    		}
    		$(".slide").innerHeight($("li").outerHeight()*5.5);
    		var val = $(".table-view").innerWidth();
    		var w = val-45;
    		$(".chosen").css({"margin-left":w+"px"});
    		$(".leftmenu").innerHeight(document.body.clientHeight);
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
    </script>
  </head>
  
  <body>
    <!-- Make sure all your bars are the first things in your <body> -->
    <header class="bar bar-nav">
      <button class="btn pull-left back"></button>
      <button class="btn pull-right order"></button>
      <h1 class="title" style="font-family: '微软雅黑'">北京工业大学第一食堂</h1>
    </header>

    <!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
    <div class="content">
    <div class="slider">
      <div class="slide-group"  id="mySlider">
      	<div class="slide" id="slide1" style="width: 100px">
      		<div class="leftmenu">
      			<div class="leftmenuitem">搜索</div>
      			<div class="leftmenuitem active">凉菜</div>
      			<div class="leftmenuitem">热菜</div>
      			<div class="leftmenuitem">主食</div>
      			<div class="leftmenuitem">汤</div>
      			<div class="leftmenuitem">饮料</div>
      			<div class="leftmenuitem">酒水</div>
      		</div>
      	</div>
         <div class="slide">
      <div>
        <ul class="table-view">
          <li class="table-view-cell media">
            <a class="" onclick="choose(this)">
              <img class="media-object pull-left" src="img/kongpaochicken.PNG">
              <div class="media-body">
                <div class="dishnm">宫保鸡丁</div>
                <div class="dishinfo">
                	<div class="dishprice"><span>￥</span><span style="font-size: 20px;color: red">23</span><span style="color: red">/份</span></div>
                	<div class="dishsell">月销量：<span style="color: #FF6600;font-size: 18px">207</span></div>
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
          <li class="table-view-cell media">
            <a class="navigate-right">
              <img class="media-object pull-left" src="img/menu_singleDish_dishImage.png">
              <div class="media-body">
                Item 2
                <p>Lorem ipsum dolor sit amet</p>
              </div>
            </a>
          </li>
          <li class="table-view-cell media">
            <a class="navigate-right">
              <img class="media-object pull-left" src="img/menu_singleDish_dishImage.png">
              <div class="media-body">
                Item 3
                <p>Lorem ipsum dolor sit amet</p>
              </div>
            </a>
          </li>
          <li class="table-view-cell media">
            <a class="navigate-right">
              <img class="media-object pull-left" src="img/menu_singleDish_dishImage.png">
              <div class="media-body">
                Item 4
                <p>Lorem ipsum dolor sit amet</p>
              </div>
            </a>
          </li>
          <li class="table-view-cell media">
            <a class="navigate-right">
              <img class="media-object pull-left" src="img/menu_singleDish_dishImage.png">
              <div class="media-body">
                Item 5
                <p>Lorem ipsum dolor sit amet</p>
              </div>
            </a>
          </li>
        </ul>
      </div></div>
      </div></div>
    </div>
   <!--  <nav class="bar bar-tab">
      <a class="tab-item active" href="#">
        <span class="icon icon-home"></span>
        <span class="tab-label">Home</span>
      </a>
      <a class="tab-item" href="#">
        <span class="icon icon-person"></span>
        <span class="tab-label">Profile</span>
      </a>
      <a class="tab-item" href="#">
        <span class="icon icon-star-filled"></span>
        <span class="tab-label">Favorites</span>
      </a>
    </nav> -->
  </body>
  <script src="./js/ratchet.js"></script>
</html>
