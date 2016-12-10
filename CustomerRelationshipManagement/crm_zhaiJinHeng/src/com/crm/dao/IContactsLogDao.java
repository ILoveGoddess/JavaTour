package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.ContactsLog;

public interface IContactsLogDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<ContactsLog> findContactsLog(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countContactsLog();
	/**
	 * 获得所有的联系人记录列表
	 * @return
	 */
	public List<ContactsLog> findAllContactsLog();
	/**
	 * 新建联系人记录列表页面
	 * @param contactsLog
	 */
	public void addContactsLog(@Param("contactsLog")ContactsLog contactsLog);
	/**
	 * 根据id删除商品类别
	 * @param id
	 */
	public void deleteContactsLogById(@Param("id")int id);

}
