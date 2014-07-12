package cn.edu.bjut.weichat.core.web.action.smart;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;
import cn.edu.bjut.weichat.core.web.action.BaseAction;
import cn.edu.bjut.weichat.core.web.action.dto.StatusInfo;
import cn.edu.bjut.weichat.dao.bean.DishDetail;
import cn.edu.bjut.weichat.dao.bean.OrderOfDetail;
import cn.edu.bjut.weichat.dao.bean.SmartChoice;
import cn.edu.bjut.weichat.dish.service.DishService;
import cn.edu.bjut.weichat.dish.service.OrderService;

@Controller
@RequestMapping("/smart")
public class SmartOrderAction extends BaseAction {

	@Autowired
	private DishService dishService;

	@Autowired
	private SmartOrder smartOrder;
	
	
	@Autowired
	private OrderService orderService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView loadSmartHome() {

		return new ModelAndView("smartHome");
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView loadDetail() {

		long restId = 100000;

		String smartChoice = request.getParameter("smartChoice");

		// PageBean<Map<String, List<DishDetail>>> pageBean = null;
		OrderOfDetail ood = null;

		if (null != session.getAttribute("restId")) {
			restId = (Long) session.getAttribute("restId");
		}

		List<DishDetail> list = null;

		if (null == smartChoice)
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

			float avPrice = sChoice.getMoney() / sChoice.getPerson();

			ood = smartOrder.smartOfOrderDish(restId, sChoice.getPerson(),
					avPrice, sChoice);

			// list = dishService.getDishSmart(sChoice);

			if (null == session.getAttribute("smartOrder"))
				session.setAttribute("smartOrder", ood);
			else {
				session.removeAttribute("smartOrder");
				session.setAttribute("smartOrder", ood);
			}

			// session.setAttribute("smartOrder", ood);

		} catch (Exception e) {
			logger.warn("智能点餐前台数据转化异常", e);
			return new ModelAndView("page403");
		}

		return new ModelAndView("smartOrderList", "order", ood);
	}

	@RequestMapping(value = "addDish", method = RequestMethod.POST)
	@ResponseBody
	public StatusInfo addDish() {

		status.setStatus(StatusInfo.SUCCESS);

		return status;
	}
	
	
	@RequestMapping(value="dishDetail",method = RequestMethod.GET)
	public ModelAndView getDishDetail(){
		
		long dishId = 100001;
		
		DishDetail detail = null;
		
		
		if(null != request.getParameter("dishId"))
			dishId = Long.parseLong(request.getParameter("dishId"));
		
		
		try {
			
			detail = dishService.getDishDetail(dishId).get(0);
			
		} catch (Exception e) {
			logger.warn("加载菜单详情出错", e);
			return new ModelAndView("page403");
		}
		
		
		return new ModelAndView("smartDishDetail","dish",detail);
	}
	
	

	@RequestMapping(value = "sameMat", method = RequestMethod.GET)
	public ModelAndView loadSameMaterial() {

		String material = request.getParameter("material");
		try {
			String material1 = new String(material.getBytes("iso-8859-1"),"UTF-8");
			// System.out.println(material1);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ModelAndView();
	}

	@RequestMapping(value = "addOrder", method = RequestMethod.GET)
	public ModelAndView loadOrder() {

		OrderOfDetail ood = null;

		if (null == session.getAttribute("smartOrder"))
			return new ModelAndView("page403");
		else {
			ood = (OrderOfDetail) session.getAttribute("smartOrder");
			int result = orderService.addOrder(ood);
			if (result < 0)
				return new ModelAndView("page403");
		}

		session.removeAttribute("smartOrder");

		return new ModelAndView("payment");
	}

}
