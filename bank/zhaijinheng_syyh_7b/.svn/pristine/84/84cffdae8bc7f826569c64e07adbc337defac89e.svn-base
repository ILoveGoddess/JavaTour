package com.zrkc.syyh.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.Repair;
import com.zrkc.syyh.model.RepairModel;
import com.zrkc.syyh.model.RepairSearch;
import com.zrkc.syyh.model.RepairViewModel;

public interface IWdService {

	public Pageinfo<RepairModel> repairList(String curpageStr, RepairSearch repairSearch);

	public RepairViewModel getRepairView(long parseLong);

	public void updateRepairStatus(long parseLong);

	public List<EquipmentType> getAllEquipmentType();

	public List<String> getAllEachId();

	public void updateRepair(Repair repair);

	public String selectBankId(String equipmentEachId);

	public void insertRepair(Repair repair);

	public String selectEquId(String equipmentEachId);

	public void deleteRepair(long parseLong);

	public List<Repair> getAllRepair();

	public void exportExcel(List<RepairModel> list, HttpServletResponse response);

	public List<RepairModel> getAllRepairModel();

	public void updateRepairStatusTo3(long parseLong);

}
