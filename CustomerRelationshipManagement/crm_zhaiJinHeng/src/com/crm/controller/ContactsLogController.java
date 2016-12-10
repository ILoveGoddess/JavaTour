package com.crm.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.ContactsLog;
import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.service.IContactsLogService;
@Controller
@RequestMapping("/contactsLog")
public class ContactsLogController {
	@Resource(name="IContactsLogService")
	private IContactsLogService ContactsLogService;
	@RequestMapping("/contactsLogPath")
	public ModelAndView getContactsLog(Pager pager){
		//查询显示列表所需的数据
		DataModel<ContactsLog> data=ContactsLogService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/contactsLog/contactsLog.jsp");
		mav.addObject("contactsLog", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 联系人记录列表页面（支持删除）
	 * @param pager
	 * @param isDel
	 * @param companyTouch_id
	 * @return
	 */
	@RequestMapping("/ContactsLogListOne")
	public ModelAndView getContactsLogListOne(Pager pager,String isDel,int[] companyTouch_id){
		
		if("del".equals(isDel)){
			//根据id删除商品类别
			ContactsLogService.deleteContactsLog(companyTouch_id);
		}
		//查询显示列表所需的数据
		DataModel<ContactsLog> data=ContactsLogService.findList(pager);
		ModelAndView mav=new ModelAndView("/jsp/contactsLog/contactsLog.jsp");
		mav.addObject("contactsLog", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建联系人记录列表页面
	 * @return
	 */
	@RequestMapping("/toAddContactsLog")
	public ModelAndView toAddContactsLog(){
		List<ContactsLog> newPageList=ContactsLogService.findAllContactsLog();
		ModelAndView mav=new ModelAndView("/jsp/contactsLog/addContactsLog.jsp");
		mav.addObject("newPageList", newPageList);
		return mav;
	}
	/**
	 * 新建联系人记录列表页面
	 * @param contactsLog
	 * @return
	 */
	@RequestMapping("/addContactsLog")
	public ModelAndView addContactsLog(ContactsLog contactsLog){
		//新建联系人记录列表页面
		ContactsLogService.addContactsLog(contactsLog);
		ModelAndView mav=new ModelAndView("/jsp/contactsLog/addContactsLog.jsp");
		mav.addObject("mess", "新建成功");
		return mav;
	}
}
