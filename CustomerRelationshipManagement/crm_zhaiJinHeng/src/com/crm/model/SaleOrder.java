package com.crm.model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 销售单实体类-------对应------->销售单数据库中的b_order表
 * @author Administrator
 *
 */
public class SaleOrder implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = -4730158320259746484L;
	private Integer id;
	private Integer ownerUsr;//所属人外键（关联表s_user）
	private String salesman;//(s_user表中的)业务员
	private String creater;//创建人
	private Date createTime;//创建时间
	private String updater;//修改(更改)人
	private Date updateTime;//更改时间
	private String remark;//备注
	private String code;//编码
	private Date orderDate;//开单日期
	private Integer cId;//客户id
	private String cName;//客户名称
	private String cType;//客户类型
	private String linkman;//联系人
	private String telephone;//电话
	private String address;//地址(送货地址)
	private String seller;//卖方
	private Double total;//金额
	private Double agio;//折扣
	private Double agioTotal;//总折扣
	private String auditor;//审计员
	private Date auditDate;//审计日期
	private String statusId;//状态id
	private String status;//状态
	private String auditReason;//审计意见,理由
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public void setOrderDate2(String orderDate) throws ParseException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		if(orderDate == null && !"".equals(orderDate)){
			this.orderDate = format.parse(orderDate);
		}else{
			System.out.println("------------orderDate------------");
		}
	}
	public Integer getcId() {
		return cId;
	}
	public void setcId(Integer cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcType() {
		return cType;
	}
	public void setcType(String cType) {
		this.cType = cType;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Double getAgio() {
		return agio;
	}
	public void setAgio(Double agio) {
		this.agio = agio;
	}
	public Double getAgioTotal() {
		return agioTotal;
	}
	public void setAgioTotal(Double agioTotal) {
		this.agioTotal = agioTotal;
	}
	public String getAuditor() {
		return auditor;
	}
	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}
	public Date getAuditDate() {
		return auditDate;
	}
	public void setAuditDate(Date auditDate) {
		this.auditDate = auditDate;
	}
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAuditReason() {
		return auditReason;
	}
	public void setAuditReason(String auditReason) {
		this.auditReason = auditReason;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public SaleOrder() {
		System.out.println("指尖的力量, 可以改变世界...");
	}
	public SaleOrder(Integer id, Integer ownerUsr, String creater,
			Date createTime, String updater, Date updateTime, String remark,
			String code, Date orderDate, Integer cId, String cName,
			String cType, String linkman, String telephone, String address,
			String seller, Double total, Double agio, Double agioTotal,
			String auditor, Date auditDate, String statusId, String status,
			String auditReason, String custom1, String custom2, String custom3,
			String custom4, String choice1, String choice2, String choice3,
			String choice4, Date time1, Date time2, String shareFlag,
			String shareIds) {
		super();
		this.id = id;
		this.ownerUsr = ownerUsr;
		this.creater = creater;
		this.createTime = createTime;
		this.updater = updater;
		this.updateTime = updateTime;
		this.remark = remark;
		this.code = code;
		this.orderDate = orderDate;
		this.cId = cId;
		this.cName = cName;
		this.cType = cType;
		this.linkman = linkman;
		this.telephone = telephone;
		this.address = address;
		this.seller = seller;
		this.total = total;
		this.agio = agio;
		this.agioTotal = agioTotal;
		this.auditor = auditor;
		this.auditDate = auditDate;
		this.statusId = statusId;
		this.status = status;
		this.auditReason = auditReason;
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
	}
	@Override
	public String toString() {
		return "SaleOrder [id=" + id + ", ownerUsr=" + ownerUsr + ", creater="
				+ creater + ", createTime=" + createTime + ", updater="
				+ updater + ", updateTime=" + updateTime + ", remark=" + remark
				+ ", code=" + code + ", orderDate=" + orderDate + ", cId="
				+ cId + ", cName=" + cName + ", cType=" + cType + ", linkman="
				+ linkman + ", telephone=" + telephone + ", address=" + address
				+ ", seller=" + seller + ", total=" + total + ", agio=" + agio
				+ ", agioTotal=" + agioTotal + ", auditor=" + auditor
				+ ", auditDate=" + auditDate + ", statusId=" + statusId
				+ ", status=" + status + ", auditReason=" + auditReason
				+ ", custom1=" + custom1 + ", custom2=" + custom2
				+ ", custom3=" + custom3 + ", custom4=" + custom4
				+ ", choice1=" + choice1 + ", choice2=" + choice2
				+ ", choice3=" + choice3 + ", choice4=" + choice4 + ", time1="
				+ time1 + ", time2=" + time2 + ", shareFlag=" + shareFlag
				+ ", shareIds=" + shareIds + "]";
	}
}