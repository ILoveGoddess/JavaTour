package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.PersonnelManager;
import com.crm.model.QueryJurisdiction;
import com.crm.service.IQueryJurisdictionService;

@Controller
@RequestMapping("/queryJurisdictionClass")
public class QueryJurisdictionController {
	@Resource(name="IQueryJurisdictionService")
	private IQueryJurisdictionService QueryJurisdictionService;
	@RequestMapping("/queryJurisdictionPath")
	public ModelAndView getQueryJurisdiction(Pager pager){
		//查询显示列表所需的数据
		DataModel<QueryJurisdiction> data=QueryJurisdictionService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/queryJurisdiction/queryJurisdiction.jsp");
		mav.addObject("queryJurisdiction", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 查询权限组页面（支持删除）
	 * @param pager
	 * @param isDel
	 * @param accessGroup_id
	 * @return
	 */
	@RequestMapping("/QueryJurisdictionListOne")
	public ModelAndView getQueryJurisdictionListOne(Pager pager,String isDel,int[] accessGroup_id){
		
		if("del".equals(isDel)){
			//根据id查询权限组列表
			QueryJurisdictionService.deleteQueryJurisdiction(accessGroup_id);
		}
		//查询显示列表所需的数据
		DataModel<QueryJurisdiction> data=QueryJurisdictionService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/queryJurisdiction/queryJurisdiction.jsp");
		mav.addObject("queryJurisdiction", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建查询权限组页面
	 * @return
	 */
	@RequestMapping("/toAddQueryJurisdiction")
	public ModelAndView toAddQueryJurisdiction(){
		List<QueryJurisdiction> newPageList=QueryJurisdictionService.findAllQueryJurisdiction();
		ModelAndView mav=new ModelAndView("/jsp/queryJurisdiction/addQueryJurisdiction.jsp");
		mav.addObject("newPageList", newPageList);
		return mav;
	}
	/**
	 * 新建查询权限组页面
	 * @param queryJurisdiction
	 * @return
	 */
	@RequestMapping("/addQueryJurisdiction")
	public ModelAndView addQueryJurisdiction(QueryJurisdiction queryJurisdiction){
		//新建查询权限组页面
		QueryJurisdictionService.addQueryJurisdiction(queryJurisdiction);
		ModelAndView mav=new ModelAndView("/jsp/queryJurisdiction/addQueryJurisdiction.jsp");
		mav.addObject("mess", "新建成功");
		return mav;
	}
}
