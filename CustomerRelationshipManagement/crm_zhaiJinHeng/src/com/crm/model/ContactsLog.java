package com.crm.model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 联系记录列表实体类-------对应------->联系记录列表数据库中的c_company_touch表
 * @author Administrator
 *
 */
public class ContactsLog implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 6424851110568206438L;
	private Integer id;
	private Integer cId;//客户id 外键（关联表c_company）
	private String linkMan;//联系人
	private String linkFashion;//联系方式
	private String linkType;//联系类别
	private Date linkTime;//联系时间
	private String content;//联系记录(内容)
	private String userName;
	private Date nextTouchDate;//下次联系时间
	private String nextTouchAim;//下次联系目标
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
	private String mType;
	private String shareFlag;//是否共享
	private String shareIds;//共享ids(多个id可用逗号等分开)
	private Integer ownerUsr;//所属人 外键（关联表s_user）
	private String salesman;//(s_user表中的)业务员
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getcId() {
		return cId;
	}
	public void setcId(Integer cId) {
		this.cId = cId;
	}
	public String getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}
	public String getLinkFashion() {
		return linkFashion;
	}
	public void setLinkFashion(String linkFashion) {
		this.linkFashion = linkFashion;
	}
	public String getLinkType() {
		return linkType;
	}
	public void setLinkType(String linkType) {
		this.linkType = linkType;
	}
	public Date getLinkTime() {
		return linkTime;
	}
	public void setLinkTime(Date linkTime) {
		this.linkTime = linkTime;
	}
	public Date getLinkTime2() {
		return linkTime;
	}
	public void setLinkTime2(String linkTime) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(linkTime == null && !"".equals(linkTime)){
			this.linkTime = format.parse(linkTime);
		}else{
			System.out.println("------------linkTime------------");
		}
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getNextTouchAim() {
		return nextTouchAim;
	}
	public void setNextTouchAim(String nextTouchAim) {
		this.nextTouchAim = nextTouchAim;
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
	public Date getTime2() {
		return time2;
	}
	public void setTime2(Date time2) {
		this.time2 = time2;
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
	public Integer getOwnerUsr() {
		return ownerUsr;
	}
	public void setOwnerUsr(Integer ownerUsr) {
		this.ownerUsr = ownerUsr;
	}
	public String getSalesman() {
		return salesman;
	}
	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public ContactsLog() {
		System.out.println("指尖的力量, 可以改变世界...");
	}
	public ContactsLog(Integer id, Integer cId, String linkMan,
			String linkFashion, String linkType, Date linkTime, String content,
			String userName, Date nextTouchDate, String nextTouchAim,
			String creater, Date createTime, String updater, Date updateTime,
			String remark, String custom1, String custom2, String custom3,
			String custom4, String choice1, String choice2, String choice3,
			String choice4, Date time1, Date time2, String mType,
			String shareFlag, String shareIds, Integer ownerUsr) {
		super();
		this.id = id;
		this.cId = cId;
		this.linkMan = linkMan;
		this.linkFashion = linkFashion;
		this.linkType = linkType;
		this.linkTime = linkTime;
		this.content = content;
		this.userName = userName;
		this.nextTouchDate = nextTouchDate;
		this.nextTouchAim = nextTouchAim;
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
		this.ownerUsr = ownerUsr;
	}
	@Override
	public String toString() {
		return "ContactsLog [id=" + id + ", cId=" + cId + ", linkMan="
				+ linkMan + ", linkFashion=" + linkFashion + ", linkType="
				+ linkType + ", linkTime=" + linkTime + ", content=" + content
				+ ", userName=" + userName + ", nextTouchDate=" + nextTouchDate
				+ ", nextTouchAim=" + nextTouchAim + ", creater=" + creater
				+ ", createTime=" + createTime + ", updater=" + updater
				+ ", updateTime=" + updateTime + ", remark=" + remark
				+ ", custom1=" + custom1 + ", custom2=" + custom2
				+ ", custom3=" + custom3 + ", custom4=" + custom4
				+ ", choice1=" + choice1 + ", choice2=" + choice2
				+ ", choice3=" + choice3 + ", choice4=" + choice4 + ", time1="
				+ time1 + ", time2=" + time2 + ", mType=" + mType
				+ ", shareFlag=" + shareFlag + ", shareIds=" + shareIds
				+ ", ownerUsr=" + ownerUsr + "]";
	}
}