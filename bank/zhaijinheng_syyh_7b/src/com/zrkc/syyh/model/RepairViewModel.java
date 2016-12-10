package com.zrkc.syyh.model;

import java.util.Date;

public class RepairViewModel extends Repair{
	private String equipmentName;
	private String bankName;
	private String groupName;
	private String typeName;
	public String getEquipmentName() {
		return equipmentName;
	}
	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	@Override
	public String toString() {
		return "RepairViewModel [bankName=" + bankName + ", equipmentName="
				+ equipmentName + ", groupName=" + groupName + ", typeName="
				+ typeName + "]";
	}
	public RepairViewModel(String equipmentName, String bankName,
			String groupName, String typeName) {
		super();
		this.equipmentName = equipmentName;
		this.bankName = bankName;
		this.groupName = groupName;
		this.typeName = typeName;
	}
	public RepairViewModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RepairViewModel(long repairId, long groupId, String equipmentEachId,
			long typeId, String equipmentId, String bankId, String loginId,
			Date repairDate, String repairStatus, String allocateStatus,
			Date repairEndDate, String repairEvaluation) {
		super(repairId, groupId, equipmentEachId, typeId, equipmentId, bankId, loginId,
				repairDate, repairStatus, allocateStatus, repairEndDate,
				repairEvaluation);
		// TODO Auto-generated constructor stub
	}
	
	
}
