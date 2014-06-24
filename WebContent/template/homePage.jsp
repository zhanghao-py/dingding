<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎使用叮叮点餐！</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
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
    		var mt = $(".mpbg").height()-17;
    		$(".mpcontent").css({"margin-top":mt+"px"});
    	});
    </script>
    <style type="text/css"> 
		ul{position:absolute;top: 0;width: 100%;height: 70%;padding: 0;margin: 0} 
		ul li{display:block; position:absolute;top:0;width: 100%;height: 100%} 
		.mpbg {width: 100%;height: 100%;z-index: 1;}
	</style> 
  </head>
   <%
	  List a = new ArrayList();
	  a.add("北京工业大学第一食堂");
	  a.add("麦当劳奥特莱斯店");
	  request.setAttribute("a",a);
  	 %>
  <body style="background-color: #fff">
   <div class="content" style="background-color: #fff">
      <ul class="mpbggroup">
        <!-- <li><img class="mpbg" alt="" src="img/mainpage_bg2.png"/></li>
        <li><img class="mpbg" alt="" src="img/mainpage_bg3.png"/></li> -->
        <li><img class="mpbg" alt="" src="img/mainpage_bg4.png"/></li>
        <li><img class="mpbg" alt="" src="img/mainpage_bg5.png"/></li>
        <!-- <li><img class="mpbg" alt="" src="img/mainpage_bg6.png"/></li> -->
        <li><img class="mpbg" alt="" src="img/mainpage_bg7.png"/></li>
        <li><img class="mpbg" alt="" src="img/mainpage_bg8.png"/></li>
        <!-- <li><img class="mpbg" alt="" src="img/mainpage_bg9.png"/></li>
        <li><img class="mpbg" alt="" src="img/mainpage_bg1.png"/></li> -->
      </ul>
      <img class="mpdingding" alt="" src="img/mainpage_title.png"/>
      <div class="mpcontent" id="locating">
      	<span style="line-height:30px;vertical-align: middle;"><br/>
      	  <img src="img/mainpage_wlan.gif" style="width: 30px;vertical-align: middle;"/>
      	  餐厅定位中...</span><br/>
      	<img src="img/mainpage_wlan_connecting.gif" style="width: 50px;margin-top: 20px"/>
      </div>
      <div class="mpcontent" style="display: none" id="locatefail">
      	<span style="line-height:35px;vertical-align: middle;color: red"><br/>
      	  <img src="img/mainpage_wlan_failed.gif" style="width: 30px;vertical-align: middle;"/>
      	  定位失败，请您检查网络:(</span><br/>
      	<div align="center"><input type="button" class="mprefresh" value="刷新"/></div>
      </div>
      <div class="mpcontent" style="display: none" id="locatesuccess">
      	<img src="img/mainpage_wlan_success.gif" style="width: 150px;margin-top: 30px;margin-bottom: 15px;"/>
      	<div align="center"><div style="border-top: 1px solid #ccc;width: 80%;height: 15px"></div></div>
      	<div style="text-align: left;margin-left: 23%">
      	<c:forEach items="${a }" var="place" varStatus="st">
      	  <span style="line-height: 25px;color: #ccc;"><img src="img/mainpage_restaurant_icon.png" style="width: 25px;vertical-align: middle;margin-top: -4px"/>
      	  <a class="locateplace" style="color: #ccc;text-decoration: none"><c:out value="${place }"/></a></span><br/>
      	</c:forEach>
      	<span style="line-height: 25px;color: #ccc;">......</span>
      	</div>
      </div>
      <img class="mpbottom" alt="" src="img/mainpage_bottom_bar.png" style="z-index: 999"/>
      <div class="mpversion">V1.0</div>
   </div>
  </body>
  <script type="text/javascript">
		var switchSpeed = 3000; //图片切换时间 
		var fadeSpeed = 1500; //渐变时间 
		setInterval(function(){ 
		$('.mpbg').last().fadeOut(fadeSpeed, function(){ 
		$(this).show().parent().prependTo($('ul')); 
		}); 
		}, switchSpeed); 
		
		setTimeout(function(){
			document.getElementById("locating").style.display = "none";
			document.getElementById("locatesuccess").style.display = "";
		},3000);
		
		setTimeout(function(){
			window.location.href="rest/restDetail"; 
		},6000);
      </script>
  <script src="./js/ratchet.js"></script>
</html>