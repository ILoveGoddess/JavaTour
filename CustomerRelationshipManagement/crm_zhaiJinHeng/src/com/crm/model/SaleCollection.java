package com.crm.model;

import java.io.Serializable;
import java.util.Date;
/**
 * 销售收款实体类-------对应------->销售收款数据库中的b_gather表
 * @author Administrator
 *
 */
public class SaleCollection implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 4426574916080474611L;
	private Integer id;
	private Integer ownerUsr;//所属人
	private String creater;//创建人
	private Date createTime;//创建时间
	private String updater;//修改(更改)人
	private Date updateTime;//更改时间
	private String remark;//备注
	private Integer cId;//客户id
	private String cName;//客户名称
	private String cType;//客户类型
	private String payer;//支付人
	private Date payDate;//支付时间
	private String payType;//支付类型
	private String billCode;//帐单号（帐单编码）
	private String handler;//操作人
	private Double total;//总金额？
	private String statusid;//状态id
	private String status;//状态
	private String auditor;//审计员
	private Date auditDate;//审计日期
	private String auditIdea;//审计意见
	private String code;//编码
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
	public String getPayer() {
		return payer;
	}
	public void setPayer(String payer) {
		this.payer = payer;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getBillCode() {
		return billCode;
	}
	public void setBillCode(String billCode) {
		this.billCode = billCode;
	}
	public String getHandler() {
		return handler;
	}
	public void setHandler(String handler) {
		this.handler = handler;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public String getStatusid() {
		return statusid;
	}
	public void setStatusid(String statusid) {
		this.statusid = statusid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getAuditIdea() {
		return auditIdea;
	}
	public void setAuditIdea(String auditIdea) {
		this.auditIdea = auditIdea;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public SaleCollection() {
		System.out.println("指尖的力量, 可以改变世界...");
	}
	public SaleCollection(Integer id, Integer ownerUsr, String creater,
			Date createTime, String updater, Date updateTime, String remark,
			Integer cId, String cName, String cType, String payer,
			Date payDate, String payType, String billCode, String handler,
			Double total, String statusid, String status, String auditor,
			Date auditDate, String auditIdea, String code) {
		super();
		this.id = id;
		this.ownerUsr = ownerUsr;
		this.creater = creater;
		this.createTime = createTime;
		this.updater = updater;
		this.updateTime = updateTime;
		this.remark = remark;
		this.cId = cId;
		this.cName = cName;
		this.cType = cType;
		this.payer = payer;
		this.payDate = payDate;
		this.payType = payType;
		this.billCode = billCode;
		this.handler = handler;
		this.total = total;
		this.statusid = statusid;
		this.status = status;
		this.auditor = auditor;
		this.auditDate = auditDate;
		this.auditIdea = auditIdea;
		this.code = code;
	}
	@Override
	public String toString() {
		return "SaleCollection [id=" + id + ", ownerUsr=" + ownerUsr
				+ ", creater=" + creater + ", createTime=" + createTime
				+ ", updater=" + updater + ", updateTime=" + updateTime
				+ ", remark=" + remark + ", cId=" + cId + ", cName=" + cName
				+ ", cType=" + cType + ", payer=" + payer + ", payDate="
				+ payDate + ", payType=" + payType + ", billCode=" + billCode
				+ ", handler=" + handler + ", total=" + total + ", statusid="
				+ statusid + ", status=" + status + ", auditor=" + auditor
				+ ", auditDate=" + auditDate + ", auditIdea=" + auditIdea
				+ ", code=" + code + "]";
	}
}