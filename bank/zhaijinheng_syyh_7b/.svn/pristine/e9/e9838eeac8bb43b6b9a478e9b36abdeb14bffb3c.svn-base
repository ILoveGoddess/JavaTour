package com.zrkc.syyh.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.zrkc.syyh.model.Function;
import com.zrkc.syyh.model.FunctionModel;
import com.zrkc.syyh.model.GwymModel;
import com.zrkc.syyh.model.Job;
import com.zrkc.syyh.model.JobModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.XtymbModel;
import com.zrkc.syyh.service.IJobService;
import com.zrkc.syyh.service.impl.JobServiceImpl;

public class JobController {
	IJobService jobService = new JobServiceImpl();
	
	public void jobList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curpageStr = request.getParameter("curpage");
		Pageinfo<JobModel> pageinfo = jobService.jobList(curpageStr);
		request.setAttribute("pageinfo", pageinfo);
		
		request.getRequestDispatcher("/jsp/job/joblist.jsp").forward(request, response);
	}

	public void showJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jobIdStr = request.getParameter("jobId");
		String curpageStr = request.getParameter("curpage");
		Pageinfo<GwymModel> pageinfo = jobService.gwymList(jobIdStr,curpageStr);
		request.setAttribute("pageinfo", pageinfo);
		request.getRequestDispatcher("/jsp/job/showxtym.jsp").forward(request, response);
	}

	public void toAddJob(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/jsp/job/jobnew.jsp").forward(request, response);
	}

	public void addJob(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("job.name");
		String description = request.getParameter("job.description");
		//String gwxz = request.getParameter("gwxz");
		Job job = new Job();
		job.setName(name);
		job.setDescription(description);
		jobService.insertJob(job);
		response.sendRedirect("jobList.do");
	}

	public void toUpdateJob(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String jobIdStr = request.getParameter("jobId");
		Job job = jobService.getJobById(Long.parseLong(jobIdStr));
		request.setAttribute("job", job);
		request.getRequestDispatcher("/jsp/job/jobupdate.jsp").forward(request, response);
	}

	public void updateJob(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String jobIdStr = request.getParameter("jobId");
		String name = request.getParameter("job.name");
		String description = request.getParameter("job.description");
		Job job = new Job();
		job.setJobId(Long.parseLong(jobIdStr));
		job.setName(name);
		job.setDescription(description);
		jobService.updateJob(job);
		response.sendRedirect("jobList.do");
	}

	public void toManageFunc(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String jobIdStr = request.getParameter("jobId");
		List<FunctionModel> list = jobService.getAllFunc(Long.parseLong(jobIdStr));
		request.setAttribute("list", list);
		request.setAttribute("jobId", jobIdStr);
		request.getRequestDispatcher("/jsp/job/functionlist.jsp").forward(request, response);
	}

	public void toSetPow(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String funcIdStr = request.getParameter("funcId");
		String jobIdStr = request.getParameter("jobId");
		String funcName = jobService.getFuncName(Long.parseLong(funcIdStr));
		request.setAttribute("funcName", funcName);
		request.setAttribute("jobId", jobIdStr);
		request.setAttribute("funcId", funcIdStr);
		List<XtymbModel> list = jobService.getAllXtym(Long.parseLong(funcIdStr),Long.parseLong(jobIdStr));
		request.setAttribute("list", list);
		request.getRequestDispatcher("/jsp/job/xtym.jsp").forward(request, response);
	}

	public void changePow(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String jobIdStr = request.getParameter("jobId");
		String funcIdStr = request.getParameter("funcId");
		jobService.deleteAllGwym(Long.parseLong(jobIdStr),Long.parseLong(funcIdStr));
		String[] values = request.getParameterValues("ymbhs");
		jobService.addGwym(jobIdStr,values);
		response.sendRedirect("jobList.do");
	}

	public void jobdelete(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String jobId = request.getParameter("jobId");
		jobService.deleteJob(Long.parseLong(jobId));
		response.sendRedirect("jobList.do");
	}

}
