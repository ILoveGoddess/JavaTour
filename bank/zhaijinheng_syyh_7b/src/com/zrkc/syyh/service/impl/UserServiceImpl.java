package com.zrkc.syyh.service.impl;

import java.util.List;

import com.zrkc.syyh.dao.IUserDao;
import com.zrkc.syyh.dao.impl.UserDaoImpl;
import com.zrkc.syyh.model.Department;
import com.zrkc.syyh.model.Function;
import com.zrkc.syyh.model.Job;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.User;
import com.zrkc.syyh.model.UserModel;
import com.zrkc.syyh.model.Xtymb;
import com.zrkc.syyh.service.IUserService;
/**
 * 
 * @author dz
 *
 */
public class UserServiceImpl implements IUserService {
	IUserDao userDao=new UserDaoImpl();
	/**
	 * 根据用户登录名和密码查找用户
	 */
	public User findUser(String loginId, String loginPassword) {
		return userDao.findUser(loginId,loginPassword);
	}
	/**
	 * 根据岗位id获得此岗们的功能，权限（这里指的是大模块）
	 */
	public List<Function> findFunctionsByJobId(Long jobId) {
		return userDao.findFunctionsByJobId(jobId);
	}
	/**
	 * 根据用户，根据模块id(funcId)获得左侧列表:子模块列表
	 */
	public List<Xtymb> leftList(User user, long funcId) {
		return userDao.findXtymbList(user.getJobId(),funcId);
	}
	/**
	 * 查出用户列表所需的数据
	 */
	public Pageinfo<UserModel> userList(String curpage) {
		int page=1;
		if(curpage!=null && !"".equals(curpage)){
			page=Integer.parseInt(curpage);
		}
		
		Pageinfo<UserModel> pageinfo=new Pageinfo<UserModel>();
		
		pageinfo.setCurpage(page);//设置当前页
		//查出当前页用户列表数据
		List<UserModel> list=userDao.userList(pageinfo.getFrom(),pageinfo.getPageSize());
		//查出总记录数
		int num=userDao.countUser();
		//把查出的数据放入pageinfo
		pageinfo.setPagedata(list);
		pageinfo.setTotalRecord(num);

		return pageinfo;
	}
	/**
	 * 查出所有部门
	 */
	public List<Department> findAllDepartment() {
		return userDao.findAllDepartment();
	}
	/**
	 * 查出所有的岗位
	 */
	public List<Job> findAllJob() {
		return userDao.findAllJob();
	}
	/**
	 * 新建用户
	 */
	public void addUser(User user) {
		userDao.addUser(user);
		
	}
	/**
	 * 根据loginId删除用户
	 */
	public void deleteUser(String loginId) {
		userDao.deleteUser(loginId);
		
	}
	/**
	 * 根据loginI获得用户和信息
	 */
	public User findUser(String loginId) {
		return userDao.findUserByLoginId(loginId);
	}
	/**
	 * 修改用户信息
	 */
	public void updateUser(User user) {
		userDao.updateUser(user);
	}
	/**
	 * 修改用户状态
	 */
	public void updateUserStatus(String loginId, String userStatus) {
		if(userStatus != null && userStatus.equals("1")){//当前为启用状态，要改为禁用状态
			userDao.updateUserStatus(loginId, "0");
		}else{//当前为禁用状态，要改为启用状态
			userDao.updateUserStatus(loginId, "1");
		}
	}
	/**
	 * 查处用户列表所需的数据
	 */
	public Pageinfo<UserModel> userList(String curpage, User user) {
		int page=1;
		if(curpage!=null && !"".equals(curpage)){
			page=Integer.parseInt(curpage);
		}
		
		Pageinfo<UserModel> pageinfo=new Pageinfo<UserModel>();
		
		pageinfo.setCurpage(page);//设置当前页
		//查出当前页用户列表数据
		List<UserModel> list=userDao.userList(pageinfo.getFrom(), pageinfo.getPageSize(), user);
		//查出总记录数
		int num=userDao.countUser(user);
		//把查出的数据放入pageinfo
		pageinfo.setPagedata(list);
		pageinfo.setTotalRecord(num);

		return pageinfo;
	}
}
