package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.HandleJurisdiction;

public interface IHandleJurisdictionDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<HandleJurisdiction> findHandleJurisdiction(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countHandleJurisdiction();
	/**
	 * 获得所有的操作权限组列表
	 * @return
	 */
	public List<HandleJurisdiction> findAllHandleJurisdiction();
	/**
	 * 新建操作权限组页面
	 * @param handleJurisdiction
	 */
	public void addHandleJurisdiction(@Param("handleJurisdiction")HandleJurisdiction handleJurisdiction);
	/**
	 * 根据id删除操作权限组列表
	 * @param id
	 */
	public void deleteHandleJurisdictionById(@Param("id")int id);

}
