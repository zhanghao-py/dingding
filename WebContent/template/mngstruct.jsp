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

<title>叮叮点餐后台管理系统·餐厅管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!-- <link href="./css/ratchet.css" rel="stylesheet"> -->
<link href="./css/jquery.mmenu.css" rel="stylesheet">
<link href="./css/demo.css" rel="stylesheet">
<link href="./css/dingding.css" rel="stylesheet">
<script src="./js/jquery-1.11.0.js"></script>
<script src="./js/jquery.mmenu.min.js"></script>
<script src="./js/uploadPreview.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=F40f482bd78db3765c308288e87fe937"></script>
<script type="text/javascript">
			$(function() {
				$('nav#menu').mmenu();
				
				var w = $(window).width();
				var h = $(window).height();
				if (w > h) {
					$(".restitle").css("text-align", "center");
					$(".restable").css("width", "70%");
					$("#restpicbox img").css("height", ($("#restpicbox img").width()/1.5)+"px");
					$("#resuplrestpic").css("margin-top", "80px");
					$("#resuplrestposition").css("margin-top", "80px");
					$(".resdish").css({
						"width" : "23%",
						"float" : "left",
						"padding" : "5px"
					});
					$(".resdish img").css("height", ($(".resdish img").width()/1.5)+"px");
				} else {
					$(".restable").css({
						"margin-left" : "10px",
						"margin-right" : "10px"
					});
					$("#restpicbox img").css("height", ($("#restpicbox img").width()/1.5)+"px");
					$(".resdish").css({
						"width" : "48%",
						"float" : "left",
						"padding" : "5px"
					});
					$(".resdish img").css("height", ($(".resdish img").width()/1.5)+"px");
				}
				$(".resinput").change(function(){
					$("#ischanged").val("1");
				});
				
				$(".resdishprice").change(function(){
					$("#ischanged").val("1");
				});
				
				$(".uglyupl").change(function(){
					$("#ischanged").val("1");
				});
				
				$(".uglyupl1").change(function(){
					$("#ischanged").val("1");
				});
				
				$("#uglyuplrestpic").uploadPreview({ Img: "restpic" });
				for(var i = 1;i <= 4;i++){
					$("#dishuglyupl"+i).uploadPreview({ Img: "resdishpic"+i });
				}
				$("#uglyuplrestposition").uploadPreview({ Img: "resrestposition" });
			});
			
			function checkchange(){
				if($("#ischanged").val() == "0") {
					return false;
				}
				/* var eachimg;
				for(var i = 0; i < document.getElementsByTagName("img").length; i++) {
					eachimg = document.getElementsByTagName("img")[i].src;
					if(eachimg.indexOf("img/nopic.jpg") != -1) {
						return false;
					}
				} */
				return true;
			}
			
			function saveinfo(){
				if(!checkchange()) {
					alert("餐厅信息无变化！");
				} else {
					/********************** 此处写保存餐厅信息代码 **************************/
				}
			}
		</script>
