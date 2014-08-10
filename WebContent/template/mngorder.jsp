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

<title>叮叮点餐后台管理系统·订单列表</title>
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
				p1 = null;
				$('nav#menu').mmenu();
				
				var w = $(window).width();
				var h = $(window).height();
				if (w > h) {
					$(".restable").css("width", "100%");
				} else {
					$(".restable").css({
						"width":"100%"
						/* "margin-left" : "10px",
						"margin-right" : "10px" */
					});
				}
				$(".datatr").height((h-$(".header").height())/12);
				
				$(".mdldishbtn.del").click(function(){
					$("#mngdelorderid").val($(this).parent().parent().find(".mngorderid").val());
				});
				
				if(w < h || w < 1000) {
					/* for(var i=0;i<obj.rows.length;i++)
			        {
			        	obj.rows[i].cells[5].style.display  =  "none";
			        } */
					$(".datatr").height((h-$(".header").height())/10);
				}
				if(w < 700) {
					$(".restable td").css("font-size","16px");
				}
				if(w < 400) {
					$(".restable tr").css({"font-size":"18px"});
					$(".restable th").css({"font-size":"16px"});
					$(".deltext").css("display","none");
					/* for(var i=0;i<obj.rows.length;i++)
			        {
						obj.rows[i].cells[6].style.width  =  "10%";
			        	obj.rows[i].cells[4].style.display  =  "none";
			        } */
					p = new PopupLayer({
						trigger:".mdldishbtn.del",
						popupBlk:"#blk",
						closeBtn:"#blkclose",
						useOverlay:true,
						offsets:{x:-w/1.3,y:-h/40},
					});
			        $("#blk1").css("width","80%");
			        $(".orderdishbox").css("height","300px");
				} else {
					p = new PopupLayer({trigger:".mdldishbtn.del",popupBlk:"#blk",closeBtn:"#blkclose",useOverlay:true,offsets:{x:-w/1.8,y:-h/40}});
					$("#blk1").css("width","90%");
					$(".orderdishimg").css("width","10%");
				}
				
				p1 = new PopupLayer({
					trigger:".datatd",
					popupBlk:"#blk1",
					closeBtn:"#blkclose1",
					useOverlay:true,
					offsets:{x:w/38,y:-130}
				});
				
				$("#mngcanceldel").click(function(){
					p.options.useOverlay?p.overlay.hide():null;
					p.options.useFx?p.doEffects("close"):p.popupLayer.hide();
				});
				
				$("#mngconfirmdel").click(function(){
					var orderid = $("#mngdelorderid").val();
					////////////////////////////////////////////////////此处写删除所选订单的方法
				});
				
				if($("#nowpagecount").val() == "1") {
					$("#lastpage").css("visibility","hidden");
				}
				if($("#nowpagecount").val() == $("#totalpagecount").val()) {
					$("#nextpage").css("visibility","hidden");
				}
				
				$(".datatr").mousedown(function(){
					$(this).css("background","#ddd");
				});
				$(".datatr").mouseup(function(){
					$(this).css("background","transparent");
				});
				$(".datatr").click(function(){
					/////////////////////////////////////////此处需要写ajax，根据选择的用户ID查询该用户该订单的菜品详细信息，结果返回到ID为blk1的div中
				});
				
				$(".mdldishbtn.deldish").click(function(){
					/////////////////////////////////////////此处写删除弹出窗口中菜品的方法
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
			  	<input type="hidden" id="mngdelorderid" value="">
			  	<div style="line-height: 50px;font-size: 20px">确定删除？</div>
		      	<div style="clear: both;"></div>
		      	<input type="button" class="confirmdelbtn" id="mngconfirmdel" value="确定" style="margin-bottom: 5px;background: #B1A185">
		      	<input type="button" class="confirmdelbtn" id="mngcanceldel" value="取消" style="background: #555">
		      </div>
			</div>
			<div class="blk" id="blk1" style="display:none;">
			  <div class="smartdiv">
			  	<div class="blkclose"><img id="blkclose1" alt="" src="img/order_return.png" style="height: 40px;margin-right: -20px"></div>
			  	<input type="hidden" id="mngorderuserid" value="">
			  	<div class="boxtitle"><b>客户：</b>雷俊俊</div>
			  	<div class="boxtitle"><b>总计：</b>200元</div>
			  	<div class="boxtitle"><b>状态：</b>未支付</div>
			  	<div class="boxtitle"><b>时间：</b>2014-7-2 12:13</div>
		      	<div style="clear: both;"></div><br>
		      	<div class="orderdishbox" style="height: 450px;overflow: auto;">
		      	<table class="restable" id="restable" style="text-align: center" cellpadding="1" cellspacing="0">
		      	<c:forEach begin="1" end="8" step="1">
		      		<tr>
		      		<td class="orderdishimg" style="width: 15%"><img alt="" src="img/dongporou.jpg" class="mdldishimg"/></td>
					<td style="width: 25%"><input class="mngdishid" type="hidden" value="aa"/>宫保鸡丁</td>
					<td style="width: 20%">20</td>
					<td style="width: 20%">1份</td>
					<td style="width: 20%"><a href="javascript:void(0)" class="mdldishbtn deldish"><img alt="" src="img/del.jpg" style="height: 18px;vertical-align: middle;"/>
						<span style="vertical-align: middle;" class="deltext">删除</span></a><!-- 弹出窗口中点击删除不提示，直接删除 -->
					</td>
		      		</tr>
		      	</c:forEach>
		      	</table></div>
		      </div>
			</div>
		<div align="center">
			<table class="restable" id="usertable" style="text-align: center" cellpadding="1" cellspacing="0">
				<tr style="background: #B1A185;height: 50px">
					<th style="width: 15%">订单号</th>
					<th style="width: 20%">客户姓名</th>
					<th style="width: 20%">下单时间</th>
					<th style="width: 18%">总计</th>
					<th style="width: 15%">状态</th>
					<th style="width: 12%">操作</th>
				</tr>
				<c:forEach begin="1" end="8" step="1">
				<tr class="datatr">
					<td class="datatd">110105</td>
					<td class="datatd"><input class="mngorderid" type="hidden" value="aa"/>雷俊俊</td>
					<td class="datatd">2014-7-2 12:13</td>
					<td class="datatd">1200元</td>
					<td class="datatd">未支付</td>
					<td><a href="javascript:void(0)" class="mdldishbtn del"><img alt="" src="img/del.jpg" style="height: 18px;vertical-align: middle;"/>
						<span style="vertical-align: middle;" class="deltext">删除</span></a>
					</td>
				</tr>
				</c:forEach>
			</table><br>
			<div class="pagebean"><a href="javascript:void(0)" class="pagebeanbtn" id="lastpage">上一页</a>
				<span id="nowpage">1/10</span>
				<a href="javascript:void(0)" class="pagebeanbtn" id="nextpage">下一页</a>
			</div>
			<input type="hidden" id="nowpagecount" value="1"/>
			<input type="hidden" id="totalpagecount" value="10"/><!-- 两个input的value改为后台传的值 -->
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