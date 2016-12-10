package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.SaleOrder;

public interface ISaleOrderDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<SaleOrder> findSaleOrder(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countSaleOrder();
	/**
	 * 获得所有的销售单列表
	 * @return
	 */
	public List<SaleOrder> findAllSaleOrder();
	/**
	 * 新建销售单页面
	 * @param saleOrder
	 */
	public void addSaleOrder(@Param("saleOrder")SaleOrder saleOrder);
	/**
	 * 根据id删除销售单
	 * @param id
	 */
	public void deleteSaleOrderById(@Param("id")int id);

}
