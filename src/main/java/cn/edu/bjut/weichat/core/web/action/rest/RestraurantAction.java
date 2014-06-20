package cn.edu.bjut.weichat.core.web.action.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.bjut.weichat.core.web.action.BaseAction;
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
		
		List<RestraurantInfo> list = null;
		try {
			list = restaurantService.loadRestraurantInfo();
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
