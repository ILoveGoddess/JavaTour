package com.crm.model;

import java.io.Serializable;

public class Pager implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6211010175093263237L;
	private int page=1;//当前页
	private int pageSize=5;//每页显示几条数据
	
	private int totalRecord;//总记录数
	private int totalPage;//总页数
	
	private int from=0;//从哪条数据开始查询

	
	public Pager() {
		
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
		this.from=(page-1)*pageSize;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		this.from=(page-1)*pageSize;
	}


	public int getTotalRecord() {
		return totalRecord;
	}


	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage=(totalRecord%pageSize==0)?(totalRecord/pageSize):(totalRecord/pageSize+1);	
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getFrom() {
		return from;
	}


	public void setFrom(int from) {
		this.from = from;
	}


	
	
}
