package com.zrkc.syyh.service.impl;

import java.util.List;

import com.zrkc.syyh.dao.InspectionWorkerDao;
import com.zrkc.syyh.dao.impl.InspectionWorkerDaoImpl;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.InspectionWorker;
import com.zrkc.syyh.service.IInspectionWorkerService;

public class InspectionWorkerServiceImpl implements IInspectionWorkerService{
	InspectionWorkerDao inspectionWorkerDao = new InspectionWorkerDaoImpl();
	
	public static void main(String[] args) {
		InspectionWorkerServiceImpl p = new InspectionWorkerServiceImpl();
		//System.out.println(p.piWorkerList("1").getPagedata());
	}
	
	public Pageinfo<InspectionWorker> inspectionWorkerList(String curpageStr) {
		int curpage = 1;
		if(curpageStr != null && curpageStr != ""){
			curpage = Integer.parseInt(curpageStr);
		}
		Pageinfo<InspectionWorker> pageinfo = new Pageinfo<InspectionWorker>();	
		pageinfo.setCurpage(curpage);
		List<InspectionWorker> list = inspectionWorkerDao.piWorkerList(pageinfo);
		pageinfo.setPagedata(list);
		int totalCount = inspectionWorkerDao.getTotalCount();
		pageinfo.setTotalRecord(totalCount);
		pageinfo.setPageSize(pageinfo.getPageSize());
		return pageinfo;
	}

	public void addWorker(InspectionWorker worker) {
		inspectionWorkerDao.addWorker(worker);
	}

	public InspectionWorker getWorkerById(long workerId) {
		return inspectionWorkerDao.getWorkerById(workerId);
	}

	public void updateWorker(InspectionWorker worker) {
		inspectionWorkerDao.updateWorker(worker);
	}

	public void deleteWorker(String workerId) {
		inspectionWorkerDao.deleteWorker(workerId);
	}
}
