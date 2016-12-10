package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.SaleCollection;

public interface ISaleCollectionDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<SaleCollection> findSaleCollection(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countSaleCollection();
	/**
	 * 获得所有的销售收款列表
	 * @return
	 */
	public List<SaleCollection> findAllSaleCollection();

}
