package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.QueryJurisdiction;

public interface IQueryJurisdictionDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<QueryJurisdiction> findQueryJurisdiction(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countQueryJurisdiction();
	/**
	 * 获得所有的查询权限组列表
	 * @return
	 */
	public List<QueryJurisdiction> findAllQueryJurisdiction();
	/**
	 * 新建查询权限组页面
	 * @param queryJurisdiction
	 */
	public void addQueryJurisdiction(@Param("queryJurisdiction")QueryJurisdiction queryJurisdiction);
	/**
	 * 根据id删除查询权限组列表
	 * @param id
	 */
	public void deleteQueryJurisdictionById(@Param("id")int id);

}
