package com.zrkc.syyh.dao;

import java.util.List;

import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.Repair;
import com.zrkc.syyh.model.RepairModel;
import com.zrkc.syyh.model.RepairSearch;
import com.zrkc.syyh.model.RepairViewModel;

public interface IRepairDao {

	int getTotalCount();

	List<RepairModel> repairList(Pageinfo<RepairModel> pageinfo);

	RepairViewModel getRepairView(long repairId);

	void updateRepairStatus(long repairId);

	List<EquipmentType> getAllEquipmentType();

	List<String> getAllEachId();

	void updateRepair(Repair repair);

	String selectBankId(String equipmentEachId);

	void insertRepair(Repair repair);

	String selectEquId(String equipmentEachId);

	void deleteRepair(long repairId);

	List<Repair> getAllRepair();

	List<RepairModel> getAllRepairModel();

	void updateRepairStatusTo3(long repairId);

	List<RepairModel> repairList(Pageinfo<RepairModel> pageinfo,
			RepairSearch repairSearch);

}
