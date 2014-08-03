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

<title>叮叮点餐后台管理系统·编辑菜品</title>
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
<script type="text/javascript">
			$(function() {
				$('nav#menu').mmenu();
				
				var w = $(window).width();
				var h = $(window).height();
				if (w > h) {
					$(".restable").css("width", "70%");
					$("#medpicbox img").css("height", ($("#medpicbox img").width()/1.5)+"px");
				} else {
					$(".restable").css({
						"margin-left" : "10px",
						"margin-right" : "10px"
					});
					$("#medpicbox img").css("height", ($("#medpicbox img").width()/1.5)+"px");
				}
				
				if(w < 600) {
					$(".mngadddishcb").css("width","45%");
				}
				
				$(".resinput").change(function(){
					$("#ischanged").val("1");
				});
				
				$(".mngadddishcb input").change(function(){
					$("#ischanged").val("1");
				});
				
				$(".uglyupl").change(function(){
					$("#ischanged").val("1");
				});
				
				$("#uglyuplmeddishpic").uploadPreview({ Img: "meddishpic" });
			});
			
			function checkchange(){
				if($("#ischanged").val() == "0") {
					return false;
				}
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
				<a class="menua" href="#menu"></a>
				编辑菜品
			</div>
			<div class="content" style="padding: 10px; background: #FEFCF7;">
			<input type="hidden" id="ischanged" value="0"/>
		<div align="center">
			<table class="restable">
				<tr>
					<td style="width: 70px">名称：</td>
					<td><input id="meddishname" class="resinput" value=""/></td>
				</tr>
				<tr>
					<td>价格：</td>
					<td><input id="meddishprice" class="resinput" value=""/></td>
				</tr>
				<tr>
					<td>口味：</td>
					<td><div class="mngadddishcb"><input id="meddishtaste1" type="checkbox" style="vertical-align: middle"/>
      		      	<label for="meddishtaste1" style="vertical-align: middle;font-size: 14px">酸</label></div>
      		      	<div class="mngadddishcb"><input id="meddishtaste2" type="checkbox" style="vertical-align: middle"/>
      		      	<label for="meddishtaste2" style="vertical-align: middle;font-size: 14px">甜</label></div>
      		      	<div class="mngadddishcb"><input id="meddishtaste3" type="checkbox" style="vertical-align: middle"/>
      		      	<label for="meddishtaste3" style="vertical-align: middle;font-size: 14px">辣</label></div>
      		      	<div class="mngadddishcb"><input id="meddishtaste4" type="checkbox" style="vertical-align: middle"/>
      		      	<label for="meddishtaste4" style="vertical-align: middle;font-size: 14px">荤</label></div></td>
				</tr>
				<tr>
					<td>标签：</td>
					<td><div class="mngadddishcb"><input id="meddishtag1" type="checkbox" style="vertical-align: middle"/>
      		      	<label for="meddishtag1" style="vertical-align: middle;font-size: 14px">推荐</label></div>
      		      	<div class="mngadddishcb"><input id="meddishtag2" type="checkbox" style="vertical-align: middle"/>
      		      	<label for="meddishtag2" style="vertical-align: middle;font-size: 14px">健康</label></div>
      		      	<div class="mngadddishcb"><input id="meddishtag3" type="checkbox" style="vertical-align: middle"/>
      		      	<label for="meddishtag3" style="vertical-align: middle;font-size: 14px">促销</label></div>
      		      	<div class="mngadddishcb"><input id="meddishtag4" type="checkbox" style="vertical-align: middle"/>
      		      	<label for="meddishtag4" style="vertical-align: middle;font-size: 14px">人气</label></div></td>
				</tr>
				<tr>
					<td valign="top">图片：</td>
					<td colspan="4" id="medpicbox" style="padding-top: 5px"><div><img id="meddishpic"
						alt="" src="img/nopic.jpg" style="width: 100%;"></div>
						<div id="uplmeddishpic">
							<div class="uplbtn">浏览</div>
							<input type="file" class="uglyupl" id="uglyuplmeddishpic" value="">
						</div>
					</td>
				</tr>
				<tr>
					<td>素材：</td>
					<td colspan="4"><input id="meddishmt" class="resinput" value="" placeholder="每个食材用;（半角）分开"/></td>
				</tr>
				<tr style="height:20px"></tr>
				<tr>
				  <td colspan="5" style="text-align: center;"><input type="button" class="saveresinfo" id="savemedinfo" value="保存" onclick="saveinfo()"></td>
				</tr>
			</table>
		</div>
	</div>
			<nav id="menu">
				<ul>
					<li><a>XXX，您好！</a></li>
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
					<li><a href="javascript:void(0)" id="exit">退出</a></li>
				</ul>
			</nav>
		</div>
</body>
</html>