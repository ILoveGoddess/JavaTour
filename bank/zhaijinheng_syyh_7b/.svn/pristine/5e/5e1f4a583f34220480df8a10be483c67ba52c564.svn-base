package com.zrkc.syyh.dao;

import java.util.List;

import com.zrkc.syyh.model.Bank;
import com.zrkc.syyh.model.BankEquipment;
import com.zrkc.syyh.model.BankEquipmentModel;
import com.zrkc.syyh.model.BankModel;
import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.Pageinfo;

public interface IBankDao {

	public List<BankModel> getAllBank(Pageinfo<BankModel> pageinfo);

	public int getTotalRecord();

	public void addBank(Bank bank);

	public Bank getBankById(String bankIdStr);

	void updateBank(Bank bank);

	public List<BankEquipmentModel> findEquList(Pageinfo<BankEquipmentModel> pageinfo,
				String bankIdStr);

	public int countUser(String bankIdStr);

	public String getBankName(String bankId);

	public List<EquipmentType> getAllTypes();

	public void addBankEquipment(BankEquipment be);

	public BankEquipmentModel getEquById(String equipmentEachId);

	public void updateEqu(BankEquipment be);

	public void deleteEqu(String equipmentEachId);

}
