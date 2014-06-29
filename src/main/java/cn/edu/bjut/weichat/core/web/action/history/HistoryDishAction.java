package cn.edu.bjut.weichat.core.web.action.history;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.bjut.weichat.core.util.DishUtil;
import cn.edu.bjut.weichat.core.web.action.BaseAction;
import cn.edu.bjut.weichat.core.web.action.dto.StatusInfo;
import cn.edu.bjut.weichat.dao.bean.HistoryDishs;
import cn.edu.bjut.weichat.dish.service.OrderService;

@Controller
@RequestMapping("history")
public class HistoryDishAction extends BaseAction {

	@Autowired
	private OrderService orderService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView loadHistoryDish() {

		HistoryDishs hd = null;

		long restId = 100000;

		long userId = 1;

		int pageNum = DishUtil.INITPAGENUM;

		int listNum = DishUtil.ListNUM;

		String para1 = request.getParameter("restId");

		String para2 = request.getParameter("userId");

		String para3 = request.getParameter("pageNum");

		if (null != para1)
			restId = Long.parseLong(para1);

		if (null != para2)
			userId = Long.parseLong(para2);

		if (null != para3)
			pageNum = Integer.parseInt(para3);

		try {
			hd = orderService.loadHistoryDishs(restId, userId, pageNum, listNum);
		} catch (Exception e) {
			logger.warn("", e);
			return new ModelAndView("page403");
		}

		return new ModelAndView("orderHistory","history",hd);
	}

	@RequestMapping(value = "/more", method = RequestMethod.POST)
	@ResponseBody
	public StatusInfo loadMoreDish() {

		HistoryDishs hd = null;

		long restId = 100000;

		long userId = 1;

		int pageNum = DishUtil.INITPAGENUM;

		int listNum = DishUtil.ListNUM;

		String para1 = request.getParameter("restId");

		String para2 = request.getParameter("userId");

		String para3 = request.getParameter("pageNum");

		if (null != para1)
			restId = Long.parseLong(para1);

		if (null != para2)
			userId = Long.parseLong(para2);

		if (null != para3)
			pageNum = Integer.parseInt(para3);

		try {
			hd = orderService.loadHistoryDishs(restId, userId, pageNum, listNum);
		} catch (Exception e) {
			logger.warn("", e);
			status.setStatus(StatusInfo.FAILED);
			status.setStatusInfo("加载失败");
		}

		if (hd.getNum() < 5)
			status.setStatusInfo("-1");
		status.setData(hd.getMaps());

		return status;
	}

}
