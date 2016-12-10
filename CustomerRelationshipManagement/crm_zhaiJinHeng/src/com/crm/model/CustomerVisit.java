package com.crm.model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 客户拜访实体类-------对应------->客户拜访数据库中的c_company表
 * @author Administrator
 *
 */
public class CustomerVisit implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 8459423814210078792L;
	private Integer id;
	private String name;//名称
	private String pycode;//拼音码
	private String code;//编码
	private String grade;//等级(客户等级)
	private String source;//来源(客户来源)
	private String cType;//客户类型？
	private String mType;
	private Integer regionId;//区域id
	private String regionName;//区域名称
	private String province;//省
	private String city;//城市
	private String fax;//传真
	private String postcode;//邮编
	private String tel1;//电话一
	private String tel2;//电话二
	private String mobile;//手机,移动电话
	private String email;//邮箱
	private String web;//网站
	private String address;//地址
	private String dealing;//经营(经营范围)
	private String scale;//规模
	private String registerMoney;//注册资金
	private String kind;//企业性质
	private String trade;//行业,贸易(所属行业)
	private String legalPerson;//法人
	private String bank;//银行(开户银行)
	private String account;//银行账户
	private String taxCode;//公司税号
	private String buyFlag;//是否购买
	private String creater;//创建人
	private Date createTime;//创建时间
	private String updater;//修改(更改)人
	private Date updateTime;//更改时间
	private String status;//状态
	private String remark;//备注
	private Date nextTouchDate;//下次联系时间
	private Date nextServiceDate;//下次服务时间
	private Date firstTouchDate;//第一次联系时间
	private Date lastTouchDate;//最后联系时间
	private String nextTouchAim;//下次联系目的
	private String dispensePerson;//分配人
	private Date dispenseDate;//分配时间
	private Integer applyUserId;
	private String sPerson;
	private String sReason;
	private Date sDate;
	private String planCallbackReason;//计划回访原因
	private Date planCallbackDate;//计划回访日期
	private String curLinkFlag;//当次联系是否成功
	private String curBuyFlag;//当次是否购买
	private Integer freezeLeaveDay;
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
	private String shareFlag;//是否共享
	private String shareIds;//共享ids(多个id可用逗号等分开)
	private String quality;//客户性质
	private Integer ownerUsr;//所属人
	public CustomerVisit() {
		System.out.println("指尖的力量, 可以改变世界...");
	}
	public CustomerVisit(Integer id, String name, String pycode, String code,
			String grade, String source, String cType, String mType,
			Integer regionId, String regionName, String province, String city,
			String fax, String postcode, String tel1, String tel2,
			String mobile, String email, String web, String address,
			String dealing, String scale, String registerMoney, String kind,
			String trade, String legalPerson, String bank, String account,
			String taxCode, String buyFlag, String creater, Date createTime,
			String updater, Date updateTime, String status, String remark,
			Date nextTouchDate, Date nextServiceDate, Date firstTouchDate,
			Date lastTouchDate, String nextTouchAim, String dispensePerson,
			Date dispenseDate, Integer applyUserId, String sPerson,
			String sReason, Date sDate, String planCallbackReason,
			Date planCallbackDate, String curLinkFlag, String curBuyFlag,
			Integer freezeLeaveDay, String custom1, String custom2,
			String custom3, String custom4, String choice1, String choice2,
			String choice3, String choice4, Date time1, Date time2,
			String shareFlag, String shareIds, String quality, Integer ownerUsr) {
		super();
		this.id = id;
		this.name = name;
		this.pycode = pycode;
		this.code = code;
		this.grade = grade;
		this.source = source;
		this.cType = cType;
		this.mType = mType;
		this.regionId = regionId;
		this.regionName = regionName;
		this.province = province;
		this.city = city;
		this.fax = fax;
		this.postcode = postcode;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.mobile = mobile;
		this.email = email;
		this.web = web;
		this.address = address;
		this.dealing = dealing;
		this.scale = scale;
		this.registerMoney = registerMoney;
		this.kind = kind;
		this.trade = trade;
		this.legalPerson = legalPerson;
		this.bank = bank;
		this.account = account;
		this.taxCode = taxCode;
		this.buyFlag = buyFlag;
		this.creater = creater;
		this.createTime = createTime;
		this.updater = updater;
		this.updateTime = updateTime;
		this.status = status;
		this.remark = remark;
		this.nextTouchDate = nextTouchDate;
		this.nextServiceDate = nextServiceDate;
		this.firstTouchDate = firstTouchDate;
		this.lastTouchDate = lastTouchDate;
		this.nextTouchAim = nextTouchAim;
		this.dispensePerson = dispensePerson;
		this.dispenseDate = dispenseDate;
		this.applyUserId = applyUserId;
		this.sPerson = sPerson;
		this.sReason = sReason;
		this.sDate = sDate;
		this.planCallbackReason = planCallbackReason;
		this.planCallbackDate = planCallbackDate;
		this.curLinkFlag = curLinkFlag;
		this.curBuyFlag = curBuyFlag;
		this.freezeLeaveDay = freezeLeaveDay;
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
		this.shareFlag = shareFlag;
		this.shareIds = shareIds;
		this.quality = quality;
		this.ownerUsr = ownerUsr;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getcType() {
		return cType;
	}
	public void setcType(String cType) {
		this.cType = cType;
	}
	public String getmType() {
		return mType;
	}
	public void setmType(String mType) {
		this.mType = mType;
	}
	public Integer getRegionId() {
		return regionId;
	}
	public void setRegionId(Integer regionId) {
		this.regionId = regionId;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
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
	public String getWeb() {
		return web;
	}
	public void setWeb(String web) {
		this.web = web;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDealing() {
		return dealing;
	}
	public void setDealing(String dealing) {
		this.dealing = dealing;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getRegisterMoney() {
		return registerMoney;
	}
	public void setRegisterMoney(String registerMoney) {
		this.registerMoney = registerMoney;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getTrade() {
		return trade;
	}
	public void setTrade(String trade) {
		this.trade = trade;
	}
	public String getLegalPerson() {
		return legalPerson;
	}
	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getTaxCode() {
		return taxCode;
	}
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}
	public String getBuyFlag() {
		return buyFlag;
	}
	public void setBuyFlag(String buyFlag) {
		this.buyFlag = buyFlag;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getNextTouchDate() {
		return nextTouchDate;
	}
	public void setNextTouchDate(Date nextTouchDate) {
		this.nextTouchDate = nextTouchDate;
	}
	public void setNextTouchDate2(String nextTouchDate) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(nextTouchDate == null && !"".equals(nextTouchDate)){
			this.nextTouchDate = format.parse(nextTouchDate);
		}else{
			System.out.println("------------nextTouchDate------------");
		}
	}
	public Date getNextServiceDate() {
		return nextServiceDate;
	}
	public void setNextServiceDate(Date nextServiceDate) {
		this.nextServiceDate = nextServiceDate;
	}
	public Date getFirstTouchDate() {
		return firstTouchDate;
	}
	public void setFirstTouchDate(Date firstTouchDate) {
		this.firstTouchDate = firstTouchDate;
	}
	public Date getLastTouchDate() {
		return lastTouchDate;
	}
	public void setLastTouchDate(Date lastTouchDate) {
		this.lastTouchDate = lastTouchDate;
	}
	public String getNextTouchAim() {
		return nextTouchAim;
	}
	public void setNextTouchAim(String nextTouchAim) {
		this.nextTouchAim = nextTouchAim;
	}
	public String getDispensePerson() {
		return dispensePerson;
	}
	public void setDispensePerson(String dispensePerson) {
		this.dispensePerson = dispensePerson;
	}
	public Date getDispenseDate() {
		return dispenseDate;
	}
	public void setDispenseDate(Date dispenseDate) {
		this.dispenseDate = dispenseDate;
	}
	public Integer getApplyUserId() {
		return applyUserId;
	}
	public void setApplyUserId(Integer applyUserId) {
		this.applyUserId = applyUserId;
	}
	public String getsPerson() {
		return sPerson;
	}
	public void setsPerson(String sPerson) {
		this.sPerson = sPerson;
	}
	public String getsReason() {
		return sReason;
	}
	public void setsReason(String sReason) {
		this.sReason = sReason;
	}
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	public String getPlanCallbackReason() {
		return planCallbackReason;
	}
	public void setPlanCallbackReason(String planCallbackReason) {
		this.planCallbackReason = planCallbackReason;
	}
	public Date getPlanCallbackDate() {
		return planCallbackDate;
	}
	public void setPlanCallbackDate(Date planCallbackDate) {
		this.planCallbackDate = planCallbackDate;
	}
	public String getCurLinkFlag() {
		return curLinkFlag;
	}
	public void setCurLinkFlag(String curLinkFlag) {
		this.curLinkFlag = curLinkFlag;
	}
	public String getCurBuyFlag() {
		return curBuyFlag;
	}
	public void setCurBuyFlag(String curBuyFlag) {
		this.curBuyFlag = curBuyFlag;
	}
	public Integer getFreezeLeaveDay() {
		return freezeLeaveDay;
	}
	public void setFreezeLeaveDay(Integer freezeLeaveDay) {
		this.freezeLeaveDay = freezeLeaveDay;
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
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
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
	@Override
	public String toString() {
		return "CustomerVisit [id=" + id + ", name=" + name + ", pycode="
				+ pycode + ", code=" + code + ", grade=" + grade + ", source="
				+ source + ", cType=" + cType + ", mType=" + mType
				+ ", regionId=" + regionId + ", regionName=" + regionName
				+ ", province=" + province + ", city=" + city + ", fax=" + fax
				+ ", postcode=" + postcode + ", tel1=" + tel1 + ", tel2="
				+ tel2 + ", mobile=" + mobile + ", email=" + email + ", web="
				+ web + ", address=" + address + ", dealing=" + dealing
				+ ", scale=" + scale + ", registerMoney=" + registerMoney
				+ ", kind=" + kind + ", trade=" + trade + ", legalPerson="
				+ legalPerson + ", bank=" + bank + ", account=" + account
				+ ", taxCode=" + taxCode + ", buyFlag=" + buyFlag
				+ ", creater=" + creater + ", createTime=" + createTime
				+ ", updater=" + updater + ", updateTime=" + updateTime
				+ ", status=" + status + ", remark=" + remark
				+ ", nextTouchDate=" + nextTouchDate + ", nextServiceDate="
				+ nextServiceDate + ", firstTouchDate=" + firstTouchDate
				+ ", lastTouchDate=" + lastTouchDate + ", nextTouchAim="
				+ nextTouchAim + ", dispensePerson=" + dispensePerson
				+ ", dispenseDate=" + dispenseDate + ", applyUserId="
				+ applyUserId + ", sPerson=" + sPerson + ", sReason=" + sReason
				+ ", sDate=" + sDate + ", planCallbackReason="
				+ planCallbackReason + ", planCallbackDate=" + planCallbackDate
				+ ", curLinkFlag=" + curLinkFlag + ", curBuyFlag=" + curBuyFlag
				+ ", freezeLeaveDay=" + freezeLeaveDay + ", custom1=" + custom1
				+ ", custom2=" + custom2 + ", custom3=" + custom3
				+ ", custom4=" + custom4 + ", choice1=" + choice1
				+ ", choice2=" + choice2 + ", choice3=" + choice3
				+ ", choice4=" + choice4 + ", time1=" + time1 + ", time2="
				+ time2 + ", shareFlag=" + shareFlag + ", shareIds=" + shareIds
				+ ", quality=" + quality + ", ownerUsr=" + ownerUsr + "]";
	}
}
