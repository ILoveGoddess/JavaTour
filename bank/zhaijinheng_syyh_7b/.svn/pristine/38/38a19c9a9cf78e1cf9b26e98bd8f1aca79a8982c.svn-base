package com.zrkc.syyh.service.impl;

import java.util.List;

import com.zrkc.syyh.dao.IXjDao;
import com.zrkc.syyh.dao.impl.XjDaoImpl;
import com.zrkc.syyh.model.DeptModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.RepairViewModel;
import com.zrkc.syyh.service.IXjService;

public class XjServiceImpl implements IXjService{
	IXjDao xjDao = new XjDaoImpl();
	public List<RepairViewModel> getAllRepairView() {
		return xjDao.getAllRepairView();
	}
	public RepairViewModel getRepairById(long repairId) {
		return xjDao.getRepairById(repairId);
	}
	public void updateGroup(long repairId, long groupId) {
		xjDao.updateGroup(repairId,groupId);
	}
	public Pageinfo<RepairViewModel> getAllRepair(String curpageStr) {
		int curpage = 1;
		if(curpageStr != null && curpageStr != ""){
			curpage = Integer.parseInt(curpageStr);
		}
		Pageinfo<RepairViewModel> pageinfo = new Pageinfo<RepairViewModel>();	
		pageinfo.setCurpage(curpage);
		 List<RepairViewModel> list = xjDao.xjList(pageinfo);
		 pageinfo.setPagedata(list);
		 int totalCount = xjDao.getTotalCount();
		 pageinfo.setTotalRecord(totalCount);
		 pageinfo.setPageSize(pageinfo.getPageSize());
		 return pageinfo;
	}
}
