package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.SaleCollection;
import com.crm.service.ISaleCollectionService;
@Controller
@RequestMapping("/saleCollectionClass")
public class SaleCollectionController {
	@Resource(name="ISaleCollectionService")
	private ISaleCollectionService SaleCollectionService;
	@RequestMapping("/saleCollectionPath")
	public ModelAndView getSaleCollection(Pager pager){
		//查询显示列表所需的数据
		DataModel<SaleCollection> data=SaleCollectionService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/saleCollection/saleCollection.jsp");
		mav.addObject("saleCollection", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建销售收款页面
	 * @return
	 */
	@RequestMapping("/toAddSaleCollection")
	public ModelAndView toAddSaleCollection(){
		List<SaleCollection> newPageList=SaleCollectionService.findAllSaleCollection();
		ModelAndView mav=new ModelAndView("/jsp/saleCollection/addSaleCollection.jsp");
		mav.addObject("newPageList", newPageList);
		return mav;
	}
}
