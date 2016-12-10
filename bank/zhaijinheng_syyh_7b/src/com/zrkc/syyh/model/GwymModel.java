package com.zrkc.syyh.model;

public class GwymModel extends Gwym{
	private String ymmc;
	private String funcName;
	public String getYmmc() {
		return ymmc;
	}
	public void setYmmc(String ymmc) {
		this.ymmc = ymmc;
	}
	public String getFuncName() {
		return funcName;
	}
	public void setFuncName(String funcName) {
		this.funcName = funcName;
	}
	@Override
	public String toString() {
		return "GwymModel [funcName=" + funcName + ", ymmc=" + ymmc + "]";
	}
	public GwymModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
