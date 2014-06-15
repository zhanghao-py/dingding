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
    		var bodywidth = document.body.clientWidth;
    		$(".resmap").innerWidth(bodywidth-40);
    		$(".resmap").innerHeight($(".resmap").innerWidth());
    		$(".resinfo").innerHeight($(".resinfotext").innerHeight() > $(".resinfo img").innerHeight() ? $(".resinfotext").innerHeight() : ($(".resinfo img").innerHeight()+20));
    		var aw = $(".tab-item").width();
    		$(".menudiv").innerWidth(aw);
    		$(".menudiv").css({"display":"none"});
    	});
    	
    	function showmenu() {
    		$(".menudiv").slideToggle(50);
    	}
    </script>
  </head>
  
  <body>
    <!-- Make sure all your bars are the first things in your <body> -->
    <header class="bar bar-nav" style="border:0">
      <button class="btn pull-left resback"></button>
      <button class="btn pull-right share"></button>
      <h1 class="title" style="font-family: '微软雅黑';font-size: 24px">北京工业大学天天餐厅</h1>
    </header>

    <!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
    <div class="content">
    <div class="slider">
      <div class="slide-group">
      <c:forEach begin="0" end="4" step="1">
      	<div class="slide">
      <div class="resdiv">
      	<div class="resdivtitle">餐厅详情</div>
      	<div class="resinfo">
      	  <div class="resinfotext" style="white-space: normal;">
      		 地址：<span class="resaddr">北京市朝阳区北工大路平乐园100号工业大学内（近大望路）</span><br/>
      		人均：<span style="color: red">￥<span class="resprice">50</span></span><br/>
      		联系方式：<span class="restel">8888888</span>
      	  </div>
      	  <img src="img/tiantianres.jpg">
      	</div>
      </div>
      <div class="resdiv" style="padding-left: 0;padding-right: 0;">
      	<div class="resdivtitle" style="margin-left: 20px;margin-right: 20px;">为您推荐</div>
      	<div class="rescommdishlist">
      	<table class="reslisttable">
      	  <tr>
      	    <td></td><td></td>
      	    <c:forEach begin="0" end="4" step="1">
      		<td class="rescommdish">
      		  <img src="img/dishpng.png"/><br/>
      		  <span class="commdishnm">宫保鸡丁</span>
      		  <span style="color: red">￥<span class="commdishprice">15</span></span>
      		</td>
      		</c:forEach>
      	  </tr>
      	</table></div>
      </div></div>
      </c:forEach>
      </div></div>
      <div class="resdiv">
        <div class="resdivtitle">地图</div>
        <div align="center" class="resmap">
          <jsp:include page="bdmap.jsp"></jsp:include>
        </div>
      </div>
    </div>
    <nav class="bar bar-tab">
      <a class="tab-item" href="javascript(void(0))" onclick="showmenu()">
        <span class="icon order"></span>
        <span class="tab-label">点餐模式</span>
        <div class="menudiv" id="followmenu" style="bottom:139px;">按菜单</div>
    	<div class="menudiv" id="followmeat" style="bottom:99px;">按荤素</div>
    	<div class="menudiv" id="followmaterial" style="bottom:59px">按食材</div>
      </a>
      <a class="tab-item" href="javascript(void(0))">
        <span class="icon noopsyche"></span>
        <span class="tab-label">智能点餐</span>
      </a>
      <a class="tab-item active" href="javascript(void(0))">
        <span class="icon discovery"></span>
        <span class="tab-label">餐厅发现</span>
      </a>
    </nav>
  </body>
  <script src="./js/res-sliders.js"></script>
</html>