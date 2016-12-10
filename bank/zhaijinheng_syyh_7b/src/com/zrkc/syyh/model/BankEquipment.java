package com.zrkc.syyh.model;

import java.math.BigDecimal;
import java.util.Date;

import com.zrkc.syyh.utils.DateUtils;

public class BankEquipment {
	private String equipmentEachId;
	private String equipmentId;
	private String bankId;
	private BigDecimal equipmentValue;
	private Date equipmentBuyDate;
	private String status;
	private BigDecimal depreciationValue;
	
	public String getEquipmentEachId() {
		return equipmentEachId;
	}
	public void setEquipmentEachId(String equipmentEachId) {
		this.equipmentEachId = equipmentEachId;
	}
	public String getEquipmentId() {
		return equipmentId;
	}
	public void setEquipmentId(String equipmentId) {
		this.equipmentId = equipmentId;
	}
	public String getBankId() {
		return bankId;
	}
	public void setBankId(String bankId) {
		this.bankId = bankId;
	}
	public BigDecimal getEquipmentValue() {
		return equipmentValue;
	}
	public void setEquipmentValue(BigDecimal equipmentValue) {
		this.equipmentValue = equipmentValue;
	}
	public Date getEquipmentBuyDate() {
		return equipmentBuyDate;
	}
	public String getEquipmentBuyDateStr(){
		return DateUtils.dateToStr(getEquipmentBuyDate());
	}
	public void setEquipmentBuyDate(Date equipmentBuyDate) {
		this.equipmentBuyDate = equipmentBuyDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public BigDecimal getDepreciationValue() {
		return depreciationValue;
	}
	public void setDepreciationValue(BigDecimal depreciationValue) {
		this.depreciationValue = depreciationValue;
	}
	@Override
	public String toString() {
		return "BankEquipment [bankId=" + bankId + ", depreciationValue="
				+ depreciationValue + ", equipmentBuyDate=" + equipmentBuyDate
				+ ", equipmentEachId=" + equipmentEachId + ", equipmentId="
				+ equipmentId + ", equipmentValue=" + equipmentValue
				+ ", status=" + status + "]";
	}
	public BankEquipment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BankEquipment(String equipmentEachId, String equipmentId,
			String bankId, BigDecimal equipmentValue, Date equipmentBuyDate,
			String status, BigDecimal depreciationValue) {
		super();
		this.equipmentEachId = equipmentEachId;
		this.equipmentId = equipmentId;
		this.bankId = bankId;
		this.equipmentValue = equipmentValue;
		this.equipmentBuyDate = equipmentBuyDate;
		this.status = status;
		this.depreciationValue = depreciationValue;
	}
	
	
	
}
