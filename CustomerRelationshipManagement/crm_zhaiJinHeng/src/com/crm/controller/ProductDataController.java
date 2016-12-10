package com.crm.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.ProductData;
import com.crm.model.ProductType;
import com.crm.service.IProductDataService;
@Controller
@RequestMapping("/productDataClass")
public class ProductDataController {
	@Resource(name="IProductDataService")
	private IProductDataService ProductDataService;
	@RequestMapping("/productDataPath")
	public ModelAndView getProductData(Pager pager){
		//查询显示列表所需的数据
		DataModel<ProductData> data=ProductDataService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/productData/productData.jsp");
		mav.addObject("productData", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 商品资料页面（支持删除）
	 * @param pager
	 * @param isDel
	 * @param product_id
	 * @return
	 */
	@RequestMapping("/ProductDataListOne")
	public ModelAndView getProductDataListOne(Pager pager,String isDel,int[] product_id){
		
		if("del".equals(isDel)){
			//根据id删除商品资料
			ProductDataService.deleteProductData(product_id);
		}
		//查询显示列表所需的数据
		DataModel<ProductData> data=ProductDataService.findList(pager);
		ModelAndView mav = new ModelAndView("/jsp/productData/productData.jsp");
		mav.addObject("productData", data.getRows());
		mav.addObject("pager", data.getPager());
		return mav;
	}
	/**
	 * 跳转到新建商品资料页面
	 * @return
	 */
//	@RequestMapping("/toAddProductData")
//	public ModelAndView toAddProductData(){
//		List<ProductData> newPageList=ProductDataService.findAllProductData();
//		ModelAndView mav=new ModelAndView("/jsp/productData/addProductData.jsp");
//		mav.addObject("newPageList", newPageList);
//		return mav;
//	}
	/**
	 * 跳转到新建商品资料页面
	 * @return
	 */
	@RequestMapping("/toAddProductData")
	public ModelAndView toAddProductData(){
		//拼接成有层次结构的字符串
		String str=ProductDataService.getStr();
		
		ModelAndView mav=new ModelAndView("/jsp/productData/addProductData.jsp");
		mav.addObject("str", str);
		return mav;
	}
	/**
	 * 新建商品资料
	 * @param productData
	 * @return
	 */
	@RequestMapping("/addProductData")
	public ModelAndView addProductData(ProductData productData){
		//新建商品资料
		ProductDataService.addProductData(productData);
		String str=ProductDataService.getStr();
		ModelAndView mav=new ModelAndView("/jsp/productData/addProductData.jsp");
		mav.addObject("str", str);
		mav.addObject("mess", "新建成功");
		return mav;
	}
	/**
	 * 跳转到修改页面
	 * @return
	 */
	@RequestMapping("/toUpdateProductData")
	public ModelAndView toUpdateProductType(int productDataId){
		//根据商品类别id获得商品类别信息
		ProductData productData=ProductDataService.findProductDataById(productDataId);
		//拼接成有层次结构的字符串
		String str=ProductDataService.getStrOne(productData.getPtypeId());
		ModelAndView mav=new ModelAndView("/jsp/productData/addProductData.jsp");
		mav.addObject("productData", productData);
		mav.addObject("str", str);
		return mav;
	}
}
