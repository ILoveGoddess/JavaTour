package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.CustomerVisit;
import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.service.ICustomerVisitService;

@Controller
@RequestMapping("/customerVisit")
public class CustomerVisitController {
	@Resource(name="ICustomerVisitService")
	private ICustomerVisitService CustomerVisitService;
	@RequestMapping("/visit")
	public ModelAndView getCustomerVisitList(Pager pager){
		//查询显示列表所需的数据
		DataModel<CustomerVisit> data=CustomerVisitService.findList(pager);
		
		ModelAndView mav=new ModelAndView("/jsp/customerVisit/visit.jsp");
		mav.addObject("visit", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 客户拜访列表页面（支持删除）
	 * @param pager
	 * @param isDel
	 * @param company
	 * @return
	 */
	@RequestMapping("/customerVisitListOne")
	public ModelAndView getCustomerVisitListOne(Pager pager,String isDel,int[] company){
		
		if("del".equals(isDel)){
			//根据id删除商品类别
			CustomerVisitService.deleteCustomerVisit(company);
		}
		
		//查询显示列表所需的数据
		DataModel<CustomerVisit> data=CustomerVisitService.findList(pager);
		
		ModelAndView mav=new ModelAndView("/jsp/customerVisit/visit.jsp");
		mav.addObject("visit", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建客户拜访页面
	 * @return
	 */
	@RequestMapping("/toAddCustomerVisit")
	public ModelAndView toAddCustomerVisit(){
		List<CustomerVisit> newPageList=CustomerVisitService.findAllCustomerVisit();
		ModelAndView mav=new ModelAndView("/jsp/customerVisit/addCustomerVisit.jsp");
		mav.addObject("newPageList", newPageList);
		return mav;
	}
	/**
	 * 新建客户拜访页面
	 * @param customerVisit
	 * @return
	 */
	@RequestMapping("/addCustomerVisit")
	public ModelAndView addCustomerVisit(CustomerVisit customerVisit){
		//新建商品类别
		CustomerVisitService.addCustomerVisit(customerVisit);
		ModelAndView mav=new ModelAndView("/jsp/customerVisit/addCustomerVisit.jsp");
		mav.addObject("mess", "新建成功");
		return mav;
	}
}
