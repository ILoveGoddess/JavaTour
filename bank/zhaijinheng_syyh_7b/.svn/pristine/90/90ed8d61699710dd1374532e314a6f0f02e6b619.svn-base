package com.zrkc.syyh.model;

import java.io.Serializable;
import java.util.List;
/**
 * 
 * @author dz
 *
 */
public class Pageinfo<T> implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3011242682111931239L;
	private int curpage=1;//当前页
	private int pageSize=3;//每页显示几条数据
	
	private int totalRecord;//总记录数
	private int totalPage;//总页数
	
	private List<T> pagedata;//当前页面数据
	
	private int from=0;//从哪条数据开始查询
	
	public Pageinfo() {
	}

	public int getCurpage() {
		return curpage;
	}

	public void setCurpage(int curpage) {
		curpage=curpage>0?curpage:1;
		this.curpage = curpage;
		this.from=(curpage-1)*this.pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
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

	public List<T> getPagedata() {
		return pagedata;
	}

	public void setPagedata(List<T> pagedata) {
		this.pagedata = pagedata;
	}

	public int getFrom() {
		return from;
	}

	public void setFrom(int from) {
		this.from = from;
	}

	
}
