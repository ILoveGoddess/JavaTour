package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.CustomerVisit;

public interface ICustomerVisitDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<CustomerVisit> findCustomerVisit(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countCustomerVisit();
	/**
	 * 获得所有的客户拜访列表
	 * @return
	 */
	public List<CustomerVisit> findAllCustomerVisit();
	/**
	 * 新建客户拜访页面
	 * @param customerVisit
	 */
	public void addProductType(@Param("customerVisit")CustomerVisit customerVisit);
	/**
	 * 根据id删除客服拜访
	 * @param id
	 */
	public void deleteCustomerVisitById(@Param("id")int id);
}
