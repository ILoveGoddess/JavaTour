package com.zrkc.syyh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrkc.syyh.dao.IGroupDao;
import com.zrkc.syyh.model.DeptModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.InspectionWorker;
import com.zrkc.syyh.model.InspectionGroup;
import com.zrkc.syyh.model.InspectionGroupModel;
import com.zrkc.syyh.utils.ConnUtil;

public class GroupDaoImpl implements IGroupDao{
	
	public static void main(String[] args) {
		GroupDaoImpl g = new GroupDaoImpl();
		//g.changeWorkerGroup("2", new String[]{"1"});
	}
	
	public int getTotalCount() {
		String sql = "select count(*) from pi_group";
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

	public List<InspectionGroupModel> groupList(Pageinfo<InspectionGroupModel> pageinfo) {
		String sql = "select g.*,count(w.Woker_id) from pi_group g left outer join " +
				"piwoker w on g.Group_id=w.Group_id " +
				"group by g.Group_id limit ?,3";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<InspectionGroupModel> list = new ArrayList<InspectionGroupModel>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, pageinfo.getFrom());
			rs = prep.executeQuery();
			while(rs.next()){
				InspectionGroupModel group = new InspectionGroupModel();
				group.setGroupId(rs.getLong(1));
				group.setGroupName(rs.getString(2));
				group.setWorkerCount(rs.getInt(3));
				list.add(group);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}

	public List<InspectionWorker> getAllWorker() {
		String sql = "select * from piwoker";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<InspectionWorker> list = new ArrayList<InspectionWorker>();
		try {
			prep = conn.prepareStatement(sql);
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

	public long addGroup(String groupName) {
		String sql = "insert into pi_group(Group_Name) values(?)";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, groupName);
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
		return getIdByName(groupName);
	}
	public long getIdByName(String groupName) {
		String sql = "select Group_id from pi_group where Group_Name = ?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		long groupId = 0;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, groupName);
			rs = prep.executeQuery();
			while(rs.next()){
				groupId = rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs,prep, conn);
		}		
		return groupId;
	}

	public void updateWorkerGroup(String[] values, long groupId) {
		String sql = "update piwoker set Group_id=? where Woker_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		for(int i=0;i<values.length;i++){
			try {
				prep = conn.prepareStatement(sql);
				prep.setLong(1,groupId );
				prep.setLong(2, Long.parseLong(values[i]));
				prep.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		ConnUtil.closeConnection(prep, conn);	
	}

	public InspectionGroup getGroupById(long groupId) {
		String sql = "select * from pi_group where Group_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		InspectionGroup group = new InspectionGroup();
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, groupId);
			rs = prep.executeQuery();
			while(rs.next()){
				group.setGroupId(groupId);
				group.setGroupName(rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs,prep, conn);
		}		
		return group;
	}

	public void updateGroup(InspectionGroup group) {
		String sql = "update pi_group set Group_Name=? where Group_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, group.getGroupName());
			prep.setLong(2, group.getGroupId());
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}

	public List<InspectionGroup> getAllGroup() {
		String sql = "select * from pi_group";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<InspectionGroup> list = new ArrayList<InspectionGroup>();
		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while(rs.next()){
				InspectionGroup group = new InspectionGroup();
				group.setGroupId(rs.getLong(1));
				group.setGroupName(rs.getString(2));
				list.add(group);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs,prep, conn);
		}		
		return list;
	}

	public List<InspectionWorker> getAllWorker(String groupId) {
		String sql = "select * from piwoker where Group_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<InspectionWorker> list = new ArrayList<InspectionWorker>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, Long.parseLong(groupId));
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

	public void changeWorkerGroup(String groupId, String[] workerIds) {
		String sql = "update piwoker set Group_id=? where Woker_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		for(int i=0;i<workerIds.length;i++){
			try {
				prep = conn.prepareStatement(sql);
				prep.setLong(1,Long.parseLong(groupId) );
				prep.setLong(2, Long.parseLong(workerIds[i]));
				prep.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		ConnUtil.closeConnection(prep, conn);		
	}
	
	
}
