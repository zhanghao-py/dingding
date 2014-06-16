package cn.edu.bjut.weichat.demo.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.bjut.weichat.core.bo.Dish;
import cn.edu.bjut.weichat.core.web.action.BaseAction;
import cn.edu.bjut.weichat.dish.service.DishService;




@Controller
@RequestMapping("/other")
public class DemoAction2 extends BaseAction {

	@Autowired
	private DishService dishService;
	
	@RequestMapping("/index")
	public ModelAndView getDishName(){
		
		//Dish dish = dishService.selectDishByName("宫保鸡丁").get(0);
		Dish dish = dishService.selectDishByRestIdAndCategory(100000, 1,1,5).get(0);
		System.out.println(dish.getDishName());
		
		return new ModelAndView("index","list",dish);
	}
	
	
	@RequestMapping("/orderList")
	public ModelAndView getOrderList(){
		
		return new ModelAndView("orderList");
	}
}
