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

<title>叮叮点餐后台管理系统·菜品列表</title>
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
<script src="./js/popup_layer.js"></script>
<script type="text/javascript">
			$(function() {
				p = null;
				$('nav#menu').mmenu();
				
				var w = $(window).width();
				var h = $(window).height();
				var obj = document.getElementById("restable");
				if (w > h) {
					$(".restable").css("width", "100%");
					$(".mdldishimg").css("height", ($(".mdldishimg").width()/1.5)+"px");
					$(".mdldishimg").css("height", ($(".mdldishimg").width()/1.5)+"px");
				} else {
					$(".restable").css({
						"margin-left" : "10px",
						"margin-right" : "10px"
					});
					$("#madpicbox img").css("height", ($("#madpicbox img").width()/1.5)+"px");
				}
				$(".datatr").height((h-$(".header").height())/12);
				
				$(".mdldishbtn.del").click(function(){
					$("#mngdeldishid").val($(this).parent().parent().find(".mngdishid").val());
				});
				
				if(w < h || w < 1000) {
					for(var i=0;i<obj.rows.length;i++)
			        {
			        	obj.rows[i].cells[5].style.display  =  "none";
			        }
					$(".datatr").height((h-$(".header").height())/10);
				}
				if(w < 700) {
					$(".restable td").css("font-size","16px");
				}
				if(w < 400) {
					$(".restable tr").css({"font-size":"18px"});
					$(".edittext").css("display","none");
					$(".deltext").css("display","none");
					$(".mdldishbtn").css("margin-right","0");
					for(var i=0;i<obj.rows.length;i++)
			        {
						obj.rows[i].cells[6].style.width  =  "10%";
			        	obj.rows[i].cells[4].style.display  =  "none";
			        }
					p = new PopupLayer({
						trigger:".mdldishbtn.del",
						popupBlk:"#blk",
						closeBtn:"#blkclose",
						useOverlay:true,
						offsets:{x:-w/1.3,y:-h/40},
					});
				} else {
					p = new PopupLayer({trigger:".mdldishbtn.del",popupBlk:"#blk",closeBtn:"#blkclose",useOverlay:true,offsets:{x:-w/1.8,y:-h/40}});
				}
				
				$("#mngcanceldel").click(function(){
					p.options.useOverlay?p.overlay.hide():null;
					p.options.useFx?p.doEffects("close"):p.popupLayer.hide();
				});
				
				$("#mngconfirmdel").click(function(){
					var dishid = $("#mngdeldishid").val();
					////////////////////////////////////////////////////此处写删除的方法
				});
				
			});
			
		</script>
</head>
<body style="font-family: '微软雅黑'">
	<div id="page">
			<div class="header">
				<a class="menua" href="#menu"></a>
				添加菜品
			</div>
			<div class="content" style="padding: 10px; background: #FEFCF7;">
			<div class="blk" id="blk" style="display:none;width: 250px">
			  <div class="smartdiv">
			  	<div class="blkclose"><img id="blkclose" alt="" src="img/order_return.png" style="height: 40px;margin-right: -20px"></div>
			  	<input type="hidden" id="mngdeldishid" value="">
			  	<div style="line-height: 50px;font-size: 20px">确定删除？</div>
		      	<div style="clear: both;"></div>
		      	<input type="button" class="confirmdelbtn" id="mngconfirmdel" value="确定" style="margin-bottom: 5px;background: #B1A185">
		      	<input type="button" class="confirmdelbtn" id="mngcanceldel" value="取消" style="background: #555">
		      </div>
			</div>
		<div align="center">
			<table class="restable" id="restable" style="text-align: center" cellpadding="1" cellspacing="0">
				<tr style="background: #B1A185;height: 50px">
					<th style="width: 7%"></th>
					<th style="width: 15%">菜品</th>
					<th style="width: 10%">价格</th>
					<th style="width: 10%">口味</th>
					<th style="width: 20%">标签</th>
					<th style="width: 20%">素材</th>
					<th style="width: 18%">操作</th>
				</tr>
				<c:forEach begin="1" end="8" step="1">
				<tr class="datatr">
					<td><img alt="" src="img/dongporou.jpg" class="mdldishimg"/></td>
					<td><input class="mngdishid" type="hidden" value="aa"/>宫保鸡丁</td>
					<td>20</td>
					<td><c:forEach begin="1" end="3" step="1">酸&nbsp;</c:forEach></td>
					<td><c:forEach begin="1" end="3" step="1">推荐&nbsp;</c:forEach></td>
					<td>鸡肉;大葱;</td>
					<td><a href="javascript:void(0)" class="mdldishbtn edit" style="margin-right: 10px"><img alt="" src="img/edit.png" style="height: 18px;vertical-align: middle;"/>
						<span style="vertical-align: middle;" class="edittext">编辑</span></a>
					<a href="javascript:void(0)" class="mdldishbtn del"><img alt="" src="img/del.jpg" style="height: 18px;vertical-align: middle;"/>
						<span style="vertical-align: middle;" class="deltext">删除</span></a>
					</td>
				</tr>
				</c:forEach>
			</table><br>
			<div class="pagebean"><a href="javascript:void(0)" class="pagebeanbtn" id="lastpage">上一页</a>
				<span id="nowpage">1/10</span>
				<a href="javascript:void(0)" class="pagebeanbtn" id="nextpage">下一页</a>
			</div>
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