package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.Receivables;
import com.crm.service.IReceivablesService;
@Controller
@RequestMapping("/receivablesClass")
public class ReceivablesController {
	@Resource(name="IReceivablesService")
	private IReceivablesService ReceivablesService;
	@RequestMapping("/receivablesPath")
	public ModelAndView getReceivables(Pager pager){
		//查询显示列表所需的数据
		DataModel<Receivables> data=ReceivablesService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/receivables/receivables.jsp");
		mav.addObject("receivables", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建应收款项页面
	 * @return
	 */
	@RequestMapping("/toAddReceivables")
	public ModelAndView toAddReceivables(){
		List<Receivables> newPageList=ReceivablesService.findAllReceivables();
		ModelAndView mav=new ModelAndView("/jsp/receivables/addReceivables.jsp");
		mav.addObject("newPageList", newPageList);
		return mav;
	}
	/**
	 * 新建应收款项页面
	 * @param receivables
	 * @return
	 */
	@RequestMapping("/addReceivables")
	public ModelAndView addReceivables(Receivables receivables){
		//新建商品类别
		ReceivablesService.addReceivables(receivables);
		ModelAndView mav=new ModelAndView("/jsp/receivables/addReceivables.jsp");
		mav.addObject("mess", "新建成功");
		return mav;
	}
}
