package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.PersonnelManager;

public interface IPersonnelManagerDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<PersonnelManager> findPersonnelManager(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countPersonnelManager();
	/**
	 * 获得所有的人事管理列表
	 * @return
	 */
	public List<PersonnelManager> findAllPersonnelManager();
	/**
	 * 新建人事管理页面
	 * @param personnelManager
	 */
	public void addPersonnelManager(@Param("personnelManager")PersonnelManager personnelManager);
	/**
	 * 根据id删除人事管理列表
	 * @param id
	 */
	public void deletePersonnelManagerById(@Param("id")int id);

}
