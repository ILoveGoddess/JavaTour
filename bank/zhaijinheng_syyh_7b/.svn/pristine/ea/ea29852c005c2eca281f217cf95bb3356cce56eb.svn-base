package com.zrkc.syyh.model;

import java.util.Date;

import com.zrkc.syyh.utils.DateUtils;

public class RepairModel {
	private long repairId;
	private String bankName;
	private String equipmentName;
	private String equipmentEachId;
	private Date repairDate;
	private int status;
	private Date repairEndDate;
	public long getRepairId() {
		return repairId;
	}
	public void setRepairId(long repairId) {
		this.repairId = repairId;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getEquipmentName() {
		return equipmentName;
	}
	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}
	public String getEquipmentEachId() {
		return equipmentEachId;
	}
	public void setEquipmentEachId(String equipmentEachId) {
		this.equipmentEachId = equipmentEachId;
	}
	public Date getRepairDate() {
		return repairDate;
	}
	public String getRepairDateStr(){
		return DateUtils.dateToStr(repairDate);
	}
	public void setRepairDate(Date repairDate) {
		this.repairDate = repairDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getRepairEndDate() {
		return repairEndDate;
	}
	public String getRepairEndDateStr() {
		return DateUtils.dateToStr(repairEndDate);
	}
	public void setRepairEndDate(Date repairEndDate) {
		this.repairEndDate = repairEndDate;
	}
	public RepairModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RepairModel(long repairId, String bankName, String equipmentName,
			String equipmentEachId, Date repairDate, int status,
			Date repairEndDate) {
		super();
		this.repairId = repairId;
		this.bankName = bankName;
		this.equipmentName = equipmentName;
		this.equipmentEachId = equipmentEachId;
		this.repairDate = repairDate;
		this.status = status;
		this.repairEndDate = repairEndDate;
	}
	@Override
	public String toString() {
		return "RepairModel [bankName=" + bankName + ", equipmentEachId="
				+ equipmentEachId + ", equipmentName=" + equipmentName
				+ ", repairDate=" + repairDate + ", repairEndDate="
				+ repairEndDate + ", repairId=" + repairId + ", status="
				+ status + "]";
	}
	
	
}
