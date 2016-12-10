package com.crm.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.ProductType;
import com.crm.service.ProductTypeService;

@Controller
@RequestMapping("/productType")
public class ProductTypeController {
	@Resource(name="productTypeService")
	private ProductTypeService productTypeService;
	
	@RequestMapping("/productTypeList")
	public ModelAndView getProductTypeList(Pager pager){
		//查询显示列表所需的数据
		DataModel<ProductType> data=productTypeService.findList(pager);
		
		ModelAndView mav=new ModelAndView("/jsp/productType/productTypeList.jsp");
		mav.addObject("productTypeList", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 商品类别列表（支持删除）
	 * @param pager
	 * @return
	 */
	@RequestMapping("/productTypeListOne")
	public ModelAndView getProductTypeListOne(Pager pager,String isDel,int[] productType_id){
		
		if("del".equals(isDel)){
			//根据id删除商品类别
			productTypeService.deleteProductType(productType_id);
		}
		
		//查询显示列表所需的数据
		DataModel<ProductType> data=productTypeService.findList(pager);
		
		ModelAndView mav=new ModelAndView("/jsp/productType/productTypeList.jsp");
		mav.addObject("productTypeList", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建商品类别页面
	 * @return
	 */
//	@RequestMapping("/toAddProductType")
//	public ModelAndView toAddProductType(){
//		List<ProductType> list=productTypeService.findAllProductType();
//		
//		ModelAndView mav=new ModelAndView("/jsp/productType/productTypeAdd.jsp");
//		mav.addObject("list", list);
//		return mav;
//	}
	
	/**
	 * 跳转到新建商品类别页面
	 * @return
	 */
	@RequestMapping("/toAddProductType")
	public ModelAndView toAddProductType(){
		//拼接成有层次结构的字符串
		String str=productTypeService.getStr();
		
		ModelAndView mav=new ModelAndView("/jsp/productType/productTypeAdd.jsp");
		mav.addObject("str", str);
		return mav;
	}
	/**
	 * 新建商品类别
	 * @param productType
	 * @return
	 */
	@RequestMapping("/addProductType")
	public ModelAndView addProductType(ProductType productType){
		//新建商品类别
		productTypeService.addProductType(productType);
		String str=productTypeService.getStr();
		
		ModelAndView mav=new ModelAndView("/jsp/productType/productTypeAdd.jsp");
		mav.addObject("str", str);
		mav.addObject("mess", "新建成功");
		return mav;
	}
	/**
	 * 跳转到修改页面
	 * @return
	 */
	@RequestMapping("/toUpdateProductType")
	public ModelAndView toUpdateProductType(int productTypeId){
		//根据商品类别id获得商品类别信息
		ProductType productType=productTypeService.findProductTypeById(productTypeId);
		//拼接成有层次结构的字符串
		String str=productTypeService.getStrOne(productType.getPid());
		ModelAndView mav=new ModelAndView("/jsp/productType/productTypeAdd.jsp");
		mav.addObject("productType", productType);
		mav.addObject("str", str);
		return mav;
	}
	
}
