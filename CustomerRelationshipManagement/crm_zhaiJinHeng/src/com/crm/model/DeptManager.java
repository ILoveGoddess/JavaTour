package com.crm.model;

import java.io.Serializable;
/**
 * 部门管理实体类-------对应------->部门管理数据库中的s_user_group表
 * @author Administrator
 *
 */
public class DeptManager implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = -8924559756076320110L;
	private Integer id;
	private String remark;//备注
	private String name;//部门名称
	private String principal;//部门负责人
	private String incumbent;//部门职能
	private Integer pid;//父id(上一级id)
	private String fcode;
	private String leaderName;//上一级名字
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
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	public String getIncumbent() {
		return incumbent;
	}
	public void setIncumbent(String incumbent) {
		this.incumbent = incumbent;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getFcode() {
		return fcode;
	}
	public void setFcode(String fcode) {
		this.fcode = fcode;
	}
	public String getLeaderName() {
		return leaderName;
	}
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public DeptManager() {
		System.out.println("指尖的力量, 可以改变世界...");
	}
	public DeptManager(Integer id, String remark, String name,
			String principal, String incumbent, Integer pid, String fcode) {
		super();
		this.id = id;
		this.remark = remark;
		this.name = name;
		this.principal = principal;
		this.incumbent = incumbent;
		this.pid = pid;
		this.fcode = fcode;
	}
	@Override
	public String toString() {
		return "DeptManager [id=" + id + ", remark=" + remark + ", name="
				+ name + ", principal=" + principal + ", incumbent="
				+ incumbent + ", pid=" + pid + ", fcode=" + fcode + "]";
	}
}