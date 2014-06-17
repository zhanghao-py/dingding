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
    		var aw = $(".tab-item").width();
    		$(".menudiv").innerWidth(aw);
    		$(".menudiv").css({"display":"none"});
    		
    		$("#smadddish").unbind("click"); //防止多次绑定。
	    	$("#smadddish").click(function() {
	    		$("#smreducedish").attr("class","reducedish active");
	    		var newamount = Number($("#smamount").html()) + 1;
	    		$("#smamount").html(newamount);
	    		$("#smpreducedish").attr("class","reducedish active");
	    		var pnewamount = Number($("#smpamount").html()) + 30;
	    		$("#smpamount").html(pnewamount);
	    	});
	    	
	    	$("#smreducedish").unbind("click"); //防止多次绑定。
	    	$("#smreducedish").click(function() {
	    		if($("#smreducedish").attr("class") == "reducedish") {
	    			
	    		} else {
	    			if($("#smamount").html() == "2") {
	    				$("#smreducedish").attr("class","reducedish");
	    			}
	    			var newamount = Number($("#smamount").html()) - 1;
		    		$("#smamount").html(newamount);
		    		var pnewamount;
		    		if((Number($("#smpamount").html())-30) <= (Number($("#smamount").html())*15)) {
		    			pnewamount= Number($("#smamount").html())*15;
			    		$("#smpamount").html(pnewamount);
			    		$("#smpreducedish").attr("class","reducedish");
		    		} else {
		    			pnewamount= Number($("#smpamount").html()) - 30;
			    		$("#smpamount").html(pnewamount);
		    		}
		    		
	    		}
	    	});
	    	
	    	$("#smpadddish").unbind("click"); //防止多次绑定。
	    	$("#smpadddish").click(function() {
	    		$("#smpreducedish").attr("class","reducedish active");
	    		var newamount = Number($("#smpamount").html()) + 5;
	    		$("#smpamount").html(newamount);
	    	});
	    	
	    	$("#smpreducedish").unbind("click"); //防止多次绑定。
	    	$("#smpreducedish").click(function() {
	    		if($("#smpreducedish").attr("class") == "reducedish") {
	    			
	    		} else {
	    			if($("#smpamount").html() == (String)(Number($("#smamount").html())*15+5) ) {
	    				$("#smpreducedish").attr("class","reducedish");
	    			}
	    			var newamount = Number($("#smpamount").html()) - 5;
		    		$("#smpamount").html(newamount);
	    		}
	    	});
	    	
	    	$(".smcbbox img").unbind("click");
	    	$(".smcbbox img").click(function() {
	    		if($(this).attr("src") == "img/noopsyche_yes.png") {
	    			$(this).attr("src","img/noopsyche_no.png");
	    		} else {
	    			$(this).attr("src","img/noopsyche_yes.png");
	    		}
	    	});
    	});
    	
    	function showmenu() {
    		$(".menudiv").slideToggle(50);
    	}
    	
    </script>
  </head>
  <body>
    <!-- Make sure all your bars are the first things in your <body> -->
    <header class="bar bar-nav" style="border:0">
      <button class="btn pull-left back"></button>
      <h1 class="title" style="font-family: '微软雅黑'；;font-size: 24px">智能点餐</h1>
    </header>

    <!-- Wrap all non-bar HTML in the .content div (this is actually what scrolls) -->
    <div class="content">
      <div class="smarthomediv">
        <div class="smartdiv">
        	<div style="float: left;margin-right: 20px;">人数</div>
        	<div class="reducedish" id="smreducedish"></div>
      	    <div id="smamount" style="float: left;margin-left: 20px;margin-right: 20px;">1</div>
      	    <div class="adddish active" id="smadddish"></div>
      	</div>
      	<div class="smartdiv">
        	<div style="float: left;margin-right: 20px;">总计</div>
        	<div class="reducedish active" id="smpreducedish"></div>
      	    <div style="float: left;margin-left: 15px;margin-right: 15px;">￥<span id="smpamount">30</span></div>
      	    <div class="adddish active" id="smpadddish"></div>
      	</div>
      	<div class="smartdiv" style="height: auto;border: 0">
      		<div style="float: left;margin-right: 20px;line-height: 25px;">忌口</div>
      		<div style="line-height: 30px;margin-top: 15px;">
      		<table class="smcbbox">
      		  <tr>
      		    <td><input id="littlespicy" type="checkbox" class="smartdivcb"/>
      		      <label for="littlespicy" style="vertical-align: middle"><img alt="" src="img/noopsyche_no.png"></label>&nbsp;微辣
      		    </td>
      		    <td><input id="noonion" type="checkbox" class="smartdivcb"/>
      		      <label for="noonion" style="vertical-align: middle"><img alt="" src="img/noopsyche_no.png"></label>&nbsp;无葱
      		    </td>
      		  </tr><tr>
      		    <td><input id="nospicy" type="checkbox" class="smartdivcb"/>
      		      <label for="nospicy" style="vertical-align: middle"><img alt="" src="img/noopsyche_no.png"></label>&nbsp;无辣
      		    </td>
      		    <td><input id="nokelp" type="checkbox" class="smartdivcb"/>
      		      <label for="nokelp" style="vertical-align: middle"><img alt="" src="img/noopsyche_no.png"></label>&nbsp;无海带
      		    </td>
      		  </tr><tr>
      		    <td><input id="nosugar" type="checkbox" class="smartdivcb"/>
      		      <label for="nosugar" style="vertical-align: middle"><img alt="" src="img/noopsyche_no.png"></label>&nbsp;无糖
      		    </td>
      		    <td><input id="nocaraway" type="checkbox" class="smartdivcb"/>
      		      <label for="nocaraway" style="vertical-align: middle"><img alt="" src="img/noopsyche_no.png"></label>&nbsp;无香菜
      		    </td>
      		  </tr><tr>
      		    <td><input id="nogarlic" type="checkbox" class="smartdivcb"/>
      		      <label for="nogarlic" style="vertical-align: middle"><img alt="" src="img/noopsyche_no.png"></label>&nbsp;无蒜
      		    </td>
      		    <td><input id="nocarrot" type="checkbox" class="smartdivcb"/>
      		      <label for="nocarrot" style="vertical-align: middle"><img alt="" src="img/noopsyche_no.png"></label>&nbsp;无胡萝卜
      		    </td>
      		  </tr>
      		  
      		</table>
      	</div>
      </div>
    </div>
    <div align="center"><input type="button" class="smarthomebtn" value="确认"/></div>
    <nav class="bar bar-tab">
      <a class="tab-item" href="javascript(void(0))" onclick="showmenu()">
        <span class="icon order"></span>
        <span class="tab-label">点餐模式</span>
        <div class="menudiv" id="smfollowmenu" style="bottom:139px;">按菜单</div>
    	<div class="menudiv" id="smfollowmeat" style="bottom:99px;">按荤素</div>
    	<div class="menudiv" id="smfollowmaterial" style="bottom:59px">按食材</div>
      </a>
      <a class="tab-item active" href="javascript(void(0))">
        <span class="icon noopsyche"></span>
        <span class="tab-label">智能点餐</span>
      </a>
      <a class="tab-item" href="javascript(void(0))">
        <span class="icon history"></span>
        <span class="tab-label">历史点餐</span>
      </a>
      <a class="tab-item" href="javascript(void(0))">
        <span class="icon discovery"></span>
        <span class="tab-label">餐厅发现</span>
      </a>
    </nav>
  </body>
  <script src="./js/ratchet.js"></script>
</html>