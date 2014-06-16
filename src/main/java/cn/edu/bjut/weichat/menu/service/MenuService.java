package cn.edu.bjut.weichat.menu.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.edu.bjut.weichat.core.util.WeixinUtil;
import cn.edu.bjut.weichat.menu.bo.AccessToken;
import cn.edu.bjut.weichat.menu.bo.Button;
import cn.edu.bjut.weichat.menu.bo.CommonButton;
import cn.edu.bjut.weichat.menu.bo.ComplexButton;
import cn.edu.bjut.weichat.menu.bo.Menu;
import cn.edu.bjut.weichat.menu.bo.ViewButton;

public class MenuService {
	private static Logger log = LoggerFactory.getLogger(MenuService.class);

	public static void main(String[] args) {
		// 第三方用户唯一凭证
		String appId = "wx28940520bf12061a";
		// 第三方用户唯一凭证密钥
		String appSecret = "d7c1414be6ad375685c321cf4d52ad85";
		// 调用接口获取access_token
		AccessToken at = WeixinUtil.getAccessToken(appId, appSecret);
		if (null != at) {
			// 调用接口创建菜单
			int result = WeixinUtil.createMenu(getMenu(), at.getToken());

			// 判断菜单创建结果
			if (0 == result)
				log.info("菜单创建成功！");
			else
				log.info("菜单创建失败，错误码：" + result);
		}
	}

	/**
	 * 组装菜单数据
	 * 
	 * @return
	 */
	private static Menu getMenu() {
		
		CommonButton btn21 = new CommonButton();
		btn21.setName("饭馆优惠");
		btn21.setType("click");
		btn21.setKey("21");

		ViewButton btn31 = new ViewButton();  
		btn31.setName("我的订单");
		btn31.setType("view");  
		btn31.setUrl("http://dingdingorder.duapp.com/index"); 

		ViewButton btn32 = new ViewButton(); 
		btn32.setName("饭馆收藏");
		btn32.setType("view");  
		btn32.setUrl("http://dingdingorder.duapp.com/index"); 

		ViewButton mainBtn1 = new ViewButton();  
		mainBtn1.setName("我要点餐");  
		mainBtn1.setType("view");  
		mainBtn1.setUrl("http://dingdingorder.duapp.com/dishList"); 

		ComplexButton mainBtn2 = new ComplexButton();
		mainBtn2.setName("优惠福利");
		mainBtn2.setSub_button(new CommonButton[] { btn21});

		ComplexButton mainBtn3 = new ComplexButton();
		mainBtn3.setName("我的服务");
		mainBtn3.setSub_button(new ViewButton[] { btn31, btn32});

		/**
		 * 这是公众号xiaoqrobot目前的菜单结构，每个一级菜单都有二级菜单项<br>
		 * 在某个一级菜单下没有二级菜单的情况，menu该如何定义呢？<br>
		 * 比如，第三个一级菜单项不是“更多体验”，而直接是“幽默笑话”，那么menu应该这样定义：<br>
		 * menu.setButton(new Button[] { mainBtn1, mainBtn2, btn33 });
		 */
		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn1, mainBtn2, mainBtn3 });

		return menu;
	}

}
