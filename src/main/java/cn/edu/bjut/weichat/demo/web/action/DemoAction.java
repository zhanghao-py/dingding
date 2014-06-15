package cn.edu.bjut.weichat.demo.web.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import cn.edu.bjut.weichat.core.config.SystemConfig;
import cn.edu.bjut.weichat.core.web.action.BaseAction;
import cn.edu.bjut.weichat.demo.web.action.dto.CheckSignatureForm;

@Controller
@RequestMapping("")
public class DemoAction extends BaseAction {
	
	@RequestMapping(value = "index", method = RequestMethod.GET) 
    public ModelAndView index() {
        return new ModelAndView("index");
    }
	
//	@RequestMapping(value = "page403", method = RequestMethod.GET) 
//    public ModelAndView page403() {
//        return new ModelAndView("page403");
//    }
	
	@RequestMapping(value = "dishList", method = RequestMethod.GET) 
    public ModelAndView dishList() {
        return new ModelAndView("dishList");
    }
	
	@RequestMapping(value = "dishDetail", method = RequestMethod.GET) 
    public ModelAndView dishDetail() {
        return new ModelAndView("dishDetail");
    }
	
	@RequestMapping(value = "smartDishDetail", method = RequestMethod.GET) 
    public ModelAndView smartDishDetail() {
        return new ModelAndView("smartDishDetail");
    }
	
	@RequestMapping(value = "orderList", method = RequestMethod.GET) 
    public ModelAndView orderList() {
        return new ModelAndView("orderList");
    }
	
	@RequestMapping(value = "smartOrderList", method = RequestMethod.GET) 
    public ModelAndView smartOrderList() {
        return new ModelAndView("smartOrderList");
    }
	
	@RequestMapping(value = "restrDetail", method = RequestMethod.GET) 
    public ModelAndView restrDetail() {
        return new ModelAndView("restrDetail");
    }
	
	@RequestMapping(value = "bdmap", method = RequestMethod.GET) 
    public ModelAndView bdmap() {
        return new ModelAndView("bdmap");
    }
	
	@RequestMapping(value = "", method = RequestMethod.GET) 
    public ModelAndView defaultPage() {
        return new ModelAndView(new RedirectView("index"));
    }
	
	@RequestMapping(value = "checkSignature", method = RequestMethod.GET) 
	@ResponseBody
    public String checkSignature(@ModelAttribute CheckSignatureForm form) {
		String token = SystemConfig.TOKEN;
		
		// TODO: 1.token timestamp nonce按字典序排序 -> tmpStr
		// TODO: 2.sha1(tmpStr) isEquals signature -> form.getEchostr() else ""
		
        return form.getEchostr();
    }

}
