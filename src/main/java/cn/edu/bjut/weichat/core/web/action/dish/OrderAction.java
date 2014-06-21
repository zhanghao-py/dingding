package cn.edu.bjut.weichat.core.web.action.dish;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.bjut.weichat.core.util.DishUtil;
import cn.edu.bjut.weichat.core.web.action.BaseAction;
import cn.edu.bjut.weichat.core.web.action.dto.StatusInfo;
import cn.edu.bjut.weichat.dao.bean.AllOrders;
import cn.edu.bjut.weichat.dao.bean.OrderOfDetail;
import cn.edu.bjut.weichat.dish.service.OrderService;
import cn.edu.bjut.weichat.dish.service.RestaurantService;


@Controller
@RequestMapping("/orders")
public class OrderAction extends BaseAction {

	@Autowired
	private OrderService orderService;
	
	
	@Autowired
	private RestaurantService restaurantService;
	
	
	
	private int pageNum;
	
	private int listNum;
	
	
	
	@RequestMapping(value="/addDish",method=RequestMethod.POST)
	@ResponseBody
	public StatusInfo addDishToOrder(){
				
		List<String> dish = new ArrayList<String>();
		
		String dishId = "100000";
		
		String dishNum = "1";
		
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
			return new ModelAndView("page403");//返回一个错误页面
		}
		
		try {
			ood = orderService.getOrderDetail(orderList);
			
			ood.setRestName(restaurantService.getRestaurantByRestId(ood.getRestId()).get(0).getRestName());
		} catch (Exception e) {
			logger.warn("", e);
			return new ModelAndView("page403");
		}
		//session.removeAttribute("order");
		
		if(null == session.getAttribute("orders"))
			session.setAttribute("orders", ood);
		else{
			session.removeAttribute("orders");
			session.setAttribute("orders", ood);
		}
		
		
		
		return new ModelAndView("orderList","order",ood);
	}
	
	@RequestMapping(value="/addOrder",method=RequestMethod.GET)
	public ModelAndView addOrder(){
		
		OrderOfDetail ood = null;
		
		
		if(null == session.getAttribute("orders"))
			return new ModelAndView("page403");
		else{
			ood = (OrderOfDetail)session.getAttribute("orders");
			int result = orderService.addOrder(ood);
			if(result < 0)
				return new ModelAndView("page403");
		}
		
		session.removeAttribute("order");
		
		return new ModelAndView("payment");
	}
	
	
	@RequestMapping(value="/allOrders",method=RequestMethod.GET)
	public ModelAndView getAllOrders(){
		List<AllOrders> list = null;
		long userId = 1;
		String paraString =  "";
		
		pageNum = DishUtil.INITPAGENUM;
		listNum = DishUtil.ListNUM;
		
		if(null != request.getParameter("pageNum"))
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		if(null !=(paraString = request.getParameter("userId")))
			userId = Integer.parseInt(paraString);
		
		
		try {
			list = orderService.getAllOrders(userId,pageNum,listNum);
		} catch (Exception e) {
			logger.warn("", e);
			return new ModelAndView("page403");
		}
		
		return new ModelAndView("allOrderList","orders",list);
	}
	
	@RequestMapping(value="/moreOrders",method=RequestMethod.POST)
	@ResponseBody
	public StatusInfo loadMoreOrders(){
		
		List<AllOrders> list = null;
		long userId = 1;
		String paraString =  "";
		
		pageNum = DishUtil.INITPAGENUM;
		listNum = DishUtil.ListNUM;
		
		if(null != request.getParameter("pageNum"))
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		if(null !=(paraString = request.getParameter("userId")))
			userId = Integer.parseInt(paraString);
		
		
		try {
			list = orderService.getAllOrders(userId,pageNum,listNum);
		} catch (Exception e) {
			logger.warn("", e);
			status.setStatus(StatusInfo.FAILED);
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
}
