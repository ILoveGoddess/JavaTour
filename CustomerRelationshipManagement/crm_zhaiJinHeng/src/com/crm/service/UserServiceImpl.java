package com.crm.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.UserDao;
import com.crm.model.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;
	/**
	 * 根据帐号和密码查询用户
	 */

	public User findUser(String name, String password) {
		return userDao.findUser(name,password);
		
	}


}
