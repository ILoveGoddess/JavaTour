package com.zrkc.syyh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.InspectionWorker;
import com.zrkc.syyh.model.InspectionGroup;
import com.zrkc.syyh.model.InspectionGroupModel;
import com.zrkc.syyh.service.IInspectionGroupService;
import com.zrkc.syyh.service.impl.InspectionGroupServiceImpl;



public class InspectionGroupController {
	IInspectionGroupService inspectionGroupService = new InspectionGroupServiceImpl();
	public void piGroupList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String curpageStr = request.getParameter("curpage");
		Pageinfo<InspectionGroupModel> pageinfo = inspectionGroupService.groupList(curpageStr);
		request.setAttribute("pageinfo", pageinfo);
		request.getRequestDispatcher("/jsp/inspectionGroup/inspectionGroup.jsp").forward(request, response);
	}
	public void toAddGroup(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<InspectionWorker> list = inspectionGroupService.getAllWorker();
		request.setAttribute("list", list);		
		request.getRequestDispatcher("/jsp/inspectionGroup/inspectionGroupNew.jsp").forward(request, response);
	}
	public void addPiGroup(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String groupName = request.getParameter("pigroup.groupName");
		String[] values = request.getParameterValues("sel2");
		System.out.println(values);
		long groupId = inspectionGroupService.addGroup(groupName);
		inspectionGroupService.updateWorkerGroup(values,groupId);
		
		response.sendRedirect("inspectionGroupList.do");
	}
	public void toUpdateGroup(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String groupId = request.getParameter("groupId");
		InspectionGroup group = inspectionGroupService.getGroupById(Long.parseLong(groupId));
		request.setAttribute("group", group);
		request.getRequestDispatcher("/jsp/inspectionGroup/inspectionGroupUpdate.jsp").forward(request, response);
	}
	public void updateGroup(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String groupId = request.getParameter("pigroup.groupId");
		String groupName = request.getParameter("pigroup.groupName");
		InspectionGroup group = new InspectionGroup(Long.parseLong(groupId), groupName);
		inspectionGroupService.updateGroup(group);
		response.sendRedirect("inspectionGroupList.do");
	}
	public void resetWorker(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String flag = request.getParameter("flag");
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		if("group".equals(flag)){
			List<InspectionGroup> groups = inspectionGroupService.getAllGroup();
			String json = gson.toJson(groups);		
			pw.write(json);
		}else if("worker".equals(flag)){
			//System.out.println(2);
			String groupId = request.getParameter("groupId");
			List<InspectionWorker> workers = inspectionGroupService.getAllWorker(groupId);
			String json = gson.toJson(workers);
			pw.write(json);
		}
	}
	public void changeWorkerGroup(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String groupId = request.getParameter("group");
		String[] workerIds = request.getParameterValues("sel2");
		inspectionGroupService.changeWorkerGroup(groupId,workerIds);
		response.sendRedirect("inspectionGroupList.do");
	}
	public void viewWorker(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String groupId = request.getParameter("groupId");
		InspectionGroup group = inspectionGroupService.getGroupById(Long.parseLong(groupId));
		request.setAttribute("group", group);
		List<InspectionWorker> list = inspectionGroupService.getAllWorker(groupId);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/jsp/inspectionGroup/viewInspectionWorker.jsp").forward(request, response);
	}
	
	

	
}
