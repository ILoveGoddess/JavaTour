package com.crm.model;

import java.io.Serializable;
/**
 * 操作权限组实体类-------对应------->操作权限组数据库中的s_role表
 * @author Administrator
 *
 */
public class HandleJurisdiction implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = -8676499427831425440L;
	private Integer id;
	private String remark;//备注
	private String name;//名称
	private String popedom;//权限
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPopedom() {
		return popedom;
	}
	public void setPopedom(String popedom) {
		this.popedom = popedom;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public HandleJurisdiction() {
		System.out.println("指尖的力量, 可以改变世界...");
	}
	public HandleJurisdiction(Integer id, String remark, String name,
			String popedom) {
		super();
		this.id = id;
		this.remark = remark;
		this.name = name;
		this.popedom = popedom;
	}
	@Override
	public String toString() {
		return "HandleJurisdiction [id=" + id + ", remark=" + remark
				+ ", name=" + name + ", popedom=" + popedom + "]";
	}
}