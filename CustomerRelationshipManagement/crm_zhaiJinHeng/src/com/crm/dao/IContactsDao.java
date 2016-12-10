package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.Contacts;

public interface IContactsDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<Contacts> findContacts(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countContacts();
	/**
	 * 获得所有的联系人列表
	 * @return
	 */
	public List<Contacts> findAllContacts();
	/**
	 * 新建联系人列表页面
	 * @param contacts
	 */
	public void addContacts(@Param("contacts")Contacts contacts);
	/**
	 * 根据id删除联系人
	 * @param id
	 */
	public void deleteContactsById(@Param("id")int id);
	
}
