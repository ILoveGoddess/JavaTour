package com.zrkc.syyh.service.impl;

import java.util.List;

import com.zrkc.syyh.dao.IGroupDao;
import com.zrkc.syyh.dao.impl.GroupDaoImpl;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.InspectionWorker;
import com.zrkc.syyh.model.InspectionGroup;
import com.zrkc.syyh.model.InspectionGroupModel;
import com.zrkc.syyh.service.IInspectionGroupService;

public class InspectionGroupServiceImpl implements IInspectionGroupService{
	IGroupDao groupDao = new GroupDaoImpl();
	
	public static void main(String[] args) {
		InspectionGroupServiceImpl g = new InspectionGroupServiceImpl();
		//System.out.println(g.groupList("1").getPagedata());
	}
	
	public Pageinfo<InspectionGroupModel> groupList(String curpageStr) {
		int curpage = 1;
		if(curpageStr != null && curpageStr != ""){
			curpage = Integer.parseInt(curpageStr);
		}
		Pageinfo<InspectionGroupModel> pageinfo = new Pageinfo<InspectionGroupModel>();	
		pageinfo.setCurpage(curpage);
		List<InspectionGroupModel> list = groupDao.groupList(pageinfo);
		pageinfo.setPagedata(list);
		int totalCount = groupDao.getTotalCount();
		pageinfo.setTotalRecord(totalCount);
		pageinfo.setPageSize(pageinfo.getPageSize());
		return pageinfo;
	}

	public List<InspectionWorker> getAllWorker() {
		return groupDao.getAllWorker();
	}

	public long addGroup(String groupName) {
		return groupDao.addGroup(groupName);
	}

	public void updateWorkerGroup(String[] values, long groupId) {
		groupDao.updateWorkerGroup(values,groupId);
	}

	public InspectionGroup getGroupById(long groupId) {
		return groupDao.getGroupById(groupId);
	}

	public void updateGroup(InspectionGroup group) {
		groupDao.updateGroup(group);
	}

	public List<InspectionGroup> getAllGroup() {
		return groupDao.getAllGroup();
	}

	public List<InspectionWorker> getAllWorker(String groupId) {
		return groupDao.getAllWorker(groupId);
	}

	public void changeWorkerGroup(String groupId, String[] workerIds) {
		groupDao.changeWorkerGroup(groupId, workerIds);
	}
}
