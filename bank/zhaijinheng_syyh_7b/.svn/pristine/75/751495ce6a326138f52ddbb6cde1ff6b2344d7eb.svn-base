package com.zrkc.syyh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrkc.syyh.dao.InspectionWorkerDao;
import com.zrkc.syyh.model.DeptModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.InspectionWorker;
import com.zrkc.syyh.utils.ConnUtil;

public class InspectionWorkerDaoImpl implements InspectionWorkerDao{
//	public static void main(String[] args) {
//		PiWorkerDaoImpl p = new PiWorkerDaoImpl();
//		p.deleteWorker("4");
//	}
	public int getTotalCount() {
		String sql = "select count(*) from piwoker";
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

	public List<InspectionWorker> piWorkerList(Pageinfo<InspectionWorker> pageinfo) {
		String sql = "select * from piwoker limit ?,3";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<InspectionWorker> list = new ArrayList<InspectionWorker>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, pageinfo.getFrom());
			rs = prep.executeQuery();
			while(rs.next()){
				InspectionWorker worker = new InspectionWorker();
				worker.setWorkerId(rs.getLong(1));
				worker.setGroupId(rs.getLong(2));
				worker.setWorkerName(rs.getString(3));
				worker.setWorkerTel1(rs.getString(4));
				worker.setWorkerTel2(rs.getString(5));
				list.add(worker);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}

	public void addWorker(InspectionWorker worker) {
		String sql = "insert into piwoker(Worker_Name,Worker_Tel_1,Worker_Tel_2)" +
				" values(?,?,?)";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1,worker.getWorkerName());
			prep.setString(2,worker.getWorkerTel1());
			prep.setString(3,worker.getWorkerTel2());
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}
	public InspectionWorker getWorkerById(long workerId) {
		String sql = "select * from piwoker where Woker_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		InspectionWorker worker = new InspectionWorker();
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, workerId);
			rs = prep.executeQuery();
			while(rs.next()){
				worker.setWorkerId(rs.getLong(1));
				worker.setGroupId(rs.getLong(2));
				worker.setWorkerName(rs.getString(3));
				worker.setWorkerTel1(rs.getString(4));
				worker.setWorkerTel2(rs.getString(5));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return worker;
	}
	public void updateWorker(InspectionWorker worker) {
		String sql = "update piwoker set Worker_Name=?,Worker_Tel_1=?," +
				"Worker_Tel_2=? where Woker_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1,worker.getWorkerName());
			prep.setString(2,worker.getWorkerTel1());
			prep.setString(3,worker.getWorkerTel2());
			prep.setLong(4, worker.getWorkerId());
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}
	public void deleteWorker(String workerId) {
		String sql = "delete from piwoker where Woker_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, Long.parseLong(workerId));
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}

}
