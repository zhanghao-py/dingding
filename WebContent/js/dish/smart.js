/**
 * 智能点餐模块
 */

$(function(){
	
	
	
	$("#smartSureButton").unbind("click");
	$("#smartSureButton").click(function(){
		var person = 1;
		
		var money = 30;
		
		var littlespicy = false,noonion = false, nospicy = false,nokelp = false,nosugar = false,nocaraway = false,nogarlic = false,nocarrot = false;
		
		if($("#smamount")){
			person = parseInt($("#smamount").html());
		}
		if($("#smpamount")){
			money = parseInt($("#smpamount").html());
		}
		if($("#littlespicy").prop("checked")){
			littlespicy = true;
		}
		if($("#noonion").prop("checked")){
			noonion = true;
		}
		if($("#nospicy").prop("checked")){
			nospicy = true;
		}
		if($("#nokelp").prop("checked")){
			nokelp = true;
		}
		if($("#nosugar").prop("checked")){
			nosugar = true;
		}
		if($("#nogarlic").prop("checked")){
			nogarlic = true;
		}
		if($("#nocaraway").prop("checked")){
			nocaraway = true;
		}
		if($("#nocarrot").prop("checked")){
			nocarrot = true;
		}
							
		var smartChoice = new SmartChoose(person, money, littlespicy, noonion, nospicy, nokelp, nosugar, nocaraway, nogarlic, nocarrot);
		
		
		var smart = JSON.stringify(smartChoice);
		
		$.ajax({
	
		});
		
		location.href = "smart/detail?smartChoice="+smart;
		
		
	});
	
	
	
	
	/**
	 * 将菜加入到订单中
	 */
	
	$("#smAddToOrder").click(function(){
		
		var dishId = $("#smDishId").val();
		
		var num = $("#ndishamount").html();
		
		alert("添加成功！");
				
//		$.ajax({
//			type:'POST',
//			url:'smart/addDish',
//			data:{dishId:dishId,dishNum:num},
//			success:function(info){
//				if(info.status == 0){
//					alert("添加成功！");
//				}
//			}
//		});
	});
	
	
	/**
	 * 同类菜品查找
	 */
	$("#samematerial").click(function(){
		var material = $("#sameMat").val();
		
		location.href = "smart/sameMat?material="+material;
	});
	
	
	/**
	 * 
	 */
	$("#postSmartOrder").click(function(){
		location.href = "smart/addOrder";
	});
	
	
	var SmartChoose = function(person,money,littlespicy,noonion,nospicy,nokelp,nosugar,nocaraway,nogarlic,nocarrot){
		this.person = person;
		this.money = money;
		this.littlespicy = littlespicy;
		this.noonion = noonion;
		this.nospicy = nospicy;
		this.nokelp =  nokelp;
		this.nosugar = nosugar;
		this.nocaraway = nocaraway;
		this.nogarlic = nogarlic;
		this.nocarrot = nocarrot;
	};
	
});