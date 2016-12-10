package com.crm.service;

import java.util.List;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.ProductType;

public interface ProductTypeService {

	public DataModel<ProductType> findList(Pager pager);

	public List<ProductType> findAllProductType();

	public String getStr();

	public void addProductType(ProductType productType);

	public void deleteProductType(int[] productType_id);

	public ProductType findProductTypeById(int productTypeId);

	public String getStrOne(int pid);

}
