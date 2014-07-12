package cn.edu.bjut.weichat.core.web.action.dish;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.bjut.weichat.core.util.Category;
import cn.edu.bjut.weichat.core.util.DishUtil;
import cn.edu.bjut.weichat.core.web.action.BaseAction;
import cn.edu.bjut.weichat.core.web.action.dto.StatusInfo;
import cn.edu.bjut.weichat.dao.bean.DishDetail;
import cn.edu.bjut.weichat.dish.service.DishService;


@Controller
@RequestMapping("/dishPage")
public class DishInitAction extends BaseAction {

	@Autowired
	private DishService dishService;
	
	
	private int pageNum;
	
	private int listNum;
	
	private int category;
	
	@RequestMapping(value="init",method=RequestMethod.GET)
	public ModelAndView initPage(){
		//接收餐厅的id，然后查出该餐厅的凉菜的前5种
		
		List<DishDetail> list = null;
		String paraString = "";
		
		long restId = 100000;
		
		pageNum = DishUtil.INITPAGENUM;
		
		listNum = DishUtil.ListNUM;
		
		category = Category.COLD.getNum();
		
		if(null != request.getParameter("restId"))
			restId = Long.parseLong(request.getParameter("restId"));
		if(null != (paraString=request.getParameter("category"))){
			try {
				category=Integer.parseInt(paraString);
			} catch (Exception e) {
				logger.warn("", e);
				category = Category.COLD.getNum();
			}
			
		}		
		
		session.setAttribute("restId", restId);
		
		try {
		    list = dishService.selectDishByRestIdAndCategory(restId, category, pageNum, listNum);
		} catch (Exception e) {
			logger.warn(" ",e);
			return new ModelAndView("page403");
		}
		
		return new ModelAndView("dishList","list",list);
		
	}
	
	@RequestMapping(value="/more",method = RequestMethod.POST)
	@ResponseBody
	public StatusInfo moreDish(){
		
		List<DishDetail> list = null;
		long restId = 100000;
		
		
		if(null != request.getParameter("restId"))
			restId = Long.parseLong(request.getParameter("restId"));
		
		if(null != request.getParameter("pageNum"))
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		else
			pageNum = DishUtil.INITPAGENUM;
		
		if(null != request.getParameter("category")){
			
			String cate = request.getParameter("category");
			
			try {
				category=Integer.parseInt(cate);
			} catch (Exception e) {
				logger.warn("", e);
				category = Category.COLD.getNum();
			}
		}
		else
			category = Category.COLD.getNum();
		
		listNum = DishUtil.ListNUM;
		
		
		
		try {
			//list = dishService.selectDishByName("宫保鸡丁");
			list = dishService.selectDishByRestIdAndCategory(restId,category, pageNum, listNum);
		} catch (Exception e) {
			logger.warn("", e);
			status.setStatus(StatusInfo.FAILED);
			status.setStatusInfo("查询失败！");
			return status;
		}
		
		if(list.size() < 5)
			status.setStatusInfo("-1");
		else
			status.setStatusInfo(StatusInfo.SUCCESS_MSG);
		status.setStatus(StatusInfo.SUCCESS);
		status.setData(list);
		
		return status;
	}
	
	
	
	@RequestMapping(value="/dishDetail",method=RequestMethod.GET)
	public ModelAndView getDishDetail(){
	
		List<DishDetail> list = null;
		
		DishDetail dish = null;
		
		long dishId = 0;
		
		String  dishIdStr;
		
		try {
			
			if(null != (dishIdStr = request.getParameter("dishId"))){
				dishId = Long.parseLong(dishIdStr);
			}
			
			list = dishService.getDishDetail(dishId);
			
			if(null != list)
				dish = list.get(0);			
		} catch (Exception e) {
			logger.warn("", e);
			new ModelAndView("page403");
		}
		
		return new ModelAndView("dishDetail","dish",dish); 
	}
}
