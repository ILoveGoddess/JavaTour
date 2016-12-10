package com.zrkc.syyh.model;

import java.util.Date;

public class RepairSearch {
	private String repairStatus;
	private String allocateStatus;
	private Date repairfrom;
	private Date repairend;
	private Date endfrom;
	private Date endend;
	public String getRepairStatus() {
		return repairStatus;
	}
	public void setRepairStatus(String repairStatus) {
		this.repairStatus = repairStatus;
	}
	public String getAllocateStatus() {
		return allocateStatus;
	}
	public void setAllocateStatus(String allocateStatus) {
		this.allocateStatus = allocateStatus;
	}
	public Date getRepairfrom() {
		return repairfrom;
	}
	public void setRepairfrom(Date repairfrom) {
		this.repairfrom = repairfrom;
	}
	public Date getRepairend() {
		return repairend;
	}
	public void setRepairend(Date repairend) {
		this.repairend = repairend;
	}
	public Date getEndfrom() {
		return endfrom;
	}
	public void setEndfrom(Date endfrom) {
		this.endfrom = endfrom;
	}
	public Date getEndend() {
		return endend;
	}
	public void setEndend(Date endend) {
		this.endend = endend;
	}
	@Override
	public String toString() {
		return "RepairSearch [allocateStatus=" + allocateStatus + ", endend="
				+ endend + ", endfrom=" + endfrom + ", repairStatus="
				+ repairStatus + ", repairend=" + repairend + ", repairfrom="
				+ repairfrom + "]";
	}
	public RepairSearch(String repairStatus, String allocateStatus,
			Date repairfrom, Date repairend, Date endfrom, Date endend) {
		super();
		this.repairStatus = repairStatus;
		this.allocateStatus = allocateStatus;
		this.repairfrom = repairfrom;
		this.repairend = repairend;
		this.endfrom = endfrom;
		this.endend = endend;
	}
	public RepairSearch() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
