package com.zrkc.syyh.model;

import java.util.Date;

import com.zrkc.syyh.utils.DateUtils;
/**
 * 日志
 * @author dz
 *
 */
public class Log  implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3806460216915811155L;
	private Long logId;//日志id
	private Date checkinTime;//登录时间
	private Date checkoutTime;//退出时间
	private String userId;//用户登录帐号
	
	public Log() {
	}
	
	
	public Long getLogId() {
		return logId;
	}
	public void setLogId(Long logId) {
		this.logId = logId;
	}
	public Date getCheckinTime() {
		return checkinTime;
	}
	public String getCheckinTimeStr() {
		
		return DateUtils.dateToStr(DateUtils.YYMMDD_HHmmss_24, checkinTime);
	}
	public void setCheckinTime(Date checkinTime) {
		this.checkinTime = checkinTime;
	}
	public Date getCheckoutTime() {
		return checkoutTime;
	}
	public String getCheckoutTimeStr() {
		return DateUtils.dateToStr(DateUtils.YYMMDD_HHmmss_24, checkoutTime);
	}
	public void setCheckoutTime(Date checkoutTime) {
		this.checkoutTime = checkoutTime;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}



}