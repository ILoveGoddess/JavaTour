package com.zrkc.syyh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrkc.syyh.dao.IXjDao;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.RepairViewModel;
import com.zrkc.syyh.utils.ConnUtil;

public class XjDaoImpl implements IXjDao{

	public static void main(String[] args) {
		XjDaoImpl x = new XjDaoImpl();
		//System.out.println(x.getRepairById(2));
		//x.updateGroup(2, 2);
	}
	
	public List<RepairViewModel> getAllRepairView() {
		String sql = "select r.RepairID,b.Bank_Name,e.Equipment_Name,r.EquipmentEach_ID," +
				"r.Fault_Repair_Begin_Date,r.Repair_Status,r.Allocate_Status from " +
				"fault_repair r join bank b on r.Bank_id=b.Bank_id join equipmenttype e " +
				"on r.Equipment_id=e.Equipment_id";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<RepairViewModel> list = new ArrayList<RepairViewModel>();
		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while(rs.next()){
				RepairViewModel repair = new RepairViewModel();
				repair.setRepairId(rs.getLong(1));
				repair.setBankName(rs.getString(2));
				repair.setEquipmentName(rs.getString(3));
				repair.setEquipmentEachId(rs.getString(4));
				repair.setRepairDate(rs.getTimestamp(5));
				repair.setRepairStatus(rs.getString(6));
				repair.setAllocateStatus(rs.getString(7));
				list.add(repair);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}

	public RepairViewModel getRepairById(long repairId) {
		String sql = "select r.RepairID,e.Equipment_Name,r.EquipmentEach_ID," +
				"r.Fault_Repair_Begin_Date from " +
				"fault_repair r join equipmenttype e " +
				"on r.Equipment_id=e.Equipment_id where r.RepairID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		RepairViewModel repair = new RepairViewModel();
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, repairId);
			rs = prep.executeQuery();
			while(rs.next()){
				repair.setRepairId(repairId);
				repair.setEquipmentName(rs.getString(2));
				repair.setEquipmentEachId(rs.getString(3));
				repair.setRepairDate(rs.getTimestamp(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return repair;
	}

	public void updateGroup(long repairId, long groupId) {
		String sql = "update fault_repair set Allocate_Status='1',Group_id=? where RepairID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, groupId);
			prep.setLong(2, repairId);
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}
	}

	public int getTotalCount() {
		String sql = "select count(*) from fault_repair";
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

	public List<RepairViewModel> xjList(Pageinfo<RepairViewModel> pageinfo) {
		String sql = "select r.RepairID,b.Bank_Name,e.Equipment_Name,r.EquipmentEach_ID," +
		"r.Fault_Repair_Begin_Date,r.Repair_Status,r.Allocate_Status from " +
		"fault_repair r join bank b on r.Bank_id=b.Bank_id join equipmenttype e " +
		"on r.Equipment_id=e.Equipment_id limit ?,3";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<RepairViewModel> list = new ArrayList<RepairViewModel>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1,pageinfo.getFrom());
			rs = prep.executeQuery();
			while(rs.next()){
				RepairViewModel repair = new RepairViewModel();
				repair.setRepairId(rs.getLong(1));
				repair.setBankName(rs.getString(2));
				repair.setEquipmentName(rs.getString(3));
				repair.setEquipmentEachId(rs.getString(4));
				repair.setRepairDate(rs.getTimestamp(5));
				repair.setRepairStatus(rs.getString(6));
				repair.setAllocateStatus(rs.getString(7));
				list.add(repair);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
		
	}

}
