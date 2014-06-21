/**
 * 历史点餐记录
 */

$(function(){
	
	var part1 = '<a class=""><img class="media-object pull-left" src="';
	var part2 = '"><div class="media-body"><div class="dishnm">';
	var part3 = '</div><div class="dishinfo"><div class="dishprice"><span>￥</span><span style="font-size: 20px;color: red">';
	var part4 = '</span><span style="color: red">/份</span></div><div class="dishsell">已点<span style="color: #FF6600;font-size: 18px" class="orderamount">';
	var part5 = '</span>次</div><input type="hidden" value="';
	var part6 = '"></div><div class="dishline"></div><div class="dishcomm"><div class="dishcommleft"><div class="branddish"></div><div class="sale"></div>';
    var part7 = '<div class="bestsale"></div><div class="healthy"></div></div><div class="dishcommright"><div class="hot"></div><div class="meat"></div><div class="sweat"></div><div class="spicy"></div></div></div></div><div class="chosen" style="display:none"></div></a>';
	
    
    $("#historyclickmore").click(function(){
    	var lis = $(".table-view-cell.media");
    	var num = 0;
    	var str = "";
    	
    	for(var i = 0;i < lis.length;i++){
    		str = $(lis[i]).find(".orderamount").html();
    		num += parseInt(str);
    	}
    	
    	//alert(num);
    	
    	var pageNum = (num/5)+1;
    	
    	loadMore(pageNum);
    	
    	
    });
    
    
	
	var loadMore = function(pageNum,restId,userId){//写好参数，方便后续的扩展使用
		
		
		$.ajax({
			type:"post",
			url:"history/more",
			data:{pageNum:pageNum},
			success:function(info){
				
				console.log(info);
				
				
				if(1 == info.status){
					alert("数据加载出错！");
					return;
				}
				if(-1 == info.statusInfo){
					//alert("已经是最后一页！");
					document.getElementById("historyclickmore").style.display = "none";
				}
				
				var oFrag = document.createDocumentFragment();
				for(var i in info.data){
					var li1 = document.createElement("li");
					li1.className = "table-view-cell media";
					var html = part1+info.data[i].imageUrl+part2+i+part3+info.data[i].price+part4
					+info.data[i].numOfOrder+part5+info.data[i].dishId+part6+part7;
					li1.innerHTML = html;
					oFrag.appendChild(li1);
					html = "";
				}
				var more = document.getElementById("historyDish");
				more.appendChild(oFrag);
				var headh = $("header").height();
	    		var newimgh = (document.body.clientHeight-headh)/8;
	    		$("img").innerHeight(newimgh);
				
			}
		});
		
	};
});