package com.zrkc.syyh.model;

public class DeptModel extends Department{
	private int totalUser;

	public int getTotalUser() {
		return totalUser;
	}

	public void setTotalUser(int totalUser) {
		this.totalUser = totalUser;
	}

	@Override
	public String toString() {
		return "DeptModel [totalUser=" + totalUser + "]";
	}

	public DeptModel() {
		super();
		// TODO Auto-generated constructor stub
	}	
}
