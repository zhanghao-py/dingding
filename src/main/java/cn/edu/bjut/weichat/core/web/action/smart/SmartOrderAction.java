package cn.edu.bjut.weichat.core.web.action.smart;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.bjut.common.util.StringUtil;
import cn.edu.bjut.weichat.core.util.DishUtil;
import cn.edu.bjut.weichat.core.util.SmartType;
import cn.edu.bjut.weichat.core.web.action.BaseAction;
import cn.edu.bjut.weichat.core.web.action.dto.StatusInfo;
import cn.edu.bjut.weichat.dao.bean.DishDetail;
import cn.edu.bjut.weichat.dao.bean.OrderOfDetail;
import cn.edu.bjut.weichat.dao.bean.SmartChoice;
import cn.edu.bjut.weichat.dao.bean.SmartCommonDishs;
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

	@RequestMapping(value = "dishDetail", method = RequestMethod.GET)
	public ModelAndView getDishDetail() {

		long dishId = 100001;

		DishDetail detail = null;

		if (null != request.getParameter("dishId"))
			dishId = Long.parseLong(request.getParameter("dishId"));

		try {

			detail = dishService.getDishDetail(dishId).get(0);

		} catch (Exception e) {
			logger.warn("加载菜单详情出错", e);
			return new ModelAndView("page403");
		}

		return new ModelAndView("smartDishDetail", "dish", detail);
	}

	@RequestMapping(value = "sameMat", method = RequestMethod.GET)
	public ModelAndView loadSameMaterial() {

		SmartCommonDishs scd = new SmartCommonDishs();

		int pageNum = DishUtil.INITPAGENUM;

		int pageSize = DishUtil.ListNUM;

		long restId = 100000;

		String material = "";

		String pageParam = request.getParameter("pageNum");

		String pageParam1 = request.getParameter("pageSize");

		String matParam = request.getParameter("material");

		if (null != pageParam)
			pageNum = Integer.parseInt(pageParam);

		if (null != pageParam1)
			pageSize = Integer.parseInt(pageParam1);

		if (null != matParam)
			material = matParam;

		if (null != session.getAttribute("restId"))
			restId = (Long) session.getAttribute("restId");

		try {
			String material1 = new String(material.getBytes("iso-8859-1"),
					"UTF-8");

			String[] mats = StringUtil.splitString(material1, "、");

			List<DishDetail> list = dishService.getSameMatDish(mats[0], restId,pageNum, pageSize);

			scd.setRestId(restId);

			scd.setSmartType(SmartType.SAMEMATER);

			scd.setSmartTypeNum(SmartType.SAMEMATERNUM);

			scd.setDishs(list);

			// System.out.println(material1);
		} catch (Exception e) {
			// e.printStackTrace();
			logger.warn("同食材菜品加载出错", e);
		}

		return new ModelAndView("commonDish", "dishs", scd);
	}

	@RequestMapping(value = "samePrice", method = RequestMethod.GET)
	public ModelAndView loadSamePrice() {
		SmartCommonDishs scd = new SmartCommonDishs();

		int pageNum = DishUtil.INITPAGENUM;

		int pageSize = DishUtil.ListNUM;

		long restId = 100000;

		float price = 20;

		String pageParam = request.getParameter("pageNum");

		String pageParam1 = request.getParameter("pageSize");

		String priceParam = request.getParameter("price");

		if (null != pageParam)
			pageNum = Integer.parseInt(pageParam);

		if (null != pageParam1)
			pageSize = Integer.parseInt(pageParam1);

		if (null != priceParam)
			price = Float.parseFloat(priceParam);

		if (null != session.getAttribute("restId"))
			restId = (Long) session.getAttribute("restId");
		
		try {
		
			List<DishDetail> list = dishService.getSamePricDish(price, restId, pageNum, pageSize);

			scd.setRestId(restId);

			scd.setSmartType(SmartType.SAMEPRICE);

			scd.setSmartTypeNum(SmartType.SAMEPRICENUM);

			scd.setDishs(list);

		} catch (Exception e) {
			logger.warn("同价格菜品加载出错", e);
		}
		
		return new ModelAndView("commonDish", "dishs", scd);
	}

	
	@RequestMapping(value="sameTaste",method=RequestMethod.GET)
	public ModelAndView loadSameTaste(){
		
		SmartCommonDishs scd = new SmartCommonDishs();

		int pageNum = DishUtil.INITPAGENUM;

		int pageSize = DishUtil.ListNUM;

		long restId = 100000;

		String taste = "";
		
		String pageParam = request.getParameter("pageNum");

		String pageParam1 = request.getParameter("pageSize");

		String tasteParam = request.getParameter("taste");

		if (null != pageParam)
			pageNum = Integer.parseInt(pageParam);

		if (null != pageParam1)
			pageSize = Integer.parseInt(pageParam1);

		if (null != tasteParam)
			taste = tasteParam;

		if (null != session.getAttribute("restId"))
			restId = (Long) session.getAttribute("restId");
		
		try {
			
			List<DishDetail> list = dishService.getSameTasteDish(taste, restId, pageNum, pageSize);

			scd.setRestId(restId);

			scd.setSmartType(SmartType.SAMETASTE);

			scd.setSmartTypeNum(SmartType.SAMETASTENUM);

			scd.setDishs(list);

		} catch (Exception e) {
			logger.warn("同口味菜品加载出错", e);
		}
		
		return new ModelAndView("commonDish", "dishs", scd);
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
