package com.zrkc.syyh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.zrkc.syyh.dao.IUserDao;
import com.zrkc.syyh.model.Department;
import com.zrkc.syyh.model.Function;
import com.zrkc.syyh.model.Job;
import com.zrkc.syyh.model.User;
import com.zrkc.syyh.model.UserModel;
import com.zrkc.syyh.model.Xtymb;
import com.zrkc.syyh.utils.ConnUtil;
/**
 * 
 * @author dz
 *
 */
public class UserDaoImpl implements IUserDao{
	/**
	 * 根据用户登录名和密码查找用户
	 */
	public User findUser(String loginId, String loginPassword) {
		String sql="select Job_ID,Department_id,User_Name,User_Status" +
				" from users" +
				" where Login_ID=?" +
				" and Login_Password=?";
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		User user=null;
		try {
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, loginId);
			ps.setString(2, loginPassword);
			rs=ps.executeQuery();
			if(rs.next()){
				user=new User();
				user.setLoginId(loginId);
				user.setLoginPassword(loginPassword);
				user.setJobId(rs.getLong("Job_ID"));
				user.setDepartmentId(rs.getLong("Department_id"));
				user.setUserName(rs.getString("User_Name"));
				user.setUserStatus(rs.getString("User_Status"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return user;
	}
	/**
	 * 根据岗位id获得此岗们的功能，权限（这里指的是大模块）
	 */
	public List<Function> findFunctionsByJobId(Long jobId) {
		String sql="select distinct f.Func_ID,f.Func_Name " +
				"from functions f join xtymb x on f.Func_ID=x.Func_ID " +
				"join gwym g on x.ymbh=g.ymbh " +
				"where g.Job_ID=?";
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Function> list=new ArrayList<Function>();
		try {
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setLong(1, jobId);
			rs=ps.executeQuery();
			while(rs.next()){
				Function function = new Function();
				function.setFuncId(rs.getLong("Func_ID"));
				function.setFuncName(rs.getString("Func_Name"));
				list.add(function);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return list;
	}
	/**
	 * 根据岗位id，根据模块id获得左侧列表:子模块列表
	 */
	public List<Xtymb> findXtymbList(long jobId, long funcId) {
		String sql="select x.ymbh,x.Func_ID,x.ymmc,x.URL,x.IMG " +
				"from xtymb x join gwym g on x.ymbh=g.ymbh " +
				"where g.Job_ID=? " +
				"and x.Func_ID=?";
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Xtymb> list=new ArrayList<Xtymb>();
		try {
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setLong(1, jobId);
			ps.setLong(2, funcId);
			rs=ps.executeQuery();
			while(rs.next()){
				Xtymb x = new Xtymb();
				x.setYmbh(rs.getLong("ymbh"));
				x.setFuncId(funcId);
				x.setYmmc(rs.getString("ymmc"));
				x.setUrl(rs.getString("URL"));
				x.setImg(rs.getString("IMG"));
				list.add(x);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return list;
	}
	/**
	 * 查出当前页数据
	 */
	public List<UserModel> userList(int from, int pageSize) {
		String sql="select u.Login_ID,u.Job_ID,u.Department_id,u.Login_Password,u.User_Name,u.User_Status,d.Department_Name,j.`Name`" +
				" from users u left join department d on u.Department_id=d.Department_id " +
				" left join job j on u.Job_ID=j.Job_ID " +
				" limit ?,?";
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<UserModel> list=new ArrayList<UserModel>();
		
		try{
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, from);
			ps.setInt(2, pageSize);
			rs=ps.executeQuery();
			
			while(rs.next()){
				UserModel user=new UserModel();
				user.setLoginId(rs.getString("Login_ID"));	
				user.setJobId(rs.getLong("Job_ID"));
				user.setDepartmentId(rs.getLong("Department_id"));
				user.setLoginPassword(rs.getString("Login_Password"));
				user.setUserName(rs.getString("User_Name"));
				user.setUserStatus(rs.getString("User_Status"));
				user.setDepartmentName(rs.getString("Department_Name"));
				user.setJobName(rs.getString("Name"));
				list.add(user);
				
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return list;
	}
	/**
	 * 查出总记录数
	 */
	public int countUser() {
		String sql="select count(Login_ID) from users";
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int totalNum=0;
		
		try{
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				totalNum=rs.getInt(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return totalNum;
	}
	/**
	 * 查出所有部门
	 */
	public List<Department> findAllDepartment() {
		String sql = "select Department_id, Department_Name from department";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Department> list = new ArrayList<Department>();
		
		try {
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Department dept = new Department();
				dept.setDepartmentId(rs.getLong("Department_id"));
				dept.setDepartmentName(rs.getString("Department_Name"));
				list.add(dept);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return list;
	}
	/**
	 * 查出所有岗位
	 */
	public List<Job> findAllJob() {
		String sql = "select Job_ID, Group_id, Name, Description from job";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Job> list = new ArrayList<Job>();
		try{
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Job job = new Job();
				job.setJobId(rs.getLong("Job_ID"));
				job.setGroupId(rs.getLong("Group_id"));
				job.setName(rs.getString("Name"));
				job.setDescription(rs.getString("Description"));
				list.add(job);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return list;
	}
	/**
	 * 新建用户
	 */
	public void addUser(User user) {
		String sql = "insert into users(Login_ID, Job_ID, Department_id, Login_Password, User_Name, User_Status) values(?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getLoginId());
			ps.setLong(2, user.getJobId());
			ps.setLong(3, user.getDepartmentId());
			ps.setString(4, user.getLoginPassword());
			ps.setString(5, user.getUserName());
			ps.setString(6, user.getUserStatus());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			ConnUtil.closeConnection(ps, conn);
		}
		
	}
	/**
	 * 根据loginId删除用户
	 */
	public void deleteUser(String loginId) {
		String sql = "delete from users where Login_ID = ?";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, loginId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			ConnUtil.closeConnection(ps, conn);
		}
	}
	/**
	 * 根据loginId获得用户信息
	 */
	public User findUserByLoginId(String loginId) {
		String sql = "select Job_ID, Department_id, Login_Password, User_Name, User_Status" +
				" from users" +
				" where Login_ID=?";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		try{
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, loginId);
			rs = ps.executeQuery();
			if(rs.next()){
				user = new User();
				user.setLoginId(loginId);
				user.setJobId(rs.getLong("Job_ID"));
				user.setDepartmentId(rs.getLong("Department_id"));
				user.setLoginPassword(rs.getString("Login_Password"));
				user.setUserName(rs.getString("User_Name"));
				user.setUserStatus(rs.getString("User_Status"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return user;
	}
	/**
	 * 修改用户信息
	 */
	public void updateUser(User user) {
		String sql = "update users" +
				" set Job_ID = ?, Department_id = ?, Login_Password = ?, User_Name = ?, User_Status = ?" +
				" where Login_ID = ?";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setLong(1, user.getJobId());
			ps.setLong(2, user.getDepartmentId());
			ps.setString(3, user.getLoginPassword());
			ps.setString(4, user.getUserName());
			ps.setString(5, user.getUserStatus());
			ps.setString(6, user.getLoginId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			ConnUtil.closeConnection(ps, conn);
		}
	}
	/**
	 * 修改用户状态
	 */
	public void updateUserStatus(String loginId, String userStatus) {
		String sql = "update users" +
				" set User_Status = ?" +
				" where Login_ID = ?";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userStatus);
			ps.setString(2, loginId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			ConnUtil.closeConnection(ps, conn);
		}
	}
	/**
	 * 查出当前页用户列表数据(分页+模糊查询)
	 */
	public List<UserModel> userList(int from, int pageSize, User user) {
		String sql="select u.Login_ID,u.Job_ID,u.Department_id,u.Login_Password,u.User_Name,u.User_Status,d.Department_Name,j.`Name`" +
				" from users u left join department d on u.Department_id=d.Department_id " +
				" left join job j on u.Job_ID=j.Job_ID " +
				" where 1 = 1";
		if(user != null && user.getLoginId() != null && !"".equals(user.getLoginId().trim())){
			sql += " and u.Login_ID like '%" + user.getLoginId() + "%'";
		}
		if(user != null && user.getUserName() != null && !user.getUserName().trim().equals("")){
			sql += " and u.User_Name like '%" + user.getUserName() + "%'";
		}
				 
		sql += " limit ?,?";
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<UserModel> list=new ArrayList<UserModel>();
		
		try{
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, from);
			ps.setInt(2, pageSize);
			rs=ps.executeQuery();
			while(rs.next()){
				UserModel userModel=new UserModel();
				userModel.setLoginId(rs.getString("Login_ID"));	
				userModel.setJobId(rs.getLong("Job_ID"));
				userModel.setDepartmentId(rs.getLong("Department_id"));
				userModel.setLoginPassword(rs.getString("Login_Password"));
				userModel.setUserName(rs.getString("User_Name"));
				userModel.setUserStatus(rs.getString("User_Status"));
				userModel.setDepartmentName(rs.getString("Department_Name"));
				userModel.setJobName(rs.getString("Name"));
				list.add(userModel);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return list;
	}
	/**
	 * 根据查询条件统计用户数目
	 */
	public int countUser(User user) {
		String sql="select count(Login_ID) from users where 1=1";
		if(user != null && user.getLoginId() != null && !"".equals(user.getLoginId().trim())){
			sql += " and Login_ID like '%" + user.getLoginId() + "%'";
		}
		if(user != null && user.getUserName() != null && !"".equals(user.getUserName().trim())){
			sql += " and User_Name like '%" + user.getUserName() + "%'";
		}
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int totalNum=0;
		
		try{
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				totalNum=rs.getInt(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return totalNum;
	}
	
}
