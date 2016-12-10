package com.crm.model;

import java.io.Serializable;
import java.util.Date;
/**
 * 应收账款实体类-------对应------->应收账款数据库中的b_need_gather表
 * @author Administrator
 *
 */
public class Receivables implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 2921777176411831593L;
	private Integer id;
	private Integer saleId;//销售单id  外键（关联表b_order  id列）
	private Integer pid;//销售收款id  外键（关联表b_gather  id列）
	private Integer ownerUsr;//所属人
	private String shareId;//共享id
	private String readShareId;//(读)共享id
	private String creator;//创建人
	private Date createTime;//创建时间
	private String updater;//修改(更改)人
	private Date updateTime;//更改时间
	private String remark;//备注
	private Integer cId;//客户id  外键（关联表c_company  id列）
	private String clientCode;//客户编码
	private String clientGrade;//客户等级
	private String clientRegionName;//客户区域名称
	private String clientProvince;//客户省
	private String clientCity;//客户城市
	private String clientAddress;//客户联系地址
	private String clientEmail;//客户电子邮件
	private String clientTel1;//客户电话一
	private String clientTel2;//客户电话二
	private String cName;//客户名称
	private String cType;//客户类型
	private Date buildDate;//日期
	private String saleCode;//销售单号(销售单编码)
	private Double total;//应收金额
	private Double payed;//已收金额
	private Double balance;//应收余额
	private String overFlag;//是否结束?
	private String status;//状态
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSaleId() {
		return saleId;
	}
	public void setSaleId(Integer saleId) {
		this.saleId = saleId;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Integer getOwnerUsr() {
		return ownerUsr;
	}
	public void setOwnerUsr(Integer ownerUsr) {
		this.ownerUsr = ownerUsr;
	}
	public String getShareId() {
		return shareId;
	}
	public void setShareId(String shareId) {
		this.shareId = shareId;
	}
	public String getReadShareId() {
		return readShareId;
	}
	public void setReadShareId(String readShareId) {
		this.readShareId = readShareId;
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
	public Integer getcId() {
		return cId;
	}
	public void setcId(Integer cId) {
		this.cId = cId;
	}
	public String getClientCode() {
		return clientCode;
	}
	public void setClientCode(String clientCode) {
		this.clientCode = clientCode;
	}
	public String getClientGrade() {
		return clientGrade;
	}
	public void setClientGrade(String clientGrade) {
		this.clientGrade = clientGrade;
	}
	public String getClientRegionName() {
		return clientRegionName;
	}
	public void setClientRegionName(String clientRegionName) {
		this.clientRegionName = clientRegionName;
	}
	public String getClientProvince() {
		return clientProvince;
	}
	public void setClientProvince(String clientProvince) {
		this.clientProvince = clientProvince;
	}
	public String getClientCity() {
		return clientCity;
	}
	public void setClientCity(String clientCity) {
		this.clientCity = clientCity;
	}
	public String getClientAddress() {
		return clientAddress;
	}
	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}
	public String getClientEmail() {
		return clientEmail;
	}
	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}
	public String getClientTel1() {
		return clientTel1;
	}
	public void setClientTel1(String clientTel1) {
		this.clientTel1 = clientTel1;
	}
	public String getClientTel2() {
		return clientTel2;
	}
	public void setClientTel2(String clientTel2) {
		this.clientTel2 = clientTel2;
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
	public Date getBuildDate() {
		return buildDate;
	}
	public void setBuildDate(Date buildDate) {
		this.buildDate = buildDate;
	}
	public String getSaleCode() {
		return saleCode;
	}
	public void setSaleCode(String saleCode) {
		this.saleCode = saleCode;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Double getPayed() {
		return payed;
	}
	public void setPayed(Double payed) {
		this.payed = payed;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public String getOverFlag() {
		return overFlag;
	}
	public void setOverFlag(String overFlag) {
		this.overFlag = overFlag;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Receivables() {
		System.out.println("指尖的力量, 可以改变世界...");
	}
	public Receivables(Integer id, Integer saleId, Integer pid,
			Integer ownerUsr, String shareId, String readShareId,
			String creator, Date createTime, String updater, Date updateTime,
			String remark, Integer cId, String cName, String cType,
			Date buildDate, String saleCode, Double total, Double payed,
			Double balance, String overFlag, String status) {
		super();
		this.id = id;
		this.saleId = saleId;
		this.pid = pid;
		this.ownerUsr = ownerUsr;
		this.shareId = shareId;
		this.readShareId = readShareId;
		this.creator = creator;
		this.createTime = createTime;
		this.updater = updater;
		this.updateTime = updateTime;
		this.remark = remark;
		this.cId = cId;
		this.cName = cName;
		this.cType = cType;
		this.buildDate = buildDate;
		this.saleCode = saleCode;
		this.total = total;
		this.payed = payed;
		this.balance = balance;
		this.overFlag = overFlag;
		this.status = status;
	}
	@Override
	public String toString() {
		return "Receivables [id=" + id + ", saleId=" + saleId + ", pid=" + pid
				+ ", ownerUsr=" + ownerUsr + ", shareId=" + shareId
				+ ", readShareId=" + readShareId + ", creator=" + creator
				+ ", createTime=" + createTime + ", updater=" + updater
				+ ", updateTime=" + updateTime + ", remark=" + remark
				+ ", cId=" + cId + ", cName=" + cName + ", cType=" + cType
				+ ", buildDate=" + buildDate + ", saleCode=" + saleCode
				+ ", total=" + total + ", payed=" + payed + ", balance="
				+ balance + ", overFlag=" + overFlag + ", status=" + status
				+ "]";
	}
}