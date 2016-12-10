package com.crm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.User;
import com.crm.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name="userService")
	private UserService userService;
	/**
	 * 用户登录
	 * @param name
	 * @param password
	 * @param verifyCode
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpSession session,String name,String password,String verifyCode){
		String sessionCode=(String) session.getAttribute("validateCode");
		
		if(sessionCode!=null && sessionCode.equalsIgnoreCase(verifyCode)){
			
			User user=userService.findUser(name,password);
			if(user!=null){
				if("启用".equals(user.getStatus())){
					session.setAttribute("user", user);
					ModelAndView mav=new ModelAndView("redirect:/jsp/mainPage/mainPage.jsp");
					return mav;
					
				}else{
					ModelAndView mav=new ModelAndView("/jsp/login/login.jsp");
					mav.addObject("err", "帐号被禁用");
					return mav;
				}
			}else{
				ModelAndView mav=new ModelAndView("/jsp/login/login.jsp");
				mav.addObject("err", "帐号或密码错误");
				return mav;
			}
			
		}else{
			ModelAndView mav=new ModelAndView("/jsp/login/login.jsp");
			mav.addObject("err", "验证码错误");
			return mav;
		}
	}

}
