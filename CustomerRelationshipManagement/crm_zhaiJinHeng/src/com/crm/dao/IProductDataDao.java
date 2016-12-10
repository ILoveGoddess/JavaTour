package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.ProductData;

public interface IProductDataDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<ProductData> findProductData(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countProductData();
	/**
	 * 获得所有的商品资料列表
	 * @return
	 */
	public List<ProductData> findAllProductData();
	/**
	 * 查询最顶层的商品类别
	 * @return
	 */
	public List<ProductData> findRootProductData();
	/**
	 * 根据pid查询商品类别
	 * @param id
	 * @return
	 */
	public List<ProductData> findProductDatabyPid(@Param("ptypeId")Integer ptypeId);
	/**
	 * 新建商品资料
	 * @param productData
	 */
	public void addProductData(@Param("productData")ProductData productData);
	/**
	 * 根据id删除商品资料
	 * @param id
	 */
	public void deleteProductDataById(@Param("id")int id);
	/**
	 * 根据商品资料id获得商品资料信息
	 * @param productDataId
	 * @return
	 */
	public ProductData findProductDataById(@Param("id")int productDataId);

}
