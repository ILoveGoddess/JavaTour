package com.zrkc.syyh.dao;

import java.util.List;

import com.zrkc.syyh.model.FunctionModel;
import com.zrkc.syyh.model.GwymModel;
import com.zrkc.syyh.model.Job;
import com.zrkc.syyh.model.JobModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.XtymbModel;

public interface IJobDao {

	List<JobModel> getAllJob(Pageinfo<JobModel> pageinfo);

	int getTotalRecord();

	List<GwymModel> getAllGwym(String jobIdStr, Pageinfo<GwymModel> pageinfo);

	int getTotalXtymb(String jobIdStr);

	void insertJob(Job job);

	Job getJobById(long jobId);

	void updateJob(Job job);

	List<FunctionModel> getAllFunc(long jobId);

	List<XtymbModel> getAllXtym(long funcId, long jobId);

	String getFuncName(long funcId);

	void deleteAllGwym(long jobId, long funcId);

	void addGwym(long parseLong, String[] values);

	void deleteJob(long jobId);

}
