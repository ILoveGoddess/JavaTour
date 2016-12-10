package com.zrkc.syyh.model;

import java.io.Serializable;

/**
 * 部门
 * @author dz
 *
 */
public class Department  implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7248088105345016463L;
	private Long departmentId;
	private String departmentName;
	public Department() {
		
	}
	public Long getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
}