package com.zrkc.syyh.dao;

import java.util.List;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.InspectionWorker;
import com.zrkc.syyh.model.InspectionGroup;
import com.zrkc.syyh.model.InspectionGroupModel;

public interface IGroupDao {

	List<InspectionGroupModel> groupList(Pageinfo<InspectionGroupModel> pageinfo);

	int getTotalCount();

	List<InspectionWorker> getAllWorker();

	long addGroup(String groupName);

	void updateWorkerGroup(String[] values, long groupId);

	InspectionGroup getGroupById(long groupId);

	void updateGroup(InspectionGroup group);

	List<InspectionGroup> getAllGroup();

	List<InspectionWorker> getAllWorker(String groupId);

	void changeWorkerGroup(String groupId, String[] workerIds);

}
