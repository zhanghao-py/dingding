<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>叮叮点餐_全部订单</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link href="./css/ratchet.css" rel="stylesheet">
<link href="./css/dingding.css" rel="stylesheet">
<script src="./js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="./js/dish/order.js"></script>
<!-- <script type="text/javascript" src="js/thumbs.0.6.0.js"></script> -->
<script type="text/javascript">
	$(function() {
		var headh = $("header").height();
		$(".allorderlistbg").height((document.body.Height - headh) / 5);
	});
</script>
</head>
<body style="background-color: #eee">
	<!-- Make sure all your bars are the first things in your <body> -->
	<header class="bar bar-nav">
	<button class="btn pull-left back" onclick="javascript:history.back(-1);"></button>
	<h1 class="title" style="font-family: '微软雅黑' ；; font-size: 24px">全部订单</h1>
	</header>

	<!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
	<div class="content" style="padding-bottom: 55px;">
		<div id="ordersContent">
		<c:forEach items="${orders}" var="order" varStatus="st">
			<div class="allorderlistbg">
				<div class="allorderinfo">
					<span class="allordername"><c:out value="${order.restName }" /></span><br />
					<span class="allordertotalprice">总计 <span
						class="allorderprice"><c:out value="${order.totalPrice}"></c:out></span>元
					</span>
				</div>
				<div class="allorderbtm">
					<span class="allorderdate"><p><c:out value="${order.cTime}"></c:out></p></span>
					<c:choose>
						<c:when test="${order.state == 1 }">
							<input class="paybtn" type="button" value="已支付"disabled="disabled" />
						</c:when>
						<c:otherwise>
							<input class="nopaybtn" type="button" value="待支付" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:forEach>
		</div>
		<div class="loadmore" id="orderclickmore">≡ 点击加载更多订单...</div>
	</div>
</body>
<script src="./js/ratchet.js"></script>
</html>