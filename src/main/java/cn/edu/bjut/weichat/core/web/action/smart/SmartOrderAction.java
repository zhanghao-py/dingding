package cn.edu.bjut.weichat.core.web.action.smart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.bjut.weichat.core.web.action.BaseAction;





@Controller
@RequestMapping("/smart")
public class SmartOrderAction extends BaseAction {

	
	@RequestMapping(value="",method=RequestMethod.GET)
	public ModelAndView loadSmartHome(){
		
		return new ModelAndView("smartHome");
	}
	
	@RequestMapping(value="detail",method=RequestMethod.GET)
	public ModelAndView loadDetail(){
		return new ModelAndView("smartDishDetail");
	}
	
	@RequestMapping(value="order",method=RequestMethod.GET)
	public ModelAndView loadOrder(){
		
		return new ModelAndView("smartOrderList");
	}
}
