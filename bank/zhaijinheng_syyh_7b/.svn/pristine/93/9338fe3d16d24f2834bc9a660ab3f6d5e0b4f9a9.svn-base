package com.zrkc.syyh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrkc.syyh.dao.IJobDao;
import com.zrkc.syyh.model.FunctionModel;
import com.zrkc.syyh.model.GwymModel;
import com.zrkc.syyh.model.Job;
import com.zrkc.syyh.model.JobModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.XtymbModel;
import com.zrkc.syyh.utils.ConnUtil;

public class JobDaoImpl implements IJobDao{
	public static void main(String[] args) {
		JobDaoImpl j = new JobDaoImpl();
		j.deleteJob(7);
	}
	public List<JobModel> getAllJob(Pageinfo<JobModel> pageinfo) {
		String sql = "select j.*,count(u.Login_ID) count from job j left outer" +
				" join users u on j.Job_ID=u.Job_ID group by j.Job_ID limit ?,3";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<JobModel> list = new ArrayList<JobModel>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, pageinfo.getFrom());
			rs = prep.executeQuery();
			while(rs.next()){
				JobModel jobModel = new JobModel();
				jobModel.setJobId(rs.getLong(1));
				jobModel.setGroupId(rs.getLong(2));
				jobModel.setName(rs.getString(3));
				jobModel.setDescription(rs.getString(4));
				jobModel.setUserCount(rs.getInt(5));
				list.add(jobModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}

	public int getTotalRecord() {
		String sql = "select count(*) from job";
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

	public List<GwymModel> getAllGwym(String jobIdStr,
			Pageinfo<GwymModel> pageinfo) {
		long jobId = 1l;
		if(jobIdStr != null && jobIdStr != ""){
			jobId = Long.parseLong(jobIdStr);
		}
		String sql = "select g.Job_ID,g.ymbh,x.ymmc,f.Func_Name from gwym g join xtymb x" +
				" on g.ymbh=x.ymbh join functions f on x.Func_ID=f.Func_ID" +
				" where g.Job_ID=? limit ?,3";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<GwymModel> list = new ArrayList<GwymModel>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, jobId);
			prep.setInt(2, pageinfo.getFrom());
			rs = prep.executeQuery();
			while(rs.next()){
				GwymModel gwymModel = new GwymModel();
				gwymModel.setJobId(rs.getLong(1));
				gwymModel.setYmbh(rs.getLong(2));
				gwymModel.setYmmc(rs.getString(3));
				gwymModel.setFuncName(rs.getString(4));
				list.add(gwymModel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}

	public int getTotalXtymb(String jobIdStr) {
		long jobId = 1l;
		if(jobIdStr != null && jobIdStr != ""){
			jobId = Long.parseLong(jobIdStr);
		}
		String sql = "select count(*) from gwym where Job_ID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		int count = 0;
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, jobId);
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
	public void insertJob(Job job) {
		String sql = "insert into job(Name,Description) values(?,?)";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, job.getName());
			prep.setString(2,job.getDescription());
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}
	public Job getJobById(long jobId) {
		String sql = "select Name,Description from job where Job_ID=? ";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		Job job = new Job();
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, jobId);
			rs = prep.executeQuery();
			while(rs.next()){
				job.setName(rs.getString(1));
				job.setDescription(rs.getString(2));
				job.setJobId(jobId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}		
		return job;
	}
	public void updateJob(Job job) {
		String sql = "update job set Name=?,Description=? where Job_ID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, job.getName());
			prep.setString(2,job.getDescription());
			prep.setLong(3, job.getJobId());
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}
	public List<FunctionModel> getAllFunc(long jobId) {
		String sql = "select Func_ID,Func_Name from functions";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<FunctionModel> list = new ArrayList<FunctionModel>();
		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while(rs.next()){
				FunctionModel fm = new FunctionModel();
				long funcId = rs.getLong(1);
				int contains = contains( jobId, funcId);
				fm.setFuncId(funcId);
				fm.setFuncName(rs.getString(2));
				fm.setContains(contains);
				list.add(fm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}		
		return list;
	}
	public int contains(long jobId,long funcId){
		String sql ="select count(g.ymbh)from gwym g join xtymb x on g.ymbh=x.ymbh " +
				"join functions f on x.Func_ID=f.Func_ID where g.Job_ID=? " +
				"and f.Func_ID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		int count = 0;
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, jobId);
			prep.setLong(2, funcId);
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
	public List<XtymbModel> getAllXtym(long funcId, long jobId) {
		String sql = "select ymbh,ymmc from xtymb  " +
				" where " +
				" Func_ID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<XtymbModel> list = new ArrayList<XtymbModel>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, funcId);
			rs = prep.executeQuery();
			while(rs.next()){
				XtymbModel x = new XtymbModel();
				x.setFuncId(funcId);
				x.setYmbh(rs.getLong(1));
				x.setYmmc(rs.getString(2));
				x.setHasPow(hasPow(jobId,rs.getLong(1)));
				list.add(x);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}				
		return list;
	}
	public int hasPow(long jobId,long ymbh){
		String sql = "select * from gwym where Job_ID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, jobId);
			rs = prep.executeQuery();
			while(rs.next()){
				if(rs.getLong(2) == ymbh){
					return 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}			
		return 0;
	}
	public String getFuncName(long funcId) {
		String sql = "select Func_Name from functions where Func_ID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		String funcName = "";
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, funcId);
			rs = prep.executeQuery();
			while(rs.next()){
				funcName = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}						
		return funcName;
	}
	public void deleteAllGwym(long jobId, long funcId) {
		String sql ="delete from gwym where Job_ID=? and ymbh in " +
				"(select ymbh from xtymb where Func_ID=?)";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, jobId);
			prep.setLong(2, funcId);	
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}						
	}
	public void addGwym(long jobId, String[] values) {
		String sql = "insert into gwym(Job_ID,ymbh) values(?,?)";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		for(int i=0;i<values.length;i++){
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, jobId);
			prep.setLong(2, Long.parseLong(values[i]));	
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}	
		ConnUtil.closeConnection(prep, conn);					
	}
	public void deleteJob(long jobId) {
		String sql = "delete from job where Job_ID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, jobId);
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}
	
	
}
