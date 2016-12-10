package com.zrkc.syyh.model;

public class InspectionGroup {
	private long groupId;
	private String groupName;
	public long getGroupId() {
		return groupId;
	}
	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public InspectionGroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InspectionGroup(long groupId, String groupName) {
		super();
		this.groupId = groupId;
		this.groupName = groupName;
	}
	@Override
	public String toString() {
		return "Pigroup [groupId=" + groupId + ", groupName=" + groupName + "]";
	}
	
}
