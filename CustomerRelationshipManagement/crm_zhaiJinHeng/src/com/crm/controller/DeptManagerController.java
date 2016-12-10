package com.crm.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.DataModel;
import com.crm.model.DeptManager;
import com.crm.model.Pager;
import com.crm.service.IDeptManagerService;
@Controller
@RequestMapping("/deptManagerClass")
public class DeptManagerController {
	@Resource(name="IDeptManagerService")
	private IDeptManagerService DeptManagerService;
	@RequestMapping("/deptManagerPath")
	public ModelAndView getDeptManager(Pager pager){
		//查询显示列表所需的数据
		DataModel<DeptManager> data=DeptManagerService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/deptManager/deptManager.jsp");
		mav.addObject("deptManager", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 部门管理页面（支持删除）
	 * @param pager
	 * @param isDel
	 * @param userGroup_id
	 * @return
	 */
	@RequestMapping("/DeptManagerListOne")
	public ModelAndView getDeptManagerListOne(Pager pager,String isDel,int[] userGroup_id){
		
		if("del".equals(isDel)){
			//根据id删除部门管理列表
			DeptManagerService.deleteDeptManager(userGroup_id);
		}
		//查询显示列表所需的数据
		DataModel<DeptManager> data=DeptManagerService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/deptManager/deptManager.jsp");
		mav.addObject("deptManager", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建部门管理页面
	 * @return
	 */
//	@RequestMapping("/toAddDeptManager")
//	public ModelAndView toAddDeptManager(){
//		List<DeptManager> newPageList=DeptManagerService.findAllDeptManager();
//		ModelAndView mav=new ModelAndView("/jsp/deptManager/addDeptManager.jsp");
//		mav.addObject("newPageList", newPageList);
//		return mav;
//	}
	/**
	 * 跳转到新建部门管理页面
	 * @return
	 */
	@RequestMapping("/toAddDeptManager")
	public ModelAndView toAddDeptManager(){
		//拼接成有层次结构的字符串
		String str=DeptManagerService.getStr();
		
		ModelAndView mav=new ModelAndView("/jsp/deptManager/addDeptManager.jsp");
		mav.addObject("str", str);
		return mav;
	}
	/**
	 * 新建部门管理页面
	 * @param deptManager
	 * @return
	 */
	@RequestMapping("/addDeptManager")
	public ModelAndView addDeptManager(DeptManager deptManager){
		//新建商品类别
		DeptManagerService.addDeptManager(deptManager);
		String str=DeptManagerService.getStr();
		
		ModelAndView mav=new ModelAndView("/jsp/deptManager/addDeptManager.jsp");
		mav.addObject("str", str);
		mav.addObject("mess", "新建成功");
		return mav;
		
	}
}
