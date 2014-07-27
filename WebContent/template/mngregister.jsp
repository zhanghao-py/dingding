<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">

<title>叮叮点餐后台管理系统·注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link href="./css/ratchet.css" rel="stylesheet">
<link href="./css/dingding.css" rel="stylesheet">
<script src="./js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(function() {
		var w = document.body.clientWidth;
		var h = document.body.clientHeight;
		if (w > h) {
			$(".restitle").css("text-align", "center");
			$(".restable").css("width", "70%");
			$("#restpicbox").css("width", "50%");
			$("#restpicbox img").css("height", "250px");
			$("#resuplrestpic").css("margin-top", "80px");
			$("#resuplrestposition").css("margin-top", "80px");
			$(".resdish").css({
				"width" : "25%",
				"float" : "left",
				"padding" : "5px"
			});
			$(".resdish img").css("height", "140px");
		} else {
			$(".restable").css({
				"margin-left" : "10px",
				"margin-right" : "10px"
			});
			$("#restpicbox").css("width", "50%");
			$("#restpicbox img").css("height", "110px");
			$(".resdish").css({
				"width" : "50%",
				"float" : "left",
				"padding" : "5px"
			});
			$(".resdish img").css("height", "100px");
		}
	});
</script>
</head>
<body style="background-color: #fff; font-family: '微软雅黑'">
	<header class="bar bar-nav" style="height:50px;line-height:50px">
      <h1 class="title" style="font-family: '微软雅黑';font-size: 30px">注册餐厅信息</h1>
    </header>
	<div class="content" style="padding: 10px; padding-top:35px;background: #FEF3DF;">
		<div align="center">
			<table class="restable">
				<tr>
					<td style="width: 90px">名称：</td>
					<td colspan="3"><input id="resrestname" class="resinput" /></td>
				</tr>
				<tr>
					<td>地址：</td>
					<td colspan="3"><input id="resrestaddr" class="resinput" /></td>
				</tr>
				<tr>
					<td>电话：</td>
					<td colspan="3"><input id="resresttel" class="resinput" /></td>
				</tr>
				<tr>
					<td>经纬度：</td>
					<td colspan="3"><jsp:include page="bdmap.jsp"></jsp:include></td>
				</tr>
				<tr>
					<td colspan="2" valign="top" style="padding-top: 5px">餐厅图片：<br>
						<input type="button" class="uplbtn" id="resuplrestpic" value="上传">
						<div id="uplrestpic">
							<div class="uplbtn">浏览</div>
							<input type="file" class="uglyupl" id="uglyuplrestpic">
						</div></td>
					<td colspan="2" id="restpicbox" style="padding-top: 5px"><img
						alt="" src="img/nopic.jpg" style="width: 100%;"></td>
				</tr>
				<tr>
					<td colspan="4">推荐菜品：</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center">
					<c:forEach begin="1" end="4" step="1">
						<div class="resdish">
							<img class="resdishpic" alt="" src="img/nopic.jpg"
								style="width: 100%; margin-bottom: 5px"> <span
								style="font-size: 14px; color: #000">价格：<input
								class="resdishprice"
								style="width: 70%; border: 1px solid #FEE6BF"></span>
							<input type="button" class="uplbtn1" value="上传">
							<div class="upldishpic">
								<div class="uplbtn1" style="float: right">浏览</div>
								<input type="file" class="uglyupl1">
							</div>
						</div>
					</c:forEach>
					</td>
				</tr>
				<tr>
				  <td colspan="2" valign="top" style="padding-top: 5px">餐厅地理位置：<br>
						<input type="button" class="uplbtn" id="resuplrestposition" value="上传">
						<div id="uplrestposition">
							<div class="uplbtn">浏览</div>
							<input type="file" class="uglyupl" id="uglyuplrestposition">
						</div></td>
					<td colspan="2" id="restpicbox" style="padding-top: 5px"><img
						alt="" src="img/nopic.jpg" style="width: 100%;"></td>
				</tr>
				<tr style="height:10px"></tr>
				<tr>
				  <td colspan="4" style="text-align: center;"><input type="button" class="saveresinfo" id="saveresinfo" value="保存"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script src="./js/ratchet.js"></script>
</html>