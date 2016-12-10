package com.zrkc.syyh.service;

import java.util.List;

import com.zrkc.syyh.model.Department;
import com.zrkc.syyh.model.Function;
import com.zrkc.syyh.model.Job;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.User;
import com.zrkc.syyh.model.UserModel;
import com.zrkc.syyh.model.Xtymb;

public interface IUserService {

	public User findUser(String loginId, String loginPassword);

	public List<Function> findFunctionsByJobId(Long jobId);

	public List<Xtymb> leftList(User user, long funcId);

	public Pageinfo<UserModel> userList(String curpage);

	public List<Department> findAllDepartment();

	public List<Job> findAllJob();

	public void addUser(User user);

	public void deleteUser(String loginId);

	public User findUser(String loginId);

	public void updateUser(User user);

	public void updateUserStatus(String loginId, String userStatus);

	public Pageinfo<UserModel> userList(String curpage, User user);

	
	



	



}
