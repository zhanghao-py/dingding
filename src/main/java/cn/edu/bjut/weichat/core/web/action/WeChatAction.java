package cn.edu.bjut.weichat.core.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.bjut.weichat.core.config.SystemConfig;
import cn.edu.bjut.weichat.demo.web.action.dto.CheckSignatureForm;
import cn.edu.bjut.weichat.message.service.MessageService;

@Controller
@RequestMapping("wechat")
public class WeChatAction extends BaseAction{
	
	@RequestMapping(value = "checkSignature", method = RequestMethod.GET) 
	@ResponseBody
    public String checkSignatureGet(@ModelAttribute CheckSignatureForm form) {
		String token = SystemConfig.TOKEN;
		// TODO: 1.token timestamp nonce按字典序排序 -> tmpStr
		// TODO: 2.sha1(tmpStr) isEquals signature -> form.getEchostr() else ""
        return form.getEchostr();
    }
	
	@RequestMapping(value = "checkSignature", method = RequestMethod.POST) 
	@ResponseBody
    public void checkSignaturePost() {
	     //将请求、响应的编码均设置为UTF-8（防止中文乱码）  
	     try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
	     } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
	     }  
	     // 调用核心业务类接收消息、处理消息  
	     String respMessage = MessageService.processRequest(request); 
	     //respMessage
	     
		 // 响应消息
		 PrintWriter out;
		 try {
			out = response.getWriter();
			out.print(respMessage);  
			out.close(); 
		 } catch (IOException e) {
			e.printStackTrace();
		 }
    }
	
	
}
