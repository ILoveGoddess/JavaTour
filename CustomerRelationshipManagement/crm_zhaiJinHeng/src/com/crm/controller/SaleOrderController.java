package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.SaleOrder;
import com.crm.service.ISaleOrderService;
@Controller
@RequestMapping("/saleOrderClass")
public class SaleOrderController {
	@Resource(name="ISaleOrderService")
	private ISaleOrderService SaleOrderService;
	@RequestMapping("/saleOrderPath")
	public ModelAndView getSaleOrder(Pager pager){
		//查询显示列表所需的数据
		DataModel<SaleOrder> data=SaleOrderService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/saleOrder/saleOrder.jsp");
		mav.addObject("saleOrder", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 销售单页面（支持删除）
	 * @param pager
	 * @param isDel
	 * @param order_id
	 * @return
	 */
	@RequestMapping("/SaleOrderListOne")
	public ModelAndView getSaleOrderListOne(Pager pager,String isDel,int[] order_id){
		
		if("del".equals(isDel)){
			//根据id删除销售单列表
			SaleOrderService.deleteSaleOrder(order_id);
		}
		//查询显示列表所需的数据
		DataModel<SaleOrder> data=SaleOrderService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/saleOrder/saleOrder.jsp");
		mav.addObject("saleOrder", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建销售单页面
	 * @return
	 */
	@RequestMapping("/toAddSaleOrder")
	public ModelAndView toAddSaleOrder(){
		List<SaleOrder> newPageList=SaleOrderService.findAllSaleOrder();
		ModelAndView mav=new ModelAndView("/jsp/saleOrder/addSaleOrder.jsp");
		mav.addObject("newPageList", newPageList);
		return mav;
	}
	/**
	 * 新建销售单页面
	 * @param saleOrder
	 * @return
	 */
	@RequestMapping("/addSaleOrder")
	public ModelAndView addSaleOrder(SaleOrder saleOrder){
		//新建商品类别
		SaleOrderService.addSaleOrder(saleOrder);
		ModelAndView mav=new ModelAndView("/jsp/saleOrder/addSaleOrder.jsp");
		mav.addObject("mess", "新建成功");
		return mav;
	}
}
