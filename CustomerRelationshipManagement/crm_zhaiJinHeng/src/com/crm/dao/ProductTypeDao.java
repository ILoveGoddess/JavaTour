package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.ProductType;

public interface ProductTypeDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<ProductType> findProductType(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countProductType();
	/**
	 * 获得所有商品类别
	 * @return
	 */
	public List<ProductType> findAllProductType();
	/**
	 * 查询最顶层的商品类别
	 * @return
	 */
	public List<ProductType> findRootProductType();
	/**
	 * 根据pid查询商品类别
	 * @param id
	 * @return
	 */
	public List<ProductType> findProductTypebyPid(@Param("pid")Integer id);
	/**
	 * 新建商品类别
	 * @param productType
	 */
	public void addProductType(@Param("productType")ProductType productType);
	/**
	 * 获得此商品类别下的下一层的商品类别的数目
	 * @param id
	 * @return
	 */
	public int countProductTypeByPid(@Param("pid")int id);
	/**
	 * 获得此商品类别下的商品数目
	 * @param id
	 * @return
	 */
	public int countProduct(@Param("id")int id);
	/**
	 * 根据id删除商品类别
	 * @param id
	 */
	public void deleteProductTypeById(@Param("id")int id);
	/**
	 * 根据商品类别id获得商品类别信息
	 * @param productTypeId
	 * @return
	 */
	public ProductType findProductTypeById(@Param("id")int productTypeId);

}
