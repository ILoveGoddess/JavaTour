package com.zrkc.syyh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zrkc.syyh.dao.ILogDao;
import com.zrkc.syyh.model.Log;
import com.zrkc.syyh.utils.ConnUtil;

public class LogDaoImpl implements ILogDao{
	/**
	 * 查出日志列表当前页所需的数据
	 */
	public List<Log> logList(int from, int pageSize) {
		String sql = "select log_id, Checkin_time, Checkout_time, Users_id" +
				" from logs" +
				" limit ?, ?";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Log> list = new ArrayList<Log>();
		try{
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, from);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while(rs.next()){
				Log log = new Log();
				log.setLogId(rs.getLong("log_id"));
				log.setCheckinTime(rs.getTimestamp("Checkin_time"));
				log.setCheckoutTime(rs.getTimestamp("Checkout_time"));
				log.setUserId(rs.getString("Users_id"));
				list.add(log);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return list;
	}
	/**
	 * 查出日志总数
	 */
	public int countLog() {
		String sql = "select count(log_id)" +
				" from logs";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int totalNum = 0;
		try{
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				totalNum = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return totalNum;
	}
	/**
	 * 查询所有日志
	 */
	public List<Log> findAllLog() {
		String sql = "select log_id, Checkin_time, Checkout_time, Users_id" +
				" from logs";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Log> list = new ArrayList<Log>();
		try{
			conn = ConnUtil.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			//log_id Checkin_time Checkout_time Users_id
			while(rs.next()){
				Log log = new Log();
				log.setLogId(rs.getLong(1));
				log.setCheckinTime(rs.getTimestamp(2));
				log.setCheckoutTime(rs.getTimestamp(3));
				log.setUserId(rs.getString(4));
				list.add(log);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return list;
	}
	/**
	 * 清空日志
	 */
	public void clearLog() {
		String sql = "delete from logs";
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);	
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(ps, conn);
		}
	}
	/**
	 * 添加日志
	 */
	public long addLog(Log log) {
		String userId = log.getUserId();
		Date date = log.getCheckinTime();
		long time = date.getTime();
		String sql = "insert into logs(Users_id,Checkin_time) values(?,?)";
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);	
			ps.setString(1, userId);
			ps.setDate(2,new java.sql.Date(time));
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(ps, conn);
		}		
		return selectIdByUser(userId);
	}
	private long selectIdByUser(String userId) {
		String sql = "select log_id from logs where Users_id=?";
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		long id = 0L;
		try {
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, userId);
			rs=ps.executeQuery();
			while(rs.next()){
				id = rs.getLong(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, ps, conn);
		}
		return id;
	}
	public void updateCheckoutTime(Long logId) {
		String sql = "update logs set Checkout_time=? where log_id=?";
		long time = new Date().getTime();
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setDate(1, new java.sql.Date(time));
			ps.setLong(2, logId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(ps, conn);
		}
	}
	public long saveLog(Log log) {
		return 0;
	}
	public void updateCheckoutTime(Long logId, Log log) {
		String sql = "update logs set Checkout_time=? where log_id=?";
		long time = new Date().getTime();
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			conn=ConnUtil.getConnection();
			ps=conn.prepareStatement(sql);
//			Date(1, log.getCheckoutTimeStr());
			ps.setLong(2, logId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(ps, conn);
		}
	}

}
