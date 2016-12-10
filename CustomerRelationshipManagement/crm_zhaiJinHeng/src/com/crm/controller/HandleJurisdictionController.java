package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.DataModel;
import com.crm.model.HandleJurisdiction;
import com.crm.model.Pager;
import com.crm.service.IHandleJurisdictionService;

@Controller
@RequestMapping("/handleJurisdictionClass")
public class HandleJurisdictionController {
	@Resource(name="IHandleJurisdictionService")
	private IHandleJurisdictionService HandleJurisdictionService;
	@RequestMapping("/handleJurisdictionPath")
	public ModelAndView getHandleJurisdiction(Pager pager){
		//查询显示列表所需的数据
		DataModel<HandleJurisdiction> data=HandleJurisdictionService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/handleJurisdiction/handleJurisdiction.jsp");
		mav.addObject("handleJurisdiction", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 操作权限组页面（支持删除）
	 * @param pager
	 * @param isDel
	 * @param role_id
	 * @return
	 */
	@RequestMapping("/HandleJurisdictionListOne")
	public ModelAndView getHandleJurisdictionListOne(Pager pager,String isDel,int[] role_id){
		
		if("del".equals(isDel)){
			//根据id删除操作权限组列表
			HandleJurisdictionService.deleteHandleJurisdiction(role_id);
		}
		//查询显示列表所需的数据
		DataModel<HandleJurisdiction> data=HandleJurisdictionService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/handleJurisdiction/handleJurisdiction.jsp");
		mav.addObject("handleJurisdiction", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建操作权限组页面
	 * @return
	 */
	@RequestMapping("/toAddHandleJurisdiction")
	public ModelAndView toAddHandleJurisdiction(){
		List<HandleJurisdiction> newPageList=HandleJurisdictionService.findAllHandleJurisdiction();
		ModelAndView mav=new ModelAndView("/jsp/handleJurisdiction/addHandleJurisdiction.jsp");
		mav.addObject("newPageList", newPageList);
		return mav;
	}
	/**
	 * 新建操作权限组页面
	 * @param handleJurisdiction
	 * @return
	 */
	@RequestMapping("/addHandleJurisdiction")
	public ModelAndView addHandleJurisdiction(HandleJurisdiction handleJurisdiction){
		//新建操作权限组页面
		HandleJurisdictionService.addHandleJurisdiction(handleJurisdiction);
		ModelAndView mav=new ModelAndView("/jsp/handleJurisdiction/addHandleJurisdiction.jsp");
		mav.addObject("mess", "新建成功");
		return mav;
	}
}
