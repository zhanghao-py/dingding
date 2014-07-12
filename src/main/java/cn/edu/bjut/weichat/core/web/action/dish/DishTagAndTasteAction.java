package cn.edu.bjut.weichat.core.web.action.dish;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.bjut.weichat.core.web.action.BaseAction;
import cn.edu.bjut.weichat.core.web.action.dto.StatusInfo;
import cn.edu.bjut.weichat.dao.bean.DishTagAndTaste;
import cn.edu.bjut.weichat.dish.service.TagService;
import cn.edu.bjut.weichat.dish.service.TasteService;



@Controller
@RequestMapping("dishConfig")
public class DishTagAndTasteAction extends BaseAction {

	@Autowired
	private TasteService tasteService;
	
	@Autowired
	private TagService tagService;
	
	
	@RequestMapping("/tagAndTaste")
	public StatusInfo loadTagsAndTastes(){
		DishTagAndTaste dtt = new DishTagAndTaste();
		
		long dishId = 100000;
		String param1 = request.getParameter("dishId");
		
		if(null != param1){
			dishId = Long.parseLong(param1);
		}
		
		
		try {
			
		} catch (Exception e) {
			logger.warn("", e);
			status.setStatus(StatusInfo.FAILED);
		}
		
		
		
		return status;
	}
}
