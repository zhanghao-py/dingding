package cn.edu.bjut.weichat.core.web.action;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.ModelAttribute;

import cn.edu.bjut.weichat.core.web.action.dto.StatusInfo;
import cn.edu.bjut.weichat.core.web.action.dto.Visitor;

public class BaseAction {

	protected Logger logger = Logger.getLogger(getClass());
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	
	protected StatusInfo status = new StatusInfo();
	
//	@Autowired
//	private UserService userService;
	
	@ModelAttribute
	public void setReqAndResp(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.session = request.getSession(true);
	}
	
	/*
	protected Visitor getVisitor() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		Visitor visitor = null;
		
		if (authentication.isAuthenticated()) {

			String username = authentication.getName();
			User user = userService.findUserByUsername(username);
			Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) authentication.getAuthorities();
			
			visitor = new Visitor();
			visitor.setId(user.getId());
			visitor.setUsername(user.getUsername());
			visitor.setAuthorities(authorities);
		}
		
		return visitor;
	}
	*/
	
}
