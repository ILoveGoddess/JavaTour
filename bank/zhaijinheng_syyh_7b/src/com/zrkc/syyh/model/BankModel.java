package com.zrkc.syyh.model;

import java.math.BigDecimal;

public class BankModel extends Bank{
	private int equCount;

	public int getEquCount() {
		return equCount;
	}

	public void setEquCount(int equCount) {
		this.equCount = equCount;
	}

	@Override
	public String toString() {
		return "BankModel [equCount=" + equCount + "]";
	}

	public BankModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BankModel(String bankId, String bankName, BigDecimal bankLongitude,
			BigDecimal bankLatitude, String bankIp) {
		super(bankId, bankName, bankLongitude, bankLatitude, bankIp);
		// TODO Auto-generated constructor stub
	}
	
}
