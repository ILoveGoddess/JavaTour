package com.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.Pager;

@Controller
@RequestMapping("/userContributeClass")
public class UserContributeController {
//	@Resource(name="contactsLogService")
//	private IContactsLogService ContactsLogService;
	@RequestMapping("/userContributePath")
	public ModelAndView getUserContribute(Pager pager){
		ModelAndView mav = new ModelAndView("/jsp/userContribute/userContribute.jsp");
		return mav;
	}
}
