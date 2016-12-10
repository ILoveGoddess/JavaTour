package com.zrkc.syyh.dao.impl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrkc.syyh.dao.IBankDao;
import com.zrkc.syyh.model.Bank;
import com.zrkc.syyh.model.BankEquipment;
import com.zrkc.syyh.model.BankEquipmentModel;
import com.zrkc.syyh.model.BankModel;
import com.zrkc.syyh.model.DeptModel;
import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.utils.ConnUtil;
import com.zrkc.syyh.utils.DateUtils;

public class BankDaoImpl implements IBankDao{
	public static void main(String[] args) {
		BankDaoImpl x = new BankDaoImpl();
		//x.deleteEqu("33331");
		//System.out.println(x.getEquById("00001").getDepreciationValue());
	}
	public List<BankModel> getAllBank(Pageinfo<BankModel> pageinfo) {
		String sql ="select Bank_id,Bank_Name,Bank_Longitude,Bank_Latitude,Bank_IP from bank limit ?,3";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<BankModel> list = new ArrayList<BankModel>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, pageinfo.getFrom());
			rs = prep.executeQuery();
			while(rs.next()){
				BankModel bank = new BankModel();
				bank.setBankId(rs.getString(1));
				bank.setBankName(rs.getString(2));
				bank.setBankLatitude(rs.getBigDecimal(4).setScale(2));
				bank.setBankLongitude(rs.getBigDecimal(3).setScale(2));
				bank.setBankIp(rs.getString(5));
				bank.setEquCount(getEquCount(rs.getString(1)));
				list.add(bank);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}
		return list;
	}
	public int getEquCount(String bankId){
		String sql = "select count(*) from bank_equipment where Bank_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		int count = 0;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, bankId);
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
	
	
	public int getTotalRecord() {
		String sql = "select count(*) from bank";
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
	/**
	 * 新增银行网点
	 */
	public void addBank(Bank bank) {
		String sql = "insert into bank values(?,?,?,?,?)";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bank.getBankId());
			ps.setString(2, bank.getBankName());
			ps.setBigDecimal(3, bank.getBankLongitude());
			ps.setBigDecimal(4, bank.getBankLatitude());
			ps.setString(5, bank.getBankIp());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(ps, conn);
		}		
		
	}
	public Bank getBankById(String bankIdStr) {
		String sql = "select * from bank where Bank_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		Bank bank = new Bank();
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, bankIdStr);
			rs = prep.executeQuery();
			while(rs.next()){
				bank.setBankId(bankIdStr);
				bank.setBankName(rs.getString(2));
				bank.setBankLongitude(rs.getBigDecimal(3).setScale(2));
				bank.setBankLatitude(rs.getBigDecimal(4).setScale(2));
				bank.setBankIp(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}		
		return bank;
	}
	public void updateBank(Bank bank) {
		String sql = "update bank set Bank_Name=?,Bank_Longitude=?,Bank_Latitude=?," +
				"Bank_IP=? where Bank_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, bank.getBankName());
			prep.setBigDecimal(2, bank.getBankLongitude());
			prep.setBigDecimal(3, bank.getBankLatitude());
			prep.setString(4,bank.getBankIp());
			prep.setString(5, bank.getBankId());
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}
	public int countUser(String bankIdStr) {
		String sql = "select count(*) from bank_equipment where Bank_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		int count = 0;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, bankIdStr);
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
	public List<BankEquipmentModel> findEquList(Pageinfo<BankEquipmentModel> pageinfo,
			String bankIdStr) {
		String sql = "select e.EquipmentEach_ID,b.Bank_Name,t.Equipment_Name," +
				"e.Equipment_Value,e.Equipment_BuyDate,e.Status,e.Depreciation_Value" +
				" from bank_equipment e join bank b on " +
				"e.Bank_id=b.Bank_id join equipmenttype t on t.Equipment_id=e.Equipment_id " +
				" where e.Bank_id=? limit ?,3";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<BankEquipmentModel> list = new ArrayList<BankEquipmentModel>();
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, bankIdStr);
			prep.setInt(2,pageinfo.getFrom());
			rs = prep.executeQuery();
			while(rs.next()){
				BankEquipmentModel b = new BankEquipmentModel();
				b.setEquipmentEachId(rs.getString(1));
				b.setBankName(rs.getString(2));
				b.setEquipmentName(rs.getString(3));
				b.setEquipmentValue(rs.getBigDecimal(4));
				b.setEquipmentBuyDate(rs.getTimestamp(5));
				b.setStatus(rs.getString(6));
				b.setDepreciationValue(rs.getBigDecimal(7));
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}		
		return list;
	}
	public String getBankName(String bankId) {
		String sql = "select Bank_Name from bank where Bank_id=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		String bankName = "";
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, bankId);
			rs = prep.executeQuery();
			while(rs.next()){
				bankName = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}		
		return bankName;
	}
	public List<EquipmentType> getAllTypes() {
		String sql = "select * from equipmenttype";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		List<EquipmentType> list = new ArrayList<EquipmentType>();
		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while(rs.next()){
				EquipmentType e = new EquipmentType();
				e.setEquipmentId(rs.getString(1));
				e.setEquipmentName(rs.getString(2));
				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}		
		return list;
	}
	/**
	 * 新增银行网点设备明细
	 */
	public void addBankEquipment(BankEquipment be) {
		String sql = "insert into bank_equipment values(?,?,?,?,?,?,?);";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, be.getEquipmentEachId());
			ps.setString(2, be.getEquipmentId());
			ps.setString(3, be.getBankId());
			ps.setBigDecimal(4, be.getEquipmentValue());
			ps.setDate(5, new java.sql.Date(be.getEquipmentBuyDate().getTime()));
			ps.setString(6, be.getStatus());
			ps.setBigDecimal(7, be.getDepreciationValue());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(ps, conn);
		}		
	}
	public BankEquipmentModel getEquById(String equipmentEachId) {
		String sql = "select e.EquipmentEach_ID,b.Bank_Name,t.Equipment_Name," +
		"e.Equipment_Value,e.Equipment_BuyDate,e.Status,e.Depreciation_Value " +
		" from bank_equipment e join bank b on " +
		" e.Bank_id=b.Bank_id join equipmenttype t on t.Equipment_id=e.Equipment_id " +
		" where e.EquipmentEach_ID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		ResultSet rs = null;
		BankEquipmentModel bem = new BankEquipmentModel();
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, equipmentEachId);
			rs = prep.executeQuery();
			while(rs.next()){
				bem.setEquipmentEachId(rs.getString(1));
				bem.setBankName(rs.getString(2));
				bem.setEquipmentName(rs.getString(3));
				bem.setEquipmentValue(rs.getBigDecimal(4));
				bem.setEquipmentBuyDate(rs.getTimestamp(5));
				bem.setStatus(rs.getString(6));
				bem.setDepreciationValue(rs.getBigDecimal(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(rs, prep, conn);
		}		
		return bem;
	}
	public void updateEqu(BankEquipment be) {
		String sql = "update bank_equipment set Status=?,Depreciation_Value=? " +
				"where EquipmentEach_ID=?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, be.getStatus());
			prep.setBigDecimal(2, be.getDepreciationValue());
			prep.setString(3, be.getEquipmentEachId());
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}
	public void deleteEqu(String equipmentEachId) {
		String sql = "delete from bank_equipment where EquipmentEach_ID = ?";
		Connection conn = ConnUtil.getConnection();
		PreparedStatement prep = null;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1,equipmentEachId);
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnUtil.closeConnection(prep, conn);
		}		
	}

}
