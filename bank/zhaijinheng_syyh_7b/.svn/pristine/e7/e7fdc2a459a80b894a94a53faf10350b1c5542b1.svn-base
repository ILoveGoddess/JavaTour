package com.zrkc.syyh.service.impl;

import java.util.List;

import com.zrkc.syyh.dao.IBankDao;
import com.zrkc.syyh.dao.impl.BankDaoImpl;
import com.zrkc.syyh.model.Bank;
import com.zrkc.syyh.model.BankEquipment;
import com.zrkc.syyh.model.BankEquipmentModel;
import com.zrkc.syyh.model.BankModel;
import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.UserModel;
import com.zrkc.syyh.service.IBankService;

public class BankServiceImpl implements IBankService{
	public static void main(String[] args) {
		BankServiceImpl x = new BankServiceImpl();
		//System.out.println(x.checkEqu("00001", "1").getPagedata());
	}
	
	IBankDao bankDao = new BankDaoImpl();
	public Pageinfo<BankModel> bankList(String curpageStr) {
		int curpage = 1;
		if(curpageStr != null && curpageStr != ""){
			curpage = Integer.parseInt(curpageStr);
		}
		Pageinfo<BankModel> pageinfo = new Pageinfo<BankModel>();
		pageinfo.setCurpage(curpage);
		List<BankModel> list = bankDao.getAllBank(pageinfo);
		pageinfo.setPagedata(list);
		int totalRecord = bankDao.getTotalRecord();
		pageinfo.setTotalRecord(totalRecord);
		pageinfo.setPageSize(pageinfo.getPageSize());
		return pageinfo;
	}
	/**
	 * 新增银行网点
	 */
	public void addBank(Bank bank) {
		bankDao.addBank(bank);
	}
	public Bank getBankById(String bankIdStr) {
		return bankDao.getBankById(bankIdStr);
	}
	public void updateBank(Bank bank) {
		bankDao.updateBank(bank);
	}
	public Pageinfo<BankEquipmentModel> checkEqu(String bankIdStr, String curpageStr) {
		int curpage=1;
		if(curpageStr!=null && !curpageStr.equals("")){
			curpage=Integer.parseInt(curpageStr);
		}		
		Pageinfo<BankEquipmentModel> pageinfo=new Pageinfo<BankEquipmentModel>();
		pageinfo.setCurpage(curpage);
		//查询当前页的用户信息
		List<BankEquipmentModel> list=bankDao.findEquList(pageinfo,bankIdStr);
		pageinfo.setPagedata(list);
		//查询用户总数
		int totalNum=bankDao.countUser(bankIdStr);	
		pageinfo.setTotalRecord(totalNum);
		pageinfo.setPageSize(pageinfo.getPageSize());
		return pageinfo;
	}
	public String getBankName(String bankId) {
		return bankDao.getBankName(bankId);
	}
	public List<EquipmentType> getAllTypes() {
		return bankDao.getAllTypes();
	}
	/**
	 * 新增银行网点设备明细
	 */
	public void addBankEquipment(BankEquipment be) {
		bankDao.addBankEquipment(be);
	}
	public BankEquipmentModel getEquById(String equipmentEachId) {
		return bankDao.getEquById(equipmentEachId);
	}
	public void updateEqu(BankEquipment be) {
		bankDao.updateEqu(be);
	}
	public void deleteEqu(String equipmentEachId) {
		bankDao.deleteEqu(equipmentEachId);
	}
}
