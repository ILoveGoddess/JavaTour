package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.Contacts;
import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.service.IContactsService;

@Controller
@RequestMapping("/contacts")
public class ContactsController {
	@Resource(name="IContactsService")
	private IContactsService ContactsService;
	@RequestMapping("/noName")
	public ModelAndView getContacts(Pager pager){
		//查询显示列表所需的数据
		DataModel<Contacts> data=ContactsService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/contacts/contacts.jsp");
		mav.addObject("contacts", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 联系人列表页面（支持删除）
	 * @param pager
	 * @param isDel
	 * @param company
	 * @return
	 */
	@RequestMapping("/ContactsListOne")
	public ModelAndView getContactsListOne(Pager pager,String isDel,int[] companyLinkman_id){
		
		if("del".equals(isDel)){
			//根据id删除商品类别
			ContactsService.deleteContacts(companyLinkman_id);
		}
		//查询显示列表所需的数据
		DataModel<Contacts> data=ContactsService.findList(pager);
		ModelAndView mav=new ModelAndView("/jsp/contacts/contacts.jsp");
		mav.addObject("contacts", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建联系人列表页面
	 * @return
	 */
	@RequestMapping("/toAddContacts")
	public ModelAndView toAddContacts(){
		List<Contacts> newPageList=ContactsService.findAllContacts();
		ModelAndView mav=new ModelAndView("/jsp/contacts/addContacts.jsp");
		mav.addObject("newPageList", newPageList);
		return mav;
	}
	/**
	 * 新建联系人列表页面
	 * @param customerVisit
	 * @return
	 */
	@RequestMapping("/addContacts")
	public ModelAndView addContacts(Contacts contacts){
		//新建商品类别
		ContactsService.addContacts(contacts);
		//String str=ContactsService.getStr();
		ModelAndView mav=new ModelAndView("/jsp/contacts/addContacts.jsp");
		//mav.addObject("str", str);
		mav.addObject("mess", "新建成功");
		return mav;
	}
}
