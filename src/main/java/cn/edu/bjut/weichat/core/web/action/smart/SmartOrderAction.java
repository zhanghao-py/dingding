package cn.edu.bjut.weichat.core.web.action.smart;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.bjut.weichat.core.web.action.BaseAction;
import cn.edu.bjut.weichat.dao.bean.DishDetail;
import cn.edu.bjut.weichat.dao.bean.SmartChoice;
import cn.edu.bjut.weichat.dish.service.DishService;





@Controller
@RequestMapping("/smart")
public class SmartOrderAction extends BaseAction {
	

	@Autowired
	private DishService dishService;
	
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public ModelAndView loadSmartHome(){
		
		return new ModelAndView("smartHome");
	}
	
	@RequestMapping(value="detail",method=RequestMethod.GET)
	public ModelAndView loadDetail(){
		
		String smartChoice = request.getParameter("smartChoice");
		
		List<DishDetail> list = null;
		
		if(null == smartChoice)
			return new ModelAndView("page403");
		
		try {
			JSONObject smart = JSONObject.fromObject(smartChoice);
			SmartChoice sChoice = new SmartChoice();
			
			sChoice.setPerson(smart.getInt("person"));
			sChoice.setMoney(smart.getInt("money"));
			sChoice.setNocaraway(smart.getBoolean("nocaraway"));
			sChoice.setNocarrot(smart.getBoolean("nocarrot"));
			sChoice.setNogarlic(smart.getBoolean("nogarlic"));
			sChoice.setLittlespicy(smart.getBoolean("littlespicy"));
			sChoice.setNokelp(smart.getBoolean("nokelp"));
			sChoice.setNoonion(smart.getBoolean("noonion"));
			sChoice.setNospicy(smart.getBoolean("nospicy"));
			sChoice.setNosugar(smart.getBoolean("nosugar"));
			
			list = dishService.getDishSmart(sChoice);
			
			
		} catch (Exception e) {
			logger.warn("智能点餐前台数据转化异常", e);
			return new ModelAndView("page403");
		}
			
		return new ModelAndView("smartDishDetail","dish",list.get(3));
	}
	
	@RequestMapping(value="order",method=RequestMethod.GET)
	public ModelAndView loadOrder(){
		
		return new ModelAndView("smartOrderList");
	}
}
