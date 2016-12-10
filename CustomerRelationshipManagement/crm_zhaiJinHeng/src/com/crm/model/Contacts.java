package com.crm.model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 联系人列表实体类-------对应------->联系人列表数据库中的c_company_linkman表
 * @author Administrator
 *
 */
public class Contacts implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 950886241022428812L;
	private Integer id;
	private String name;//名称
	private String pycode;//拼音码
	private String code;//编码
	private String sex;//性别
	private Date birthday;//出生日期
	private String department;//部门
	private String duty;//职务
	private String officeTel;//办公电话
	private String homeTel;//家庭电话
	private String mobile;//手机,移动电话
	private String email;//邮箱
	private String qqNum;//QQ号
	private String qqName;//QQ昵称
	private String postcode;//邮编
	private String address;//地址
	private String fax;//传真
	private String otherLink;//其他联系方式
	private String hobby;//爱好
	private String taboo;//禁止
	private String mainFlag;//是否为主要联系人
	private String creater;//创建人
	private Date createTime;//创建时间
	private String updater;//修改(更改)人
	private Date updateTime;//更改时间
	private String remark;//备注
	private String custom1;//自定义1
	private String custom2;//自定义2
	private String custom3;//自定义3
	private String custom4;//自定义4
	private String choice1;//自定选项1
	private String choice2;//自定选项2
	private String choice3;//自定选项3
	private String choice4;//自定选项4
	private Date time1;//自定时间1
	private Date time2;//自定时间2
	private String mType;//
	private String shareFlag;//是否共享
	private String shareIds;//共享ids(多个id可用逗号等分开)
	private Integer cId;//客户id 外键（关联表c_company）
	private Integer ownerUsr;//所属人 外键（关联表s_user）
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

	public String getPycode() {
		return pycode;
	}

	public void setPycode(String pycode) {
		this.pycode = pycode;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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
	public String getDepartment() {
		return department;
	}
	
	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getOfficeTel() {
		return officeTel;
	}

	public void setOfficeTel(String officeTel) {
		this.officeTel = officeTel;
	}

	public String getHomeTel() {
		return homeTel;
	}

	public void setHomeTel(String homeTel) {
		this.homeTel = homeTel;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQqNum() {
		return qqNum;
	}

	public void setQqNum(String qqNum) {
		this.qqNum = qqNum;
	}

	public String getQqName() {
		return qqName;
	}

	public void setQqName(String qqName) {
		this.qqName = qqName;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getOtherLink() {
		return otherLink;
	}

	public void setOtherLink(String otherLink) {
		this.otherLink = otherLink;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getTaboo() {
		return taboo;
	}

	public void setTaboo(String taboo) {
		this.taboo = taboo;
	}

	public String getMainFlag() {
		return mainFlag;
	}

	public void setMainFlag(String mainFlag) {
		this.mainFlag = mainFlag;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
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

	public String getCustom1() {
		return custom1;
	}

	public void setCustom1(String custom1) {
		this.custom1 = custom1;
	}

	public String getCustom2() {
		return custom2;
	}

	public void setCustom2(String custom2) {
		this.custom2 = custom2;
	}

	public String getCustom3() {
		return custom3;
	}

	public void setCustom3(String custom3) {
		this.custom3 = custom3;
	}

	public String getCustom4() {
		return custom4;
	}

	public void setCustom4(String custom4) {
		this.custom4 = custom4;
	}

	public String getChoice1() {
		return choice1;
	}

	public void setChoice1(String choice1) {
		this.choice1 = choice1;
	}

	public String getChoice2() {
		return choice2;
	}

	public void setChoice2(String choice2) {
		this.choice2 = choice2;
	}

	public String getChoice3() {
		return choice3;
	}

	public void setChoice3(String choice3) {
		this.choice3 = choice3;
	}

	public String getChoice4() {
		return choice4;
	}

	public void setChoice4(String choice4) {
		this.choice4 = choice4;
	}

	public Date getTime1() {
		return time1;
	}

	public void setTime1(Date time1) {
		this.time1 = time1;
	}
	public void setTime11(String time1) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(time1 == null && !"".equals(time1)){
			this.time1 = format.parse(time1);
		}else{
			System.out.println("------------time1------------");
		}
	}
	public Date getTime2() {
		return time2;
	}

	public void setTime2(Date time2) {
		this.time2 = time2;
	}
	public void setTime22(String time2) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(time2 == null && !"".equals(time2)){
			this.time2 = format.parse(time2);
		}else{
			System.out.println("------------time2------------");
		}
	}
	public String getmType() {
		return mType;
	}

	public void setmType(String mType) {
		this.mType = mType;
	}

	public String getShareFlag() {
		return shareFlag;
	}

	public void setShareFlag(String shareFlag) {
		this.shareFlag = shareFlag;
	}

	public String getShareIds() {
		return shareIds;
	}

	public void setShareIds(String shareIds) {
		this.shareIds = shareIds;
	}

	public Integer getcId() {
		return cId;
	}

	public void setcId(Integer cId) {
		this.cId = cId;
	}

	public Integer getOwnerUsr() {
		return ownerUsr;
	}

	public void setOwnerUsr(Integer ownerUsr) {
		this.ownerUsr = ownerUsr;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Contacts() {
		System.out.println("指尖的力量, 可以改变世界...");
	}

	public Contacts(Integer id, String name, String pycode, String code,
			String sex, Date birthday, String department, String duty,
			String officeTel, String homeTel, String mobile, String email,
			String qqNum, String qqName, String postcode, String address,
			String fax, String otherLink, String hobby, String taboo,
			String mainFlag, String creater, Date createTime, String updater,
			Date updateTime, String remark, String custom1, String custom2,
			String custom3, String custom4, String choice1, String choice2,
			String choice3, String choice4, Date time1, Date time2,
			String mType, String shareFlag, String shareIds, Integer cId,
			Integer ownerUsr) {
		super();
		this.id = id;
		this.name = name;
		this.pycode = pycode;
		this.code = code;
		this.sex = sex;
		this.birthday = birthday;
		this.department = department;
		this.duty = duty;
		this.officeTel = officeTel;
		this.homeTel = homeTel;
		this.mobile = mobile;
		this.email = email;
		this.qqNum = qqNum;
		this.qqName = qqName;
		this.postcode = postcode;
		this.address = address;
		this.fax = fax;
		this.otherLink = otherLink;
		this.hobby = hobby;
		this.taboo = taboo;
		this.mainFlag = mainFlag;
		this.creater = creater;
		this.createTime = createTime;
		this.updater = updater;
		this.updateTime = updateTime;
		this.remark = remark;
		this.custom1 = custom1;
		this.custom2 = custom2;
		this.custom3 = custom3;
		this.custom4 = custom4;
		this.choice1 = choice1;
		this.choice2 = choice2;
		this.choice3 = choice3;
		this.choice4 = choice4;
		this.time1 = time1;
		this.time2 = time2;
		this.mType = mType;
		this.shareFlag = shareFlag;
		this.shareIds = shareIds;
		this.cId = cId;
		this.ownerUsr = ownerUsr;
	}

	@Override
	public String toString() {
		return "Contacts [id=" + id + ", name=" + name + ", pycode=" + pycode
				+ ", code=" + code + ", sex=" + sex + ", birthday=" + birthday
				+ ", department=" + department + ", duty=" + duty
				+ ", officeTel=" + officeTel + ", homeTel=" + homeTel
				+ ", mobile=" + mobile + ", email=" + email + ", qqNum="
				+ qqNum + ", qqName=" + qqName + ", postcode=" + postcode
				+ ", address=" + address + ", fax=" + fax + ", otherLink="
				+ otherLink + ", hobby=" + hobby + ", taboo=" + taboo
				+ ", mainFlag=" + mainFlag + ", creater=" + creater
				+ ", createTime=" + createTime + ", updater=" + updater
				+ ", updateTime=" + updateTime + ", remark=" + remark
				+ ", custom1=" + custom1 + ", custom2=" + custom2
				+ ", custom3=" + custom3 + ", custom4=" + custom4
				+ ", choice1=" + choice1 + ", choice2=" + choice2
				+ ", choice3=" + choice3 + ", choice4=" + choice4 + ", time1="
				+ time1 + ", time2=" + time2 + ", mType=" + mType
				+ ", shareFlag=" + shareFlag + ", shareIds=" + shareIds
				+ ", cId=" + cId + ", ownerUsr=" + ownerUsr + "]";
	}
}