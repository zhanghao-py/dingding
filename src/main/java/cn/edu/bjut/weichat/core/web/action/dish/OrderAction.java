package cn.edu.bjut.weichat.core.web.action.dish;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.bjut.weichat.core.web.action.BaseAction;
import cn.edu.bjut.weichat.core.web.action.dto.StatusInfo;
import cn.edu.bjut.weichat.dao.bean.OrderList;
import cn.edu.bjut.weichat.dao.bean.OrderOfDetail;
import cn.edu.bjut.weichat.dish.service.ImageOfDishService;
import cn.edu.bjut.weichat.dish.service.OrderService;


@Controller
@RequestMapping("/orders")
public class OrderAction extends BaseAction {

	@Autowired
	private OrderService orderService;
	
	
	
	@RequestMapping(value="/addDish",method=RequestMethod.POST)
	@ResponseBody
	public StatusInfo addDishToOrder(){
				
		List<String> dish = new ArrayList<String>();
		
		String dishId = "";
		
		String dishNum = "";
		
		if(null != (dishId = request.getParameter("dishId")))
			dish.add(dishId);
		else {
			logger.warn("获取菜品id失败！");
			status.setStatus(StatusInfo.FAILED);
			status.setStatusInfo(StatusInfo.SUCCESS_MSG);
			return status;
		}
		
		if(null != (dishNum = request.getParameter("dishNum")))
			dish.add(dishNum);
		else {
			logger.warn("获取菜品数量失败！");
			status.setStatus(StatusInfo.FAILED);
			status.setStatusInfo(StatusInfo.SUCCESS_MSG);
			return status;
		}
		
			
		List<List<String>> dishs = (List<List<String>>) session.getAttribute("order");
		
		
		if(null != dishs){
			dishs.add(dish);
		}
		else {
			List<List<String>> ds = new ArrayList<List<String>>();
			ds.add(dish);
			
			session.setAttribute("order",ds);
		}
		status.setStatus(StatusInfo.SUCCESS);
		status.setStatusInfo(StatusInfo.SUCCESS_MSG);
		
		return status;
	}
	
	@RequestMapping(value="/orderList",method=RequestMethod.GET)
	public ModelAndView getOrderList(){
		
		List<List<String>> orderList = (List<List<String>>) session.getAttribute("order");
		
		OrderOfDetail ood  = null;
		
		if(null == orderList){
			logger.warn("获取订单失败");
		}
		
		try {
			ood = orderService.getOrderDetail(orderList);
		} catch (Exception e) {
			logger.warn("", e);
		}
		//session.removeAttribute("order");
		return new ModelAndView("orderList","order",ood);
	}
	
	
}
