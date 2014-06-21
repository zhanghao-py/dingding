/**
 * 
 */


$(function(){
	
	  if (typeof String.prototype.endsWith != 'function') {
	       String.prototype.endsWith = function (str){
	          return this.slice(-str.length) == str;
	       };
	     }
	
	var part1 = '<a class="" onclick="choose(this)"><img class="media-object pull-left" src="';
	var part2 = '"><div class="media-body"><div class="dishnm">';
	var part3 = '</div><div class="dishinfo"><div class="dishprice"><span>￥</span><span style="font-size: 20px;color: red">';
	var part4 = '</span><span style="color: red">/份</span></div><div class="dishsell">月销量:<span style="color: #FF6600;font-size: 18px">';
	//var part5 = '<span style="color: #FF6600;font-size: 18px">';
	var part6 = '</span></div><input type="hidden" value="';
	var part7 = '"></div><div class="dishline"></div><div class="dishcomm"><div class="dishcommleft"><div class="branddish"></div><div class="sale"></div><div class="bestsale"></div><div class="healthy"></div></div><div class="dishcommright"><div class="hot"></div><div class="meat"></div><div class="sweat"></div><div class="spicy"></div></div></div></div><div class="chosen" style="display:none"></div></a>';
	
	
	$("#clickmore").click(function(){
		
		var dishNum = $(".table-view").children().length;
		
		var pageNum = Math.floor(dishNum/5)+1;
		
		var categorys = $("#leftmenu").children();
		
		var category = '';
		
		
		for(var i = 0;i < categorys.length;i++){

			if(categorys[i].className.endsWith("active")){
				category = $(categorys[i]).find("input").val();
			}
		}
		
		getDishs(pageNum,category);
		
	});
	
	
	$(".table-view-cell.media").click(function(){

		location.href = "dishPage/dishDetail?dishId="+$(this).find("input").val();
	});
	
	
	/*
	var dishDetil = function(dishId){
		//alert(dishId);
		
		$.ajax({
			type:'get',
			url:'dishPage/dishDetail',
			async:false,
			data:{dishId:dishId},
			sunccess:function(info){
				//if()
				alert('成功');
			}
		});
	};
	*/
	
	/**
	 * 增加菜到订单
	 */
	$("#addToOrder").click(function(){
		
		var dishId = $("#dishId").val();
		
		var num = $("#dishamount").html();
				
		$.ajax({
			type:'POST',
			url:'orders/addDish',
			data:{dishId:dishId,dishNum:num},
			success:function(info){
				if(info.status == 0){
					alert("添加成功！");
				}
			}
		});
	});
	
	
	
	
	/**
	 * 点击菜的种类
	 */
	
	$("#leftmenu").children().click(function(){
		//alert("hahh");
		var categorys = $("#leftmenu").children();
		categorys.attr("class","leftmenuitem");
		$(this).attr("class","leftmenuitem active");
		var pageNum = 1;
		var category = '';
		
		for(var i = 0;i < categorys.length;i++){

			if(categorys[i].className.endsWith("active")){
				category = $(categorys[i]).find("input").val();
			}
		}
		$(".table-view").children().remove();
		getDishs(pageNum,category);
		
	});
	
	/*
	 * 这两种方法也可以监控页面刷新
	window.onbeforeunload = function(){
		alert("something");
	};
	 	
	$(window).unload( function () { 
		var pageNum = 1,
		category = 1;
		//alert("hah");
		getDishs(pageNum,category);
	});
	*/
	$(window).unbind('beforeunload'); 
	$(window).bind('beforeunload',function(){ 
		location.href="dishPage/init";
		}); 
		
	
	
	
	
	var getDishs = function(pageNum,category){
		$.ajax({
			type:"post",
			url:"dishPage/more",
			data:{pageNum:pageNum,category:category},
			success:function(info){

				if(1 == info.status){
					alert("数据加载出错！");
					return;
				}
				if(-1 == info.statusInfo){
					//alert("已经是最后一页！");
					document.getElementById("clickmore").style.display = "none";
				}
				
				var oFrag = document.createDocumentFragment();
				for(var i = 0;i < info.data.length;i++){   		
					var li1 = document.createElement("li");
					li1.className = "table-view-cell media";
					//var html1 = '<a class="" onclick="choose(this)"><img class="media-object pull-left" src="img/kongpaochicken.PNG"><div class="media-body"><div class="dishnm">��������</div><div class="dishinfo"><div class="dishprice"><span>��</span><span style="font-size: 20px;color: red">23</span><span style="color: red">/��</span></div><div class="dishsell">��������<span style="color: #FF6600;font-size: 18px">207</span></div></div><div class="dishline"></div><div class="dishcomm"><div class="dishcommleft"><div class="branddish"></div><div class="sale"></div><div class="bestsale"></div><div class="healthy"></div></div><div class="dishcommright"><div class="hot"></div><div class="meat"></div><div class="sweat"></div><div class="spicy"></div></div></div></div><div class="chosen" style="display:none"></div></a>';
					var html1 = part1+'img/kongpaochicken.PNG'+part2+info.data[i].dishName+part3+info.data[i].price+part4+'207'+part6+info.data[i].dishId+part7;
					li1.innerHTML = html1;
					oFrag.appendChild(li1);
					html1="";
				}
				var more = document.getElementById("displayDish");
				more.appendChild(oFrag);
				var headh = $("header").height();
	    		var navh = $("nav").height();
	    		var newimgh = (document.body.clientHeight-navh-headh)/6;
	    		$("img").innerHeight(newimgh);
	    		
	    		$(".table-view-cell.media").click(function(){
	    			location.href = "dishPage/dishDetail?dishId="+$(this).find("input").val();
	    		});
			}
		});
	};
	
	
	
	$("#toOrderList").click(function(){
		location.href="orders/orderList";
	});
	
	$("#dishfollowmenu").click(function(){
		location.href="dishPage/init";
	});
	
	$("#dishfollowmeat").click(function(){
		location.href="dishPage/init";
	});
	
	$("#dishfollowmaterial").click(function(){
		location.href="dishPage/init";
	});
	
	$("#followmenu").click(function(){
		location.href="dishPage/init";
	});
	
	$("#followmeat").click(function(){
		location.href="dishPage/init";
	});
	
	$("#followmaterial").click(function(){
		location.href="dishPage/init";
	});
	
	
	
	
	
	
});