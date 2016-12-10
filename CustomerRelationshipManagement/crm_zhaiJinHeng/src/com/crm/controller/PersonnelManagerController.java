package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.PersonnelManager;
import com.crm.service.IPersonnelManagerService;

@Controller
@RequestMapping("/personnelManagerClass")
public class PersonnelManagerController {
	@Resource(name="IPersonnelManagerService")
	private IPersonnelManagerService PersonnelManagerService;
	@RequestMapping("/personnelManagerPath")
	public ModelAndView getPersonnelManager(Pager pager){
		//查询显示列表所需的数据
		DataModel<PersonnelManager> data=PersonnelManagerService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/personnelManager/personnelManager.jsp");
		mav.addObject("personnelManager", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 人事管理页面（支持删除）
	 * @param pager
	 * @param isDel
	 * @param user_id
	 * @return
	 */
	@RequestMapping("/PersonnelManagerListOne")
	public ModelAndView getPersonnelManagerListOne(Pager pager,String isDel,int[] user_id){
		
		if("del".equals(isDel)){
			//根据id删除人事管理列表
			PersonnelManagerService.deletePersonnelManager(user_id);
		}
		//查询显示列表所需的数据
		DataModel<PersonnelManager> data=PersonnelManagerService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/personnelManager/personnelManager.jsp");
		mav.addObject("personnelManager", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建人事管理页面
	 * @return
	 */
	@RequestMapping("/toAddPersonnelManager")
	public ModelAndView toAddPersonnelManager(){
		List<PersonnelManager> newPageList=PersonnelManagerService.findAllPersonnelManager();
		ModelAndView mav=new ModelAndView("/jsp/personnelManager/addPersonnelManager.jsp");
		mav.addObject("newPageList", newPageList);
		return mav;
	}
	/**
	 * 新建人事管理页面
	 * @param personnelManager
	 * @return
	 */
	@RequestMapping("/addPersonnelManager")
	public ModelAndView addPersonnelManager(PersonnelManager personnelManager){
		//新建商品类别
		PersonnelManagerService.addPersonnelManager(personnelManager);
		ModelAndView mav=new ModelAndView("/jsp/personnelManager/addPersonnelManager.jsp");
		mav.addObject("mess", "新建成功");
		return mav;
	}
}
