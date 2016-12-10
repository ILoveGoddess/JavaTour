package com.zrkc.syyh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrkc.syyh.dao.IEquTypeDao;
import com.zrkc.syyh.model.DeptModel;
import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.EquipmentTypeModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.utils.ConnUtil;

public class EquTypeDaoImpl implements IEquTypeDao{
	
	public static void main(String[] args) {
		EquTypeDaoImpl e = new EquTypeDaoImpl();
		EquipmentType equ = new EquipmentType();
		equ.setEquipmentId("002");
		equ.setEquipmentName("ATM");
		e.addEqu(equ);
	}
	
	public List<EquipmentTypeModel> getAllEquipmentType(
			Pageinfo<EquipmentTypeModel> pageinfo) {
		String sql = "select e.Equipment_id,e.Equipment_Name,count(b.EquipmentEach_ID) count" +
				" from equipmenttype e left outer join bank_equipment b" +
				" on e.Equipment_id=b.Equipment_id group by e.Equipment_id limit ?,3";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<EquipmentTypeModel> list = new ArrayList<EquipmentTypeModel>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, pageinfo.getFrom());
			rs = prep.executeQuery();
			while(rs.next()){
				EquipmentTypeModel equ = new EquipmentTypeModel();
				equ.setEquipmentId(rs.getString(1));
				equ.setEquipmentName(rs.getString(2));
				equ.setEquipmentTypeCount(rs.getInt(3));
				list.add(equ);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}

	public int getTotalRecord() {
		String sql = "select count(*) from equipmenttype";
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

	public void deleteEquById(String equipmentId) {
		String sql = "delete from equipmenttype where Equipment_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;		
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, equipmentId);
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}	
	}

	public void updateEqu(String equipmentId, String equipmentName) {
		String sql = "update equipmenttype set Equipment_Name=? where Equipment_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;		
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, equipmentName);
			prep.setString(2, equipmentId);
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}	
	}

	public void addEqu(EquipmentType equ) {
		String sql = "insert into equipmenttype(Equipment_id,Equipment_Name) values(?,?)";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;		
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, equ.getEquipmentId());
			prep.setString(2, equ.getEquipmentName());
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}			
	}

}
