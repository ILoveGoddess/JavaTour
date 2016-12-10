package com.zrkc.syyh.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.InspectionWorker;
import com.zrkc.syyh.service.IInspectionWorkerService;
import com.zrkc.syyh.service.impl.InspectionWorkerServiceImpl;

public class InspectionWorkerController {
	IInspectionWorkerService inspectionWorkerService = new InspectionWorkerServiceImpl();
	public void inspectionWorkerList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curpageStr = request.getParameter("curpage");
		Pageinfo<InspectionWorker> pageinfo = inspectionWorkerService.inspectionWorkerList(curpageStr);
		request.setAttribute("pageinfo", pageinfo);
		request.getRequestDispatcher("/jsp/inspectionWorker/inspectionWorker.jsp").forward(request, response);
	}
	public void toAddWorker(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/jsp/inspectionWorker/inspectionWorkerNew.jsp").forward(request, response);
	}
	public void addWoker(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String workerName = request.getParameter("piwoker.workerName");
		String workerTel1 = request.getParameter("piwoker.workerTel1");
		String workerTel2 = request.getParameter("piwoker.workerTel2");
		InspectionWorker worker = new InspectionWorker(0, 0, workerName, workerTel1, workerTel2);
		inspectionWorkerService.addWorker(worker);
		response.sendRedirect("inspectionWorkerList.do");
	}
	public void toUpdateWorker(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String workerId = request.getParameter("workerId");
		InspectionWorker worker = inspectionWorkerService.getWorkerById(Long.parseLong(workerId));
		request.setAttribute("worker", worker);
		request.getRequestDispatcher("/jsp/inspectionWorker/inspectionWokerUpdate.jsp").forward(request, response);
	}
	public void updateWorker(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String workerId = request.getParameter("piwoker.wokerId");
		String workerName = request.getParameter("piwoker.workerName");
		String workerTel1 = request.getParameter("piwoker.workerTel1");
		String workerTel2 = request.getParameter("piwoker.workerTel2");
		InspectionWorker worker = new InspectionWorker(Long.parseLong(workerId), 0, workerName, workerTel1, workerTel2);
		inspectionWorkerService.updateWorker(worker);
		response.sendRedirect("inspectionWorkerList.do");
	}
	public void deleteWorker(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String workerId = request.getParameter("workerId");
		inspectionWorkerService.deleteWorker(workerId);
		response.sendRedirect("inspectionWorkerList.do");
		
	}

}
