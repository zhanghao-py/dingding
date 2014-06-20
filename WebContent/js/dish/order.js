
/**
 *  订单操作 
 */


$(function(){
	
	/**
	 * 增加订单
	 */
	$("#orderSubmit").click(function(){
		location.href="orders/addOrder";
	});
	
	/**
	 * 加载更多订单
	 */
	
	var part1 = '<div class="allorderinfo"><span class="allordername">';
	var part2 = '</span><br /><span class="allordertotalprice">总计 <spanclass="allorderprice">';
	var part3 = '</span>元</span></div><div class="allorderbtm"><span class="allorderdate"><p>';
	var part4 = '</p></span>';
	var part5 = '<input class="paybtn" type="button" value="已支付" disabled="disabled" /></div>';
	var part6 = '<input class="nopaybtn" type="button" value="待支付" /></div>';
	$("#orderclickmore").click(function(){
		var orders = $(".allorderlistbg").length;
		
		var pageNum = (orders/5)+1;
		
		loadMoreOrders(pageNum);
		
	});
	
	var loadMoreOrders = function(pageNum,userId){
		
		$.ajax({
			type:"post",
			url:"orders/moreOrders",
			data:{pageNum:pageNum},
			success:function(info){
				if(info.ststus == 1){
					alert("数据加载出错！");
					return;
				}
				if(-1 == info.statusInfo){
					//alert("已经是最后一页！");
					document.getElementById("orderclickmore").style.display = "none";
				}
				var oFrag = document.createDocumentFragment();
				
				for(var i = 0;i < info.data.length;i++){
					var divNode = document.createElement("div");
					divNode.className = "allorderlistbg";
					var html = part1+info.data[i].restName+part2+info.data[i].totalPrice+part3
					+info.data[i].cTime+part4;
					if(info.data[i].state == 1)
						 html = html + part5;
					else
						html = html + part6;
						
					divNode.innerHTML = html;
					oFrag.appendChild(divNode);
					html="";
				}
				var more = document.getElementById("ordersContent");
				more.appendChild(oFrag);
				var headh = $("header").height();
				$(".allorderlistbg").height((document.body.Height - headh) / 5);
			}
		});
		
	};
	
	
});