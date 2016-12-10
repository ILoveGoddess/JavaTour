package com.crm.model;

import java.util.Date;


public class User implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1323251071452546259L;
	private Integer id;
	private String name;
	private String cnname;
	private String password;
	
	private Integer roleId;
	private Integer groupId;
	private Integer accessGroupId;
	private String creator;
	private Date createTime;
	private String updater;
	private Date updateTime;
	private String remark;

	private String address;
	private String telephone;
	private String email;
	private Date beginDate;
	private Date endDate;
	private String accessFileLevel;
	private String menus;
	private String popedom;
	private String status;
	private String commendman;
	private String movetelephone;
	private String nowaddress;
	private String nowtelephone;
	private String identitycode;
	private String insurancecode;
	private String instancylinkman;
	private String instancytelephone;
	private String sex;
	private Date birthday;
	private String personneltype;
	private String duty;
	private Date workdate;
	private String highschool;
	private String finishschool;
	private Date finishschooldate;
	private String consortname;
	private String youngonename;
	private String officetelephone;
	private String consorttelephone;
	private String avocation;
	private String consortcompany;
	private String strongsuit;
	private String communicate;
	private String bringup;
	private String organise;
	private String analyse;
	private String planing;
	private String empolder;
	private String relation;
	
	
	public User() {

	}
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
	public String getCnname() {
		return cnname;
	}
	public void setCnname(String cnname) {
		this.cnname = cnname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public Integer getAccessGroupId() {
		return accessGroupId;
	}
	public void setAccessGroupId(Integer accessGroupId) {
		this.accessGroupId = accessGroupId;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getAccessFileLevel() {
		return accessFileLevel;
	}
	public void setAccessFileLevel(String accessFileLevel) {
		this.accessFileLevel = accessFileLevel;
	}
	public String getMenus() {
		return menus;
	}
	public void setMenus(String menus) {
		this.menus = menus;
	}
	public String getPopedom() {
		return popedom;
	}
	public void setPopedom(String popedom) {
		this.popedom = popedom;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCommendman() {
		return commendman;
	}
	public void setCommendman(String commendman) {
		this.commendman = commendman;
	}
	public String getMovetelephone() {
		return movetelephone;
	}
	public void setMovetelephone(String movetelephone) {
		this.movetelephone = movetelephone;
	}
	public String getNowaddress() {
		return nowaddress;
	}
	public void setNowaddress(String nowaddress) {
		this.nowaddress = nowaddress;
	}
	public String getNowtelephone() {
		return nowtelephone;
	}
	public void setNowtelephone(String nowtelephone) {
		this.nowtelephone = nowtelephone;
	}
	public String getIdentitycode() {
		return identitycode;
	}
	public void setIdentitycode(String identitycode) {
		this.identitycode = identitycode;
	}
	public String getInsurancecode() {
		return insurancecode;
	}
	public void setInsurancecode(String insurancecode) {
		this.insurancecode = insurancecode;
	}
	public String getInstancylinkman() {
		return instancylinkman;
	}
	public void setInstancylinkman(String instancylinkman) {
		this.instancylinkman = instancylinkman;
	}
	public String getInstancytelephone() {
		return instancytelephone;
	}
	public void setInstancytelephone(String instancytelephone) {
		this.instancytelephone = instancytelephone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPersonneltype() {
		return personneltype;
	}
	public void setPersonneltype(String personneltype) {
		this.personneltype = personneltype;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public Date getWorkdate() {
		return workdate;
	}
	public void setWorkdate(Date workdate) {
		this.workdate = workdate;
	}
	public String getHighschool() {
		return highschool;
	}
	public void setHighschool(String highschool) {
		this.highschool = highschool;
	}
	public String getFinishschool() {
		return finishschool;
	}
	public void setFinishschool(String finishschool) {
		this.finishschool = finishschool;
	}
	public Date getFinishschooldate() {
		return finishschooldate;
	}
	public void setFinishschooldate(Date finishschooldate) {
		this.finishschooldate = finishschooldate;
	}
	public String getConsortname() {
		return consortname;
	}
	public void setConsortname(String consortname) {
		this.consortname = consortname;
	}
	public String getYoungonename() {
		return youngonename;
	}
	public void setYoungonename(String youngonename) {
		this.youngonename = youngonename;
	}
	public String getOfficetelephone() {
		return officetelephone;
	}
	public void setOfficetelephone(String officetelephone) {
		this.officetelephone = officetelephone;
	}
	public String getConsorttelephone() {
		return consorttelephone;
	}
	public void setConsorttelephone(String consorttelephone) {
		this.consorttelephone = consorttelephone;
	}
	public String getAvocation() {
		return avocation;
	}
	public void setAvocation(String avocation) {
		this.avocation = avocation;
	}
	public String getConsortcompany() {
		return consortcompany;
	}
	public void setConsortcompany(String consortcompany) {
		this.consortcompany = consortcompany;
	}
	public String getStrongsuit() {
		return strongsuit;
	}
	public void setStrongsuit(String strongsuit) {
		this.strongsuit = strongsuit;
	}
	public String getCommunicate() {
		return communicate;
	}
	public void setCommunicate(String communicate) {
		this.communicate = communicate;
	}
	public String getBringup() {
		return bringup;
	}
	public void setBringup(String bringup) {
		this.bringup = bringup;
	}
	public String getOrganise() {
		return organise;
	}
	public void setOrganise(String organise) {
		this.organise = organise;
	}
	public String getAnalyse() {
		return analyse;
	}
	public void setAnalyse(String analyse) {
		this.analyse = analyse;
	}
	public String getPlaning() {
		return planing;
	}
	public void setPlaning(String planing) {
		this.planing = planing;
	}
	public String getEmpolder() {
		return empolder;
	}
	public void setEmpolder(String empolder) {
		this.empolder = empolder;
	}
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	
	
}