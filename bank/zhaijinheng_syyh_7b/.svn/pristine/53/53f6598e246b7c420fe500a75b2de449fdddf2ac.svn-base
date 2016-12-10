package com.zrkc.syyh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zrkc.syyh.dao.IWxgDao;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.RepairViewModel;
import com.zrkc.syyh.model.Repairtype;
import com.zrkc.syyh.utils.ConnUtil;

public class WxgDaoImpl implements IWxgDao{
	
	public static void main(String[] args) {
		WxgDaoImpl w = new WxgDaoImpl();
		//System.out.println(w.getAllRepairType());
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

	public List<RepairViewModel> repairList(Pageinfo<RepairViewModel> pageinfo) {
		String sql = "select r.RepairID,b.Bank_Name,e.Equipment_Name,r.EquipmentEach_ID," +
				"g.Group_Name,r.Fault_Repair_Begin_Date,r.Repair_Status,r.Allocate_Status " +
				"from fault_repair r join bank b on r.Bank_id=b.Bank_id join " +
				"equipmenttype e on r.Equipment_id=e.Equipment_id join pi_group g on " +
				"r.Group_id=g.Group_id";
		
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
				repair.setGroupName(rs.getString(5));
				repair.setRepairDate(rs.getTimestamp(6));
				repair.setRepairStatus(rs.getString(7));
				repair.setAllocateStatus(rs.getString(8));
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
				"r.Fault_Repair_Begin_Date,g.Group_Name from fault_repair r join " +
				"equipmenttype e on r.Equipment_id=e.Equipment_id join pi_group g on " +
				"r.Group_id=g.Group_id where r.RepairID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		RepairViewModel repair = new RepairViewModel();
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, repairId);
			rs = prep.executeQuery();
			while(rs.next()){
				repair.setRepairId(rs.getLong(1));
				repair.setEquipmentName(rs.getString(2));
				repair.setEquipmentEachId(rs.getString(3));
				repair.setRepairDate(rs.getTimestamp(4));
				repair.setGroupName(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return repair;
	}

	public List<Repairtype> getAllRepairType() {
		String sql = "select * from fault_repair_type";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<Repairtype> list = new ArrayList<Repairtype>();
		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while(rs.next()){
				Repairtype type = new Repairtype();
				type.setTypeId(rs.getLong(1));
				type.setTypeValue(rs.getString(2));
				list.add(type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}		
		return list;
	}

	public void updateStatusTo2(RepairViewModel repair) {
		String sql = "update fault_repair set Repair_Status=1,PITYPE_Id=?,Fault_Repair_End_Date=?," +
				"Fault_Repair_Evaluation=? where RepairID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, repair.getTypeId());
			prep.setDate(2, new java.sql.Date(new Date().getTime()));
			prep.setString(3, repair.getRepairEvaluation());
			prep.setLong(4, repair.getRepairId());
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection( prep, conn);
		}
	}

}
