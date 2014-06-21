package cn.edu.bjut.weichat.core.web.action.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.bjut.weichat.core.web.action.BaseAction;
import cn.edu.bjut.weichat.dao.bean.DishDetail;
import cn.edu.bjut.weichat.dao.bean.RestraurantInfo;
import cn.edu.bjut.weichat.dish.service.RestaurantService;



@Controller
@RequestMapping("/rest")
public class RestraurantAction extends BaseAction {

	@Autowired
	private RestaurantService restaurantService;
	
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public ModelAndView loadRestDiscovery(){
		
		
		return new ModelAndView("restrDiscovery");
	}
	
	
	@RequestMapping(value="restDetail",method=RequestMethod.GET)
	public ModelAndView loadRestDetail(){
		
		DishDetail d1 = new DishDetail();
		d1.setDishName("干锅茶树菇");
		d1.setImageUrl("img/ganguochashugu.jpg");
		d1.setPrice(23);
		DishDetail d2 = new DishDetail();
		d2.setDishName("鱼香肉丝");
		d2.setImageUrl("img/yuxiangrousi.jpg");
		d2.setPrice(25);
		DishDetail d3 = new DishDetail();
		d3.setDishName("水晶肘子");
		d3.setImageUrl("img/shuijingzhouzi.jpg");
		d3.setPrice(18);
		DishDetail d4 = new DishDetail();
		d4.setDishName("茶树菇闷鸭肉");
		d4.setImageUrl("img/chashugumenyarou.jpg");
		d4.setPrice(28);
		DishDetail d5 = new DishDetail();
		d5.setDishName("农家小炒肉");
		d5.setImageUrl("img/nongjiaxiaochaorou.jpg");
		d5.setPrice(23);
		DishDetail d6 = new DishDetail();
		d6.setDishName("茄子烧豆角");
		d6.setImageUrl("img/qiezishaodoujiao.jpg");
		d6.setPrice(24);
		DishDetail d7 = new DishDetail();
		d7.setDishName("东坡肉");
		d7.setImageUrl("img/dongporou.jpg");
		d7.setPrice(32);
		DishDetail d8 = new DishDetail();
		d8.setDishName("干笋烧肉");
		d8.setImageUrl("img/gansunshaorou.jpg");
		d8.setPrice(23);
		DishDetail d9 = new DishDetail();
		d9.setDishName("皮蛋拌豆腐");
		d9.setImageUrl("img/pidanbandoufu.jpg");
		d9.setPrice(15);
		
		List<RestraurantInfo> list = null;
		try {
			list = restaurantService.loadRestraurantInfo();
			List<DishDetail> r0 = list.get(0).getRecommendDishs();
			r0.add(d1);r0.add(d2);r0.add(d3);
			List<DishDetail> r1 = list.get(1).getRecommendDishs();
			r1.add(d4);r1.add(d5);r1.add(d6);
			List<DishDetail> r2 = list.get(2).getRecommendDishs();
			r2.add(d7);r2.add(d8);r2.add(d9);
			List<DishDetail> r3 = list.get(3).getRecommendDishs();
			r3.add(d1);r3.add(d6);r3.add(d8);
			List<DishDetail> r4 = list.get(4).getRecommendDishs();
			r4.add(d9);r4.add(d2);r4.add(d5);
			
			
		} catch (Exception e) {
			logger.warn("", e);
			return new ModelAndView("page403");
		}
		
		return new ModelAndView("restrDetail","rests",list);
	}
	
	
	@RequestMapping(value="home",method=RequestMethod.GET)
	public ModelAndView loadHome(){
		
		
		return new ModelAndView("homePage");
	}
}
