package com.crm.model;

import java.io.Serializable;
/**
 * 查询权限组实体类-------对应------->查询权限组数据库中的s_access_group表
 * @author Administrator
 *
 */
public class QueryJurisdiction implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6246916287858331157L;
	private Integer id;
	private String name;//组名
	private String dpte;//部门id(用户组id)拼成的字符串,例：1,2,3,4
	private String remark;//备注
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDpte() {
		return dpte;
	}
	public void setDpte(String dpte) {
		this.dpte = dpte;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public QueryJurisdiction() {
		System.out.println("指尖的力量, 可以改变世界...");
	}
	public QueryJurisdiction(Integer id, String name, String dpte, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.dpte = dpte;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "QueryJurisdiction [id=" + id + ", name=" + name + ", dpte="
				+ dpte + ", remark=" + remark + "]";
	}
}