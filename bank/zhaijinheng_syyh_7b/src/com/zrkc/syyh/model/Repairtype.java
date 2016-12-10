package com.zrkc.syyh.model;

public class Repairtype {
	private long typeId;
	private String typeValue;
	public long getTypeId() {
		return typeId;
	}
	public void setTypeId(long typeId) {
		this.typeId = typeId;
	}
	public String getTypeValue() {
		return typeValue;
	}
	public void setTypeValue(String typeValue) {
		this.typeValue = typeValue;
	}
	@Override
	public String toString() {
		return "Repairtype [typeId=" + typeId + ", typeValue=" + typeValue
				+ "]";
	}
	public Repairtype() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Repairtype(long typeId, String typeValue) {
		super();
		this.typeId = typeId;
		this.typeValue = typeValue;
	}
	
}
