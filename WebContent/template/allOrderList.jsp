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
    		var headh = $("header").height();
    		$(".allorderlistbg").height((document.body.Height-headh)/5);
    	});
    	
    </script>
  </head>
  <%
  	List a = new ArrayList();
  	a.add("北京工业大学天天餐厅");
  	a.add("速度家常菜");
  	a.add("没名儿生煎");
  	a.add("巫山烤鱼");
  	a.add("海碗居炸酱面");
  	String b = "no";
  	request.setAttribute("a",a);
  	request.setAttribute("b",b);
  %>
  <body style="background-color: #eee">
    <!-- Make sure all your bars are the first things in your <body> -->
    <header class="bar bar-nav">
      <button class="btn pull-left back"></button>
      <h1 class="title" style="font-family: '微软雅黑'；;font-size: 24px">全部订单</h1>
    </header>

    <!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
    <div class="content" style="padding-bottom: 55px;">
      <c:forEach items="${a }" var="restr" varStatus="st">
      	<div class="allorderlistbg">
      	  <div class="allorderinfo">
      	    <span class="allordername"><c:out value="${restr }"/></span><br/>
      	    <span class="allordertotalprice">总计 <span class="allorderprice">100</span>元</span>
      	  </div>
      	  <div class="allorderbtm">
      	    <span class="allorderdate">2014-6-10 14:00</span>
      	    <c:choose>
      	      <c:when test="${b == 'no' }">
      	    	<input class="paybtn" type="button" value="已支付" disabled="disabled"/>
      	      </c:when><c:otherwise>
      	    	<input class="nopaybtn" type="button" value="待支付"/>
      	      </c:otherwise>
      	    </c:choose>
      	  </div>
      	</div>
      </c:forEach>
      <div class="loadmore" id="orderclickmore">≡ 点击加载更多订单...</div>
    </div>
  </body>
  <script src="./js/ratchet.js"></script>
</html>