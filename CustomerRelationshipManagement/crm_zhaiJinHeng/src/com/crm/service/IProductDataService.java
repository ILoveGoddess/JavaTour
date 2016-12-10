package com.crm.service;

import java.util.List;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.ProductData;

public interface IProductDataService {

	public DataModel<ProductData> findList(Pager pager);

	public List<ProductData> findAllProductData();

	public String getStr();

	public void addProductData(ProductData productData);

	public void deleteProductData(int[] product_id);

	public ProductData findProductDataById(int productDataId);

	public String getStrOne(Integer ptypeId);

}
