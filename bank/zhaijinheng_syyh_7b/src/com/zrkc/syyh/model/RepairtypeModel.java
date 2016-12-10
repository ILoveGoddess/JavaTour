package com.zrkc.syyh.model;

public class RepairtypeModel extends Repairtype{
	private int typeCount;

	public int getTypeCount() {
		return typeCount;
	}

	public void setTypeCount(int typeCount) {
		this.typeCount = typeCount;
	}

	@Override
	public String toString() {
		return "RepairtypeModel [typeCount=" + typeCount + "]";
	}

	public RepairtypeModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RepairtypeModel(long typeId, String typeValue) {
		super(typeId, typeValue);
		// TODO Auto-generated constructor stub
	}
	
}
