package com.crm.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.IProductDataDao;
import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.ProductData;
import com.crm.model.ProductType;
@Service("IProductDataService")
public class IProductDataServiceImpl implements IProductDataService{
	@Resource
	private IProductDataDao ProductDataDao;
	/**
	 * 查询显示列表所需的数据
	 */
	@Override
	public DataModel<ProductData> findList(Pager pager) {
		DataModel<ProductData> data=new DataModel<ProductData>();
		//分页查询商品类别列表
		List<ProductData> list=ProductDataDao.findProductData(pager.getFrom(),pager.getPageSize());
		//查询总记录数
		int totalNum=ProductDataDao.countProductData();
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有的商品资料列表
	 */
	@Override
	public List<ProductData> findAllProductData() {
		return ProductDataDao.findAllProductData();
	}
	/**
	 * 拼接成有层次结构的字符串
	 */
	@Override
	public String getStr() {
		//查询最顶层的商品类别
		List<ProductData> rootList=ProductDataDao.findRootProductData();
		if(rootList!=null && rootList.size()>0){
			String str="";
			for (int i = 0; i < rootList.size(); i++) {
				ProductData p=rootList.get(i);
				str+="<option value='"+p.getPtypeId()+"'>"+p.getProductTypeName()+"</option>";
				str+=getChildrenStr(p.getPtypeId(),"");
			}
				return str;
		}else{
			return "";
		}
	}
	private String getChildrenStr(Integer ptypeId, String nbsp) {
		//根据ptypeId查询商品类别
		List<ProductData> list=ProductDataDao.findProductDatabyPid(ptypeId);
		if(list!=null){
			String str="";
			nbsp+="&nbsp;&nbsp;&nbsp;";
			for (int i = 0; i < list.size(); i++) {
				ProductData p=list.get(i);
				str+="<option value='"+p.getPtypeId()+"'>"+nbsp+p.getProductTypeName()+"</option>";
				str+=getChildrenStr(p.getPtypeId(),nbsp);
			}
				return str;
		}else{
			return "";
		}
	}
	/**
	 * 新建商品资料
	 */
	@Override
	public void addProductData(ProductData productData) {
		ProductDataDao.addProductData(productData);
	}
	/**
	 * 根据id删除商品资料
	 */
	@Override
	public void deleteProductData(int[] product_id) {
		if(product_id!=null){
			for (int i = 0; i < product_id.length; i++) {
				int id=product_id[i];
				//根据id删除商品资料
				ProductDataDao.deleteProductDataById(id);
			}
		}
	}
	/**
	 * 根据商品资料id获得商品资料
	 */
	@Override
	public ProductData findProductDataById(int productDataId) {
		return ProductDataDao.findProductDataById(productDataId);
	}
	/**
	 * 拼接成有层次结构的字符串
	 */
	@Override
	public String getStrOne(Integer ptypeId) {
		//查询最顶层的商品资料
		List<ProductData> rootList=ProductDataDao.findRootProductData();
		
		if(rootList!=null && rootList.size()>0){
			String str="";
			for (int i = 0; i < rootList.size(); i++) {
				ProductData p=rootList.get(i);
				if(ptypeId==p.getId()){
					str+="<option selected='selected' value='"+p.getId()+"'>"+p.getName()+"</option>";
				}else{
					str+="<option value='"+p.getId()+"'>"+p.getName()+"</option>";
				}
				str+=getChildrenStrOne(p.getId(),"",ptypeId);
				
			}
			
			return str;
		}else{
			return "";
		}
	}
	private String getChildrenStrOne(Integer id, String nbsp, int ptypeId) {
		//根据ptypeId查询商品类别
		List<ProductData> list=(List<ProductData>) ProductDataDao.findProductDataById(id);
		
		if(list!=null){
			String str="";
			nbsp+="&nbsp;&nbsp;&nbsp;";
			for (int i = 0; i < list.size(); i++) {
				ProductData p=list.get(i);
				if(ptypeId==p.getId()){
					str+="<option selected='selected' value='"+p.getId()+"'>"+nbsp+p.getName()+"</option>";
				}else{
					str+="<option value='"+p.getId()+"'>"+nbsp+p.getName()+"</option>";
				}
				str+=getChildrenStrOne(p.getId(),nbsp,ptypeId);
			}
			
			return str;
		}else{
			return "";
		}
	}
}
