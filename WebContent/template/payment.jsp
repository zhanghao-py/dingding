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
    
    <title>叮叮点餐·支付</title>
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
    		var bodyh = document.body.clientHeight;
    		var headh = $("header").height();
    		var mt = (bodyh - headh - $(".payimg").height())/5;
    		$(".payimg").css({"margin-top":mt+"px"});
    	});
    	
    </script>
  </head>
  <body>
    <!-- Make sure all your bars are the first things in your <body> -->
    <header class="bar bar-nav" style="border:0">
      <button class="btn pull-left back" onclick="javascript:history.back(-1);"></button>
      <h1 class="title" style="font-family: '微软雅黑'；;font-size: 24px">支付</h1>
    </header>

    <!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
    <div class="content" style="background-color: #32312f">
		<div align="center"><img class="payimg" src="img/payment.png" alt="" style="width: 50%"/></div>
    </div>
  </body>
  <script src="./js/ratchet.js"></script>
</html>