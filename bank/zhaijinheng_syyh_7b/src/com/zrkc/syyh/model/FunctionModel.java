package com.zrkc.syyh.model;

public class FunctionModel extends Function{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int contains;

	public int getContains() {
		return contains;
	}

	public void setContains(int contains) {
		this.contains = contains;
	}

	public FunctionModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "FunctionModel [contains=" + contains + "]";
	}
	
	
	
}
