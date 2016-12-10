package com.zrkc.syyh.dao;

import java.util.List;

import com.zrkc.syyh.model.Department;
import com.zrkc.syyh.model.Function;
import com.zrkc.syyh.model.Job;
import com.zrkc.syyh.model.User;
import com.zrkc.syyh.model.UserModel;
import com.zrkc.syyh.model.Xtymb;
/**
 * 
 * @author dz
 *
 */
public interface IUserDao {

	public User findUser(String loginId, String loginPassword);

	public List<Function> findFunctionsByJobId(Long jobId);

	public List<Xtymb> findXtymbList(long jobId, long funcId);

	public List<UserModel> userList(int from, int pageSize);

	public int countUser();

	public List<Department> findAllDepartment();

	public List<Job> findAllJob();

	public void addUser(User user);

	public void deleteUser(String loginId);

	public User findUserByLoginId(String loginId);

	public void updateUser(User user);

	public void updateUserStatus(String loginId, String string);

	public List<UserModel> userList(int from, int pageSize, User user);

	public int countUser(User user);

	

}
