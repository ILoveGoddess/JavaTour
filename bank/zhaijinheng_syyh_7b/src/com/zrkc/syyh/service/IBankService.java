package com.zrkc.syyh.service;

import java.util.List;

import com.zrkc.syyh.model.Bank;
import com.zrkc.syyh.model.BankEquipment;
import com.zrkc.syyh.model.BankEquipmentModel;
import com.zrkc.syyh.model.BankModel;
import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.Pageinfo;

public interface IBankService {

	public Pageinfo<BankModel> bankList(String curpageStr);

	public void addBank(Bank bank);

	public Bank getBankById(String bankIdStr);

	public void updateBank(Bank bank);

	public Pageinfo<BankEquipmentModel> checkEqu(String bankIdStr, String curpageStr);

	public String getBankName(String bankIdStr);

	public List<EquipmentType> getAllTypes();

	public void addBankEquipment(BankEquipment be);

	public BankEquipmentModel getEquById(String equipmentEachId);

	public void updateEqu(BankEquipment be);

	public void deleteEqu(String equipmentEachId);
	
}
