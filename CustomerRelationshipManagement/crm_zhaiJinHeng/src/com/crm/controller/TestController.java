package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.crm.model.User;
import com.crm.service.TestService;


@Controller
@RequestMapping("/test1")
//@RequestMapping(value="/test1")
//@Scope(value="prototype")
public class TestController {
	
	//@Resource(name = "testService")
//	@Autowired
//	private TestService testservice;
//	@RequestMapping("/testabc")
//	public ModelAndView testAbc(){
//		return new ModelAndView("/jsp/test/bbb.jsp");
//	}
	
//	@RequestMapping("/testCon")
//	public ModelAndView testCon(){
//		System.out.println("TestController--->testCon");
//		
//		User user=testservice.findUser(3);
//		System.out.println("TestController--->user:"+user.getNickname());
//		return new ModelAndView("/jsp/test/aaa.jsp");
//	}
	
//	@RequestMapping("/list")
//	public ModelAndView list(){
//		System.out.println("TestController--->list");
//		
//		List<User> list=testservice.findAll();
//		ModelAndView mav = new ModelAndView( new MappingJacksonJsonView());
//		mav.addObject("list", list);
//		return mav;
//	}

}
