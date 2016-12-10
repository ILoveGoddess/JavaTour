package com.zrkc.syyh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zrkc.syyh.dao.IRepairDao;
import com.zrkc.syyh.model.DeptModel;
import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.Repair;
import com.zrkc.syyh.model.RepairModel;
import com.zrkc.syyh.model.RepairSearch;
import com.zrkc.syyh.model.RepairViewModel;
import com.zrkc.syyh.utils.ConnUtil;

public class RepairDaoImpl implements IRepairDao{
	
	public static void main(String[] args) {
		RepairDaoImpl r = new RepairDaoImpl();
		//System.out.println(r.getAllRepair());
		r.updateRepairStatus(2);
	}
	
	public int getTotalCount() {
		String sql = "select count(RepairID) from fault_repair";
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

	public List<RepairModel> repairList(Pageinfo<RepairModel> pageinfo) {
		String sql = "select r.RepairID,b.Bank_Name,e.Equipment_Name,r.EquipmentEach_ID," +
				"r.Fault_Repair_Begin_Date,r.Repair_Status,r.Fault_Repair_End_Date from " +
				"fault_repair r join bank b on r.Bank_id=b.Bank_id join equipmenttype e " +
				"on r.Equipment_id=e.Equipment_id limit ?,3";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<RepairModel> list = new ArrayList<RepairModel>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, pageinfo.getFrom());
			rs = prep.executeQuery();
			while(rs.next()){
				RepairModel repair = new RepairModel();
				repair.setRepairId(rs.getLong(1));
				repair.setBankName(rs.getString(2));
				repair.setEquipmentName(rs.getString(3));
				repair.setEquipmentEachId(rs.getString(4));
				repair.setRepairDate(rs.getTimestamp(5));
				repair.setStatus(rs.getInt(6));
				repair.setRepairEndDate(rs.getTimestamp(7));
				list.add(repair);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}

	public RepairViewModel getRepairView(long repairId) {
		String sql = "select r.RepairID,r.EquipmentEach_ID,e.Equipment_Name,r.Login_ID," +
				"b.Bank_Name,g.Group_Name,t.PITYPE_Value,r.Fault_Repair_Begin_Date," +
				"r.Repair_Status,r.Allocate_Status,r.Fault_Repair_End_Date," +
				"r.Fault_Repair_Evaluation from fault_repair r left outer join bank b on " +
				"r.Bank_id=b.Bank_id left outer join equipmenttype e on r.Equipment_id=" +
				"e.Equipment_id left outer join pi_group g on r.Group_id=g.Group_id left " +
				"outer join fault_repair_type t on r.PITYPE_Id=t.PITYPE_Id";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		RepairViewModel view = new RepairViewModel();
		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while(rs.next()){
				view.setRepairId(rs.getLong(1));
				view.setEquipmentEachId(rs.getString(2));
				view.setEquipmentName(rs.getString(3));
				view.setLoginId(rs.getString(4));
				view.setBankName(rs.getString(5));
				view.setGroupName(rs.getString(6));
				view.setTypeName(rs.getString(7));
				view.setRepairDate(rs.getTimestamp(8));
				view.setRepairStatus(rs.getString(9));
				view.setAllocateStatus(rs.getString(10));
				view.setRepairEndDate(rs.getTimestamp(11));
				view.setRepairEvaluation(rs.getString(12));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return view;	
	}

	public void updateRepairStatus(long repairId) {
		String sql = "update fault_repair set Repair_Status=3 where RepairID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;	
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, repairId);
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}

	public List<EquipmentType> getAllEquipmentType() {
		String sql = "select * from equipmenttype";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<EquipmentType> list = new ArrayList<EquipmentType>();
		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while(rs.next()){
				EquipmentType type = new EquipmentType();
				type.setEquipmentId(rs.getString(1));
				type.setEquipmentName(rs.getString(2));
				list.add(type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}

	public List<String> getAllEachId() {
		String sql = "select EquipmentEach_ID from bank_equipment";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while(rs.next()){			
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}

	public void updateRepair(Repair repair) {
		String sql = "update fault_repair set EquipmentEach_ID=?,Equipment_id=? " +
				"where RepairID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;	
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, repair.getEquipmentEachId());
			prep.setString(2, repair.getEquipmentId());
			prep.setLong(3, repair.getRepairId());
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}

	public String selectBankId(String equipmentEachId) {
		String sql = "select Bank_id from bank_equipment where EquipmentEach_ID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		String bankId = "";
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1,equipmentEachId );
			rs = prep.executeQuery();
			while(rs.next()){			
				bankId = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return bankId;
	}

	public void insertRepair(Repair repair) {
		String sql = "insert into fault_repair(EquipmentEach_ID,Equipment_id," +
				"Bank_id,Login_ID,Fault_Repair_Begin_Date,Repair_Status) values(?,?,?,?,?,?)";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;	
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, repair.getEquipmentEachId());
			prep.setString(2, repair.getEquipmentId());
			prep.setString(3, repair.getBankId());
			prep.setString(4, repair.getLoginId());
			prep.setDate(5, new java.sql.Date(repair.getRepairDate().getTime()));
			prep.setString(6,"2");
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}

	public String selectEquId(String equipmentEachId) {
		String sql = "select Equipment_id from bank_equipment where EquipmentEach_ID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		String equId = "";
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1,equipmentEachId );
			rs = prep.executeQuery();
			while(rs.next()){			
				equId = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return equId;
	}

	public void deleteRepair(long repairId) {
		String sql = "delete from fault_repair where RepairID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;	
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1,repairId);
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}

	public List<Repair> getAllRepair() {
		String sql = "select * from fault_repair";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<Repair> list = new ArrayList<Repair>();
		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while(rs.next()){			
				Repair repair = new Repair();
				repair.setRepairId(rs.getLong(1));
				repair.setGroupId(rs.getLong(2));
				repair.setEquipmentEachId(rs.getString(3));
				repair.setTypeId(rs.getLong(4));
				repair.setEquipmentId(rs.getString(5));
				repair.setBankId(rs.getString(6));
				repair.setLoginId(rs.getString(7));
				repair.setRepairDate(rs.getTimestamp(8));
				repair.setRepairStatus(rs.getString(9));
				repair.setAllocateStatus(rs.getString(10));
				repair.setRepairEndDate(rs.getTimestamp(11));
				repair.setRepairEvaluation(rs.getString(12));
				list.add(repair);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}

	public List<RepairModel> getAllRepairModel() {
		String sql = "select r.RepairID,b.Bank_Name,e.Equipment_Name,r.EquipmentEach_ID," +
		"r.Fault_Repair_Begin_Date,r.Repair_Status,r.Fault_Repair_End_Date from " +
		"fault_repair r join bank b on r.Bank_id=b.Bank_id join equipmenttype e " +
		"on r.Equipment_id=e.Equipment_id";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<RepairModel> list = new ArrayList<RepairModel>();
		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while(rs.next()){
				RepairModel repair = new RepairModel();
				repair.setRepairId(rs.getLong(1));
				repair.setBankName(rs.getString(2));
				repair.setEquipmentName(rs.getString(3));
				repair.setEquipmentEachId(rs.getString(4));
				repair.setRepairDate(rs.getTimestamp(5));
				repair.setStatus(rs.getInt(6));
				repair.setRepairEndDate(rs.getTimestamp(7));
				list.add(repair);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}

	public void updateRepairStatusTo3(long repairId) {
		String sql = "update fault_repair set Repair_Status=0 where RepairID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;	
		try {
			prep = conn.prepareStatement(sql);
			prep.setLong(1, repairId);
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
		
	}

	public List<RepairModel> repairList(Pageinfo<RepairModel> pageinfo,
			RepairSearch repairSearch) {
		Date date1 = repairSearch.getRepairfrom();
		Date date2 = repairSearch.getRepairend();
		Date date3 = repairSearch.getEndfrom();
		Date date4 = repairSearch.getEndend();
		int count = 0;
		String sql = "select r.RepairID,b.Bank_Name,e.Equipment_Name,r.EquipmentEach_ID," +
		"r.Fault_Repair_Begin_Date,r.Repair_Status,r.Fault_Repair_End_Date from " +
		"fault_repair r join bank b on r.Bank_id=b.Bank_id join equipmenttype e " +
		"on r.Equipment_id=e.Equipment_id where r.Repair_Status=? and r.Allocate_Status=?"; 
		
		if(date1!=null && date2!=null && date3!=null && date4!=null){
		sql = sql + " and r.Fault_Repair_Begin_Date between ? and ? and r.Fault_Repair_End_Date between" +
		" ? and ?";
		count = 1;
		}	
		sql = sql + " limit ?,3";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<RepairModel> list = new ArrayList<RepairModel>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, repairSearch.getRepairStatus());
			prep.setString(2, repairSearch.getAllocateStatus());
			if(count == 1){
			prep.setDate(3, new java.sql.Date(date1.getTime()));
			prep.setDate(4, new java.sql.Date(date2.getTime()));
			prep.setDate(5, new java.sql.Date(date3.getTime()));
			prep.setDate(6, new java.sql.Date(date4.getTime()));		
			prep.setInt(7, pageinfo.getFrom());
			}else{
				prep.setInt(3, pageinfo.getFrom());
			}
			rs = prep.executeQuery();
			while(rs.next()){
				RepairModel repair = new RepairModel();
				repair.setRepairId(rs.getLong(1));
				repair.setBankName(rs.getString(2));
				repair.setEquipmentName(rs.getString(3));
				repair.setEquipmentEachId(rs.getString(4));
				repair.setRepairDate(rs.getTimestamp(5));
				repair.setStatus(rs.getInt(6));
				repair.setRepairEndDate(rs.getTimestamp(7));
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
