<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'bdmap.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=F40f482bd78db3765c308288e87fe937"></script>
<script src="js/jquery-1.11.0.js"></script>
</head>

<body>
	<div style="width:100%;height:100%;margin:0 auto" id="allmap"></div>
</body>
<script type="text/javascript">
	$(function(){
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
		
		getmap(nowLongitude,nowLatitude);
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
		
		function getmap(nowLongitude, nowLatitude) {
			var map = new BMap.Map("allmap");   
		    var point = new BMap.Point(nowLongitude, nowLatitude);  // 需要标注的位置的经纬度 
		    map.centerAndZoom(point, 15);  // 中心位置和缩放倍数
		    map.enableScrollWheelZoom();   // 添加滚动轴
		    map.addControl(new BMap.NavigationControl());   // 添加左上角的标尺工具
		    map.addControl(new BMap.NavigationControl());   
		    map.addControl(new BMap.ScaleControl());   
		    map.addControl(new BMap.OverviewMapControl());   
		    map.addControl(new BMap.MapTypeControl());   
		    map.setCurrentCity("北京");
		    var opts = {   
		         width : 180,     // 信息窗口宽度   
		        height: 20,     // 信息窗口高度   
		         title : "您的位置"  // 信息窗口标题  
		    }   
		    var infoWindow = new BMap.InfoWindow("北京工业大学<br/>经度："+nowLongitude.toFixed(3)+" 纬度："+nowLatitude.toFixed(3), opts);  // 创建信息窗口对象   
		    map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口
		    var marker = new BMap.Marker(point);        // 创建标注,即地图上的小红点   
		    map.addOverlay(marker);   
		    var local = new BMap.LocalSearch(map, {
		    	  renderOptions:{map: map, autoViewport:true}
		    	});
		    local.searchNearby("天天餐厅", "北京工业大学");
		}
		});
	</script>
</html>
