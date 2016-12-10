package com.crm.model;

import java.io.Serializable;
import java.util.List;

public class DataModel<T> implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2411064042563481369L;
	private Pager pager;
	private List<T> rows;

	public DataModel() {
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

}
