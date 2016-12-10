package com.crm.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.ProductTypeDao;
import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.ProductType;
@Service("productTypeService")
public class ProductTypeServiceImpl implements ProductTypeService {
	@Resource
	private ProductTypeDao productTypeDao;
	/**
	 * 查询显示列表所需的数据
	 */
	public DataModel<ProductType> findList(Pager pager) {
		
		DataModel<ProductType> data=new DataModel<ProductType>();
		//分页查询商品类别列表
		List<ProductType> list=productTypeDao.findProductType(pager.getFrom(),pager.getPageSize());
		//查询总记录数
		int totalNum=productTypeDao.countProductType();
		
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有商品类别
	 */
	public List<ProductType> findAllProductType() {
		
		return productTypeDao.findAllProductType();
	}
	/**
	 * 拼接成有层次结构的字符串
	 */
	public String getStr() {
		//查询最顶层的商品类别
		List<ProductType> rootList=productTypeDao.findRootProductType();
		
		if(rootList!=null && rootList.size()>0){
			String str="";
			for (int i = 0; i < rootList.size(); i++) {
				ProductType p=rootList.get(i);
				str+="<option value='"+p.getId()+"'>"+p.getName()+"</option>";
				str+=getChildrenStr(p.getId(),"");
				
			}
			
			return str;
		}else{
			return "";
		}
	}
	private String getChildrenStr(Integer id, String nbsp) {
		//根据pid查询商品类别
		List<ProductType> list=productTypeDao.findProductTypebyPid(id);
		
		if(list!=null){
			String str="";
			nbsp+="&nbsp;&nbsp;&nbsp;";
			for (int i = 0; i < list.size(); i++) {
				ProductType p=list.get(i);
				str+="<option value='"+p.getId()+"'>"+nbsp+p.getName()+"</option>";
				str+=getChildrenStr(p.getId(),nbsp);
			}
			
			return str;
		}else{
			return "";
		}

	}
	/**
	 * 新建商品类别
	 */
	public void addProductType(ProductType productType) {
		productType.setCreateTime(new Date());
		productTypeDao.addProductType(productType);
		
	}
	/**
	 * 删除商品类别
	 */
	@Override
	public void deleteProductType(int[] ids) {
		if(ids!=null){
			for (int i = 0; i < ids.length; i++) {
				int id=ids[i];
				//获得此商品类别下的下一层的商品类别的数目
				int num=productTypeDao.countProductTypeByPid(id);
				if(num==0){
					//获得此商品类别下的商品数目
					int num2=productTypeDao.countProduct(id);
					if(num2==0){
						//根据id删除商品类别
						productTypeDao.deleteProductTypeById(id);
					}
				}
			}
		}
	}
	/**
	 * 根据商品类别id获得商品类别信息
	 */
	@Override
	public ProductType findProductTypeById(int productTypeId) {
		return productTypeDao.findProductTypeById(productTypeId);
	}
	/**
	 * 拼接成有层次结构的字符串
	 */
	@Override
	public String getStrOne(int pid) {
		//查询最顶层的商品类别
		List<ProductType> rootList=productTypeDao.findRootProductType();
		
		if(rootList!=null && rootList.size()>0){
			String str="";
			for (int i = 0; i < rootList.size(); i++) {
				ProductType p=rootList.get(i);
				if(pid==p.getId()){
					str+="<option selected='selected' value='"+p.getId()+"'>"+p.getName()+"</option>";
				}else{
					str+="<option value='"+p.getId()+"'>"+p.getName()+"</option>";
				}
				str+=getChildrenStrOne(p.getId(),"",pid);
				
			}
			
			return str;
		}else{
			return "";
		}
	}
	private String getChildrenStrOne(Integer id, String nbsp, int pid) {
		//根据pid查询商品类别
		List<ProductType> list=productTypeDao.findProductTypebyPid(id);
		
		if(list!=null){
			String str="";
			nbsp+="&nbsp;&nbsp;&nbsp;";
			for (int i = 0; i < list.size(); i++) {
				ProductType p=list.get(i);
				if(pid==p.getId()){
					str+="<option selected='selected' value='"+p.getId()+"'>"+nbsp+p.getName()+"</option>";
				}else{
					str+="<option value='"+p.getId()+"'>"+nbsp+p.getName()+"</option>";
				}
				str+=getChildrenStrOne(p.getId(),nbsp,pid);
			}
			
			return str;
		}else{
			return "";
		}
	}
}
