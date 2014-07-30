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
    
    <title>叮叮点餐后台管理系统·登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="./css/ratchet.css" rel="stylesheet">
    <link href="./css/dingding.css" rel="stylesheet">
    <script src="./js/jquery-1.11.0.js"></script>
    <script type="text/javascript">
    	$(function(){
    		var w = document.body.clientWidth;
    		var h = document.body.clientHeight;
    		if(w > h) {
    			$(".titlepic").css({"width":"20%","margin-top":"5%"});
    			$(".mngloginblk").css({"width":"30%","margin-top":"3%"});
    			$(".mngloginblk tr").css("height","45px");
    			$(".mnglogina").css({"margin-left":"10px"});
    		}else {
    			$(".titlepic").css({"width":"50%","margin-top":"13%"});
    			$(".mngloginblk").css({"width":"75%","margin-top":"13%"});
    			$(".mnglogina").css({"position":"absolute","bottom":"20px","left":(w/2-80)+"px","width":"150px"});
    		}
    		$(".mngloginipt").css({"border":"1px solid #FEE6BF","border-radius":"15px","height":"30px"});
    	});
    	
    	function loggores(){
    		window.location.href = "mngregister";
    	}
    </script>
  </head>
  <body style="background-color: #fff;font-family: '微软雅黑'">
   <div style="background:none;text-align: center">
     <img alt="" src="img/mainpage_title.png" class="titlepic"/>
     <div align="center"><table class="mngloginblk">
       <tr>
       	<td style="width: 80px" valign="top"><div style="height: 30px;line-height: 30px">用户名</div></td>
       	<td><input type="text" class="mngloginipt" id="mngloginuser"></td>
       </tr><tr>
       	<td valign="top"><div style="height: 30px;line-height: 30px">密&nbsp;&nbsp;&nbsp;码</div></td>
       	<td><input type="text" class="mngloginipt" id="mngloginpsw"></td>
       	</tr>
       </table>
       <input type="button" class="mngloginbtn" id="mngloginbtn" value="登录">
       <a href="javascript:void(0)" onclick="loggores()" class="mnglogina">还未创建餐厅？</a>
     </div>
   </div>
   <div class="bgpic"><img alt="" src="img/mngbg.jpg"/></div>
  </body>
  <script src="./js/ratchet.js"></script>
</html>