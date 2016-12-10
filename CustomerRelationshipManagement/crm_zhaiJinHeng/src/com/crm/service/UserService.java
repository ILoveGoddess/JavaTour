package com.crm.service;

import com.crm.model.User;

public interface UserService {

	public User findUser(String name, String password);

}
