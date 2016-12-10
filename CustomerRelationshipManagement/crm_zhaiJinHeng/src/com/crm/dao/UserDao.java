package com.crm.dao;

import org.apache.ibatis.annotations.Param;

import com.crm.model.User;

public interface UserDao {
	/**
	 * 根据帐号和密码查询用户
	 * @param name
	 * @param password
	 * @return
	 */
	public User findUser(@Param("name")String name, @Param("password")String password);

}