</head>
<body style="font-family: '微软雅黑'">
	<div id="page">
			<div class="header">
				<a href="#menu"></a>
				餐厅管理
			</div>
			<div class="content" style="padding: 10px; background: #FEFCF7;">
			<input type="hidden" id="ischanged" value="0"/>
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
					<td colspan="3" style="font-size: 18px;"><input id="longitude" style="border: 0;width: 23%;background: transparent;vertical-align: middle;" readonly="readonly" value="0">
						<input id="latitude" style="border: 0;width: 23%;background: transparent;vertical-align: middle;" readonly="readonly" value="0">
						<input type="button" value="点击获取" onclick="setattr();" style="color: #fe8302;float:right;width: 45%;border: 1px solid #FEE6BF;background: #FEF9EF">
					</td>
				</tr>
				<tr>
					<td colspan="4" valign="top" style="padding-top: 5px">餐厅图片：</td>
				</tr>
				<tr>
					<td colspan="4" id="restpicbox" style="padding-top: 5px"><div><img id="restpic"
						alt="" src="img/nopic.jpg" style="width: 100%;"></div>
						<div id="uplrestpic">
							<div class="uplbtn">浏览</div>
							<input type="file" class="uglyupl" id="uglyuplrestpic">
						</div>
						</td>
				</tr>
				<tr>
					<td colspan="4">推荐菜品：</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center">
						<div class="resdish">
							<div><img class="resdishpic" alt="" src="img/nopic.jpg" id="resdishpic1"
								style="width: 100%;"></div>
							<div class="upldishpic">
								<div class="uplbtn1" style="margin-bottom: 5px">浏览</div>
								<input type="file" class="uglyupl1" id="dishuglyupl1">
							</div>
							<span style="font-size: 14px; color: #000">价格：<input
								class="resdishprice"
								style="width: 70%; border: 1px solid #FEE6BF"></span>
						</div>
						<div class="resdish">
							<div><img class="resdishpic" alt="" src="img/nopic.jpg" id="resdishpic2"
								style="width: 100%;"></div>
							<div class="upldishpic">
								<div class="uplbtn1" style="margin-bottom: 5px">浏览</div>
								<input type="file" class="uglyupl1" id="dishuglyupl2">
							</div>
							<span style="font-size: 14px; color: #000">价格：<input
								class="resdishprice"
								style="width: 70%; border: 1px solid #FEE6BF"></span>
						</div><div class="resdish">
							<div><img class="resdishpic" alt="" src="img/nopic.jpg" id="resdishpic3"
								style="width: 100%;"></div>
							<div class="upldishpic">
								<div class="uplbtn1" style="margin-bottom: 5px">浏览</div>
								<input type="file" class="uglyupl1" id="dishuglyupl3">
							</div>
							<span style="font-size: 14px; color: #000">价格：<input
								class="resdishprice"
								style="width: 70%; border: 1px solid #FEE6BF"></span>
						</div><div class="resdish">
							<div><img class="resdishpic" alt="" src="img/nopic.jpg" id="resdishpic4"
								style="width: 100%;"></div>
							<div class="upldishpic">
								<div class="uplbtn1" style="margin-bottom: 5px">浏览</div>
								<input type="file" class="uglyupl1" id="dishuglyupl4">
							</div>
							<span style="font-size: 14px; color: #000">价格：<input
								class="resdishprice"
								style="width: 70%; border: 1px solid #FEE6BF"></span>
						</div>
					</td>
				</tr>
				<tr>
				  <td colspan="4" valign="top" style="padding-top: 5px">餐厅地理位置：</td>
				</tr>
				<tr>
					<td colspan="4" id="restpicbox" style="padding-top: 5px"><div><img
						alt="" src="img/nopic.jpg" style="width: 100%;" id="resrestposition"></div>
						<div id="uplrestposition">
							<div class="uplbtn">浏览</div>
							<input type="file" class="uglyupl" id="uglyuplrestposition">
						</div></td>
				</tr>
				<tr style="height:30px"></tr>
				<tr>
				  <td colspan="4" style="text-align: center;"><input type="button" class="saveresinfo" id="saveresinfo" value="保存" onclick="saveinfo()"></td>
				</tr>
			</table>
		</div>
	</div>
			<nav id="menu">
				<ul>
					<li><a href="#">餐厅管理</a></li>
					<li><a href="javascript:void(0)">菜品管理</a>
						<ul>
							<li><a href="#">添加菜品</a></li>
							<li><a href="#">菜品列表</a></li>
						</ul>
					</li>
					<li><a href="javascript:void(0)">用户管理</a>
						<ul>
							<li><a href="#">用户列表</a></li>
						</ul>
					</li>
					<li><a href="javascript:void(0)">订单管理</a>
						<ul>
							<li><a href="#">订单列表</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
</body>
<script type="text/javascript">
	function setattr() {
		var geol;		
		try {
			if (typeof(navigator.geolocation) == 'undefined') {
				geol = google.gears.factory.create('beta.geolocation');
		    } else {
		    	geol = navigator.geolocation;
		    }
		} catch (error) {
			alert(error.message);
		}
		
		if (geol) {
			geol.getCurrentPosition(function(position) {
		
		var nowLatitude = position.coords.latitude;
		var nowLongitude = position.coords.longitude;
		
		$("#longitude").val(nowLongitude.toFixed(2));
		$("#latitude").val(nowLatitude.toFixed(2));
	}, function(error) {
		switch(error.code){
		case error.TIMEOUT :
			alert("连接超时，请重试");
			break;
		case error.PERMISSION_DENIED :
			alert("您拒绝了使用位置共享服务，查询已取消");
			break;
		case error.POSITION_UNAVAILABLE : 
			alert("非常抱歉，我们暂时无法通过浏览器获取您的位置信息");
			break;
		}
	}, {timeout:10000});	//设置十秒超时
		}
	}
</script>
</html>