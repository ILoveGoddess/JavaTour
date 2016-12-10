package com.zrkc.syyh.service;

import java.util.List;

import com.zrkc.syyh.model.FunctionModel;
import com.zrkc.syyh.model.GwymModel;
import com.zrkc.syyh.model.Job;
import com.zrkc.syyh.model.JobModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.XtymbModel;

public interface IJobService {

	public Pageinfo<JobModel> jobList(String curpageStr);

	public Pageinfo<GwymModel> gwymList(String jobIdStr,String curpageStr);

	public void insertJob(Job job);

	public Job getJobById(long parseLong);

	public void updateJob(Job job);

	public List<FunctionModel> getAllFunc(long parseLong);

	public List<XtymbModel> getAllXtym(long parseLong, long parseLong2);

	public String getFuncName(long parseLong);

	public void deleteAllGwym(long parseLong, long parseLong2);

	public void addGwym(String jobIdStr, String[] values);

	public void deleteJob(long parseLong);

}
