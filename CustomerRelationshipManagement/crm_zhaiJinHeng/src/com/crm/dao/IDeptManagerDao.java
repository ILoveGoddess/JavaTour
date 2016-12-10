package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.DeptManager;

public interface IDeptManagerDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<DeptManager> findDeptManager(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countDeptManager();
	/**
	 * 获得所有的部门管理列表
	 * @return
	 */
	public List<DeptManager> findAllDeptManager();
	/**
	 * 查询最顶层的部门管理列表
	 * @return
	 */
	public List<DeptManager> findRootDeptManager();
	/**
	 * 根据pid查询部门管理列表
	 * @param id
	 * @return
	 */
	public List<DeptManager> findDeptManagerbyPid(@Param("pid")Integer id);
	/**
	 * 新建部门管理页面
	 * @param deptManager
	 */
	public void addDeptManager(@Param("deptManager")DeptManager deptManager);
	/**
	 * 根据id删除部门管理列表
	 * @param id
	 */
	public void deleteDeptManagerById(@Param("id")int id);

}
