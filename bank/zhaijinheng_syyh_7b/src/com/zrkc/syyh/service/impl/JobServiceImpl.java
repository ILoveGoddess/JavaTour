package com.zrkc.syyh.service.impl;

import java.util.List;

import com.zrkc.syyh.dao.IJobDao;
import com.zrkc.syyh.dao.impl.JobDaoImpl;
import com.zrkc.syyh.model.EquipmentTypeModel;
import com.zrkc.syyh.model.FunctionModel;
import com.zrkc.syyh.model.GwymModel;
import com.zrkc.syyh.model.Job;
import com.zrkc.syyh.model.JobModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.XtymbModel;
import com.zrkc.syyh.service.IJobService;

public class JobServiceImpl implements IJobService{
	IJobDao jobDao = new JobDaoImpl();
	public static void main(String[] args) {
		JobServiceImpl j = new JobServiceImpl();
		//System.out.println(j.gwymList("1","1" ).getPagedata().size());
	}
	public Pageinfo<JobModel> jobList(String curpageStr) {
		int curpage = 1;
		if(curpageStr != null && curpageStr != ""){
			curpage = Integer.parseInt(curpageStr);
		}
		Pageinfo<JobModel> pageinfo = new Pageinfo<JobModel>();
		pageinfo.setCurpage(curpage);
		List<JobModel> list = jobDao.getAllJob(pageinfo);
		pageinfo.setPagedata(list);
		int totalRecord = jobDao.getTotalRecord();
		pageinfo.setTotalRecord(totalRecord);
		pageinfo.setPageSize(pageinfo.getPageSize());
		return pageinfo;
		
	}
	public Pageinfo<GwymModel> gwymList(String jobIdStr, String curpageStr) {
		int curpage = 1;
		if(curpageStr != null && curpageStr != ""){
			curpage = Integer.parseInt(curpageStr);
		}
		Pageinfo<GwymModel> pageinfo = new Pageinfo<GwymModel>();
		pageinfo.setCurpage(curpage);
		int totalRecord = jobDao.getTotalXtymb(jobIdStr);
		pageinfo.setTotalRecord(totalRecord);
		pageinfo.setPageSize(pageinfo.getPageSize());
		List<GwymModel> list = jobDao.getAllGwym(jobIdStr,pageinfo);
		pageinfo.setPagedata(list);
		
		return pageinfo;
	}
	public void insertJob(Job job) {
		jobDao.insertJob(job);
	}
	public Job getJobById(long jobId) {
		return jobDao.getJobById(jobId);
	}
	public void updateJob(Job job) {
		jobDao.updateJob(job);
	}
	public List<FunctionModel> getAllFunc(long jobId) {
		return jobDao.getAllFunc(jobId);
	}
	public List<XtymbModel> getAllXtym(long funcId, long jobId) {
		return jobDao.getAllXtym(funcId,jobId);
	}
	public String getFuncName(long funcId) {
		return jobDao.getFuncName(funcId);
	}
	public void deleteAllGwym(long jobId, long funcId) {
		jobDao.deleteAllGwym(jobId,funcId);
	}
	public void addGwym(String jobIdStr, String[] values) {
		jobDao.addGwym(Long.parseLong(jobIdStr),values);
	}
	public void deleteJob(long jobId) {
		jobDao.deleteJob(jobId);
	}
}
