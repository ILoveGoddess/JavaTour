package com.crm.model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 人事管理实体类-------对应------->人事管理数据库中的s_user表
 * @author Administrator
 *
 */
public class PersonnelManager implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 551365035753467824L;
	private Integer id;
	private String creator;//创建人
	private Date createTime;//创建日期
	private String updater;//修改人
	private Date updateTime;//修改时间
	private String remark;//备注
	private String name;//用户名
	private String cnname;//中文名
	private String password;//密码
	private String address;//(家庭)地址
	private String telephone;//(家庭)电话
	private String email;//电子邮件
	private Date beginDate;//起始有效期
	private Date endDate;//终止有效期
	private String accessFileLevel;//查询文件级别？
	private String menus;//菜单
	private String popedom;//权限
	private String status;//状态:"启用","停用"
	private String commendman;//推荐人
	private String movetelephone;//移动电话
	private String nowaddress;//现住宅地址
	private String nowtelephone;//现住宅电话
	private String identitycode;//身份证号码
	private String insurancecode;//社会保险号
	private String instancylinkman;//紧急联系人
	private String instancytelephone;//紧急联系电话
	private String sex;//性别
	private Date birthday;//出生日期
	private String personneltype;//职员类别(全职,兼职)
	private String duty;//职务
	private Date workdate;//入职时间
	private String highschool;//最高学历
	private String finishschool;//毕业学校
	private Date finishschooldate;//毕业时间
	private String consortname;//配偶姓名
	private String youngonename;//子女姓名
	private String officetelephone;//办公电话
	private String consorttelephone;//配偶电话
	private String avocation;//业余爱好
	private String consortcompany;//配偶工作单位
	private String strongsuit;//偏好特长
	private String communicate;//信息沟通
	private String bringup;//培训情况
	private String organise;//组织能力
	private String analyse;//分析能力
	private String planing;//计划能力
	private String empolder;//人员开发
	private String relation;//人际关系
	private Integer roleId;//角色id   外键（关联表s_role）
	private Integer handleJurisdictionId;//操作权限组id
	private String handleJurisdictionName;//操作权限组名字
	private Integer groupId;//用户组id(部门id)  外键（关联表s_user_group）
	private Integer queryJurisdictionId;//查询权限组id
	private String queryJurisdictionName;//查询权限组名字
	private Integer accessGroupId;//查询权限组id   外键（关联表s_access_group）
	private Integer deptManagerId;//所属部门的id
	private String deptManagerName;//所属部门的名字
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public void setCreateTime2(String createTime) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(createTime == null && !"".equals(createTime)){
			this.createTime = format.parse(createTime);
		}else{
			System.out.println("------------createTime------------");
		}
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
	public void setUpdateTime2(String updateTime) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(updateTime == null && !"".equals(updateTime)){
			this.updateTime = format.parse(updateTime);
		}else{
			System.out.println("------------updateTime------------");
		}
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
	public void setBeginDate2(String beginDate) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(beginDate == null && !"".equals(beginDate)){
			this.beginDate = format.parse(beginDate);
		}else{
			System.out.println("------------beginDate------------");
		}
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public void setEndDate2(String endDate) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(endDate == null && !"".equals(endDate)){
			this.endDate = format.parse(endDate);
		}else{
			System.out.println("------------endDate------------");
		}
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
	public void setBirthday2(String birthday) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(birthday == null && !"".equals(birthday)){
			this.birthday = format.parse(birthday);
		}else{
			System.out.println("------------birthday------------");
		}
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
	public void setWorkdate2(String workdate) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(workdate == null && !"".equals(workdate)){
			this.workdate = format.parse(workdate);
		}else{
			System.out.println("------------workdate------------");
		}
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
	public void setFinishschooldate2(String finishschooldate) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(finishschooldate == null && !"".equals(finishschooldate)){
			this.finishschooldate = format.parse(finishschooldate);
		}else{
			System.out.println("------------finishschooldate------------");
		}
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
	public Integer getHandleJurisdictionId() {
		return handleJurisdictionId;
	}
	public void setHandleJurisdictionId(Integer handleJurisdictionId) {
		this.handleJurisdictionId = handleJurisdictionId;
	}
	public String getHandleJurisdictionName() {
		return handleJurisdictionName;
	}
	public void setHandleJurisdictionName(String handleJurisdictionName) {
		this.handleJurisdictionName = handleJurisdictionName;
	}
	public Integer getQueryJurisdictionId() {
		return queryJurisdictionId;
	}
	public void setQueryJurisdictionId(Integer queryJurisdictionId) {
		this.queryJurisdictionId = queryJurisdictionId;
	}
	public String getQueryJurisdictionName() {
		return queryJurisdictionName;
	}
	public void setQueryJurisdictionName(String queryJurisdictionName) {
		this.queryJurisdictionName = queryJurisdictionName;
	}
	public Integer getDeptManagerId() {
		return deptManagerId;
	}
	public void setDeptManagerId(Integer deptManagerId) {
		this.deptManagerId = deptManagerId;
	}
	public String getDeptManagerName() {
		return deptManagerName;
	}
	public void setDeptManagerName(String deptManagerName) {
		this.deptManagerName = deptManagerName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public PersonnelManager() {
		System.out.println("指尖的力量, 可以改变世界...");
	}
	public PersonnelManager(Integer id, String creator, Date createTime,
			String updater, Date updateTime, String remark, String name,
			String cnname, String password, String address, String telephone,
			String email, Date beginDate, Date endDate, String accessFileLevel,
			String menus, String popedom, String status, String commendman,
			String movetelephone, String nowaddress, String nowtelephone,
			String identitycode, String insurancecode, String instancylinkman,
			String instancytelephone, String sex, Date birthday,
			String personneltype, String duty, Date workdate,
			String highschool, String finishschool, Date finishschooldate,
			String consortname, String youngonename, String officetelephone,
			String consorttelephone, String avocation, String consortcompany,
			String strongsuit, String communicate, String bringup,
			String organise, String analyse, String planing, String empolder,
			String relation, Integer roleId, Integer groupId,
			Integer accessGroupId) {
		super();
		this.id = id;
		this.creator = creator;
		this.createTime = createTime;
		this.updater = updater;
		this.updateTime = updateTime;
		this.remark = remark;
		this.name = name;
		this.cnname = cnname;
		this.password = password;
		this.address = address;
		this.telephone = telephone;
		this.email = email;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.accessFileLevel = accessFileLevel;
		this.menus = menus;
		this.popedom = popedom;
		this.status = status;
		this.commendman = commendman;
		this.movetelephone = movetelephone;
		this.nowaddress = nowaddress;
		this.nowtelephone = nowtelephone;
		this.identitycode = identitycode;
		this.insurancecode = insurancecode;
		this.instancylinkman = instancylinkman;
		this.instancytelephone = instancytelephone;
		this.sex = sex;
		this.birthday = birthday;
		this.personneltype = personneltype;
		this.duty = duty;
		this.workdate = workdate;
		this.highschool = highschool;
		this.finishschool = finishschool;
		this.finishschooldate = finishschooldate;
		this.consortname = consortname;
		this.youngonename = youngonename;
		this.officetelephone = officetelephone;
		this.consorttelephone = consorttelephone;
		this.avocation = avocation;
		this.consortcompany = consortcompany;
		this.strongsuit = strongsuit;
		this.communicate = communicate;
		this.bringup = bringup;
		this.organise = organise;
		this.analyse = analyse;
		this.planing = planing;
		this.empolder = empolder;
		this.relation = relation;
		this.roleId = roleId;
		this.groupId = groupId;
		this.accessGroupId = accessGroupId;
	}
	@Override
	public String toString() {
		return "PersonnelManager [id=" + id + ", creator=" + creator
				+ ", createTime=" + createTime + ", updater=" + updater
				+ ", updateTime=" + updateTime + ", remark=" + remark
				+ ", name=" + name + ", cnname=" + cnname + ", password="
				+ password + ", address=" + address + ", telephone="
				+ telephone + ", email=" + email + ", beginDate=" + beginDate
				+ ", endDate=" + endDate + ", accessFileLevel="
				+ accessFileLevel + ", menus=" + menus + ", popedom=" + popedom
				+ ", status=" + status + ", commendman=" + commendman
				+ ", movetelephone=" + movetelephone + ", nowaddress="
				+ nowaddress + ", nowtelephone=" + nowtelephone
				+ ", identitycode=" + identitycode + ", insurancecode="
				+ insurancecode + ", instancylinkman=" + instancylinkman
				+ ", instancytelephone=" + instancytelephone + ", sex=" + sex
				+ ", birthday=" + birthday + ", personneltype=" + personneltype
				+ ", duty=" + duty + ", workdate=" + workdate + ", highschool="
				+ highschool + ", finishschool=" + finishschool
				+ ", finishschooldate=" + finishschooldate + ", consortname="
				+ consortname + ", youngonename=" + youngonename
				+ ", officetelephone=" + officetelephone
				+ ", consorttelephone=" + consorttelephone + ", avocation="
				+ avocation + ", consortcompany=" + consortcompany
				+ ", strongsuit=" + strongsuit + ", communicate=" + communicate
				+ ", bringup=" + bringup + ", organise=" + organise
				+ ", analyse=" + analyse + ", planing=" + planing
				+ ", empolder=" + empolder + ", relation=" + relation
				+ ", roleId=" + roleId + ", groupId=" + groupId
				+ ", accessGroupId=" + accessGroupId + "]";
	}
}