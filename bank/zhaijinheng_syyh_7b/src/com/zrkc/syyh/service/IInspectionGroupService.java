package com.zrkc.syyh.service;

import java.util.List;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.InspectionWorker;
import com.zrkc.syyh.model.InspectionGroup;
import com.zrkc.syyh.model.InspectionGroupModel;

public interface IInspectionGroupService {

	public Pageinfo<InspectionGroupModel> groupList(String curpageStr);

	public List<InspectionWorker> getAllWorker();

	public long addGroup(String groupName);

	public void updateWorkerGroup(String[] values, long groupId);

	public InspectionGroup getGroupById(long parseLong);

	public void updateGroup(InspectionGroup group);

	public List<InspectionGroup> getAllGroup();

	public List<InspectionWorker> getAllWorker(String groupId);

	public void changeWorkerGroup(String groupId, String[] workerIds);

}
