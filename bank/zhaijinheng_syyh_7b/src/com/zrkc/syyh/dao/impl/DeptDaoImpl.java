package com.zrkc.syyh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrkc.syyh.dao.IDeptDao;
import com.zrkc.syyh.model.Department;
import com.zrkc.syyh.model.DeptModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.utils.ConnUtil;

public class DeptDaoImpl implements IDeptDao{
	
	public static void main(String[] args) {
		DeptDaoImpl d = new DeptDaoImpl();
		d.insertDept("吃白饭的");
	}
	
	public List<DeptModel> deptList(Pageinfo<DeptModel> pageinfo ) {
		String sql = "select Department_id,Department_Name from department limit ?,3";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<DeptModel> list = new ArrayList<DeptModel>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, pageinfo.getFrom());
			rs = prep.executeQuery();
			while(rs.next()){
				DeptModel dept = new DeptModel();
				dept.setDepartmentId(rs.getLong(1));
				dept.setDepartmentName(rs.getString(2));
				dept.setTotalUser(countUser(rs.getLong(1)));
				list.add(dept);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}
	
	public int countUser(long deptId){
		String sql = "select count(*) from department d join users u where d.Department_id=" +
				"u.Department_id and d.Department_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		int count = 0;
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, deptId);
			rs = prep.executeQuery();
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}		
		return count;
	}
	
	public int getTotalCount() {
		String sql = "select count(*) from department";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		int count = 0;
		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}		
		return count;
	}

	public void deleteDept(long deptId) {
		String sql = "delete from department where Department_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, deptId);
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection( prep, conn);
		}				
	}

	public Department selectDeptById(String departmentId) {
		long deptId = Long.parseLong(departmentId);
		String sql = "select * from department where Department_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		Department dept = new Department();
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, deptId);
			rs = prep.executeQuery();
			while(rs.next()){
				dept.setDepartmentId(rs.getLong(1));
				dept.setDepartmentName(rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}		
		return dept;
	}

	public void updateDept(Department dept) {
		String sql = "update department set Department_Name=? where Department_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, dept.getDepartmentName());
			prep.setLong(2, dept.getDepartmentId());
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection( prep, conn);
		}		
	}

	public void insertDept(String deptName) {
		String sql = "insert into department(Department_Name) values(?)";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, deptName);			
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection( prep, conn);
		}		
	}
}
