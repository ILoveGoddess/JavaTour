package com.zrkc.syyh.model;

import java.io.Serializable;

/**
 * 用户（对应users表）
 * @author dz
 *
 */
public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6320137144339747564L;
	private String loginId;//用户登录帐号(用户登陆ID)
	private Long jobId;//岗位id
	private Long departmentId;//部门id
    private String loginPassword;//密码
    private String userName;//用户中文名
    private String userStatus;//用户状态(0表示禁用，1表示启用)
    
    public User() {
		
	}

	public User(String loginId, Long jobId, Long departmentId,
			String loginPassword, String userName, String userStatus) {
		super();
		this.loginId = loginId;
		this.jobId = jobId;
		this.departmentId = departmentId;
		this.loginPassword = loginPassword;
		this.userName = userName;
		this.userStatus = userStatus;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public Long getJobId() {
		return jobId;
	}

	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

}
