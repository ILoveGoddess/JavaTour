package com.zrkc.syyh.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.InspectionGroup;
import com.zrkc.syyh.model.RepairViewModel;
import com.zrkc.syyh.service.IInspectionGroupService;
import com.zrkc.syyh.service.IXjService;
import com.zrkc.syyh.service.impl.InspectionGroupServiceImpl;
import com.zrkc.syyh.service.impl.XjServiceImpl;

public class XjController {
	IXjService xjService = new XjServiceImpl();
	IInspectionGroupService groupService = new InspectionGroupServiceImpl();
	public void xjlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<RepairViewModel> list = xjService.getAllRepairView();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/jsp/xj/xjlogin.jsp").forward(request, response);
	}
	public void xjfpxz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String repairId = request.getParameter("repairId");
		RepairViewModel repair = xjService.getRepairById(Long.parseLong(repairId));
		request.setAttribute("repair", repair);
		List<InspectionGroup> list = groupService.getAllGroup();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/jsp/xj/xjfpxz2.jsp").forward(request, response);
	}
	public void xjupdategroup(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String repairId = request.getParameter("po.repairid");
		String groupId = request.getParameter("group");
		xjService.updateGroup(Long.parseLong(repairId),Long.parseLong(groupId));
		response.sendRedirect("xjlist.do");
	}
	public void xjsbbx(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curpageStr = request.getParameter("curpage");
		Pageinfo<RepairViewModel> pageinfo = xjService.getAllRepair(curpageStr);
		request.setAttribute("pageinfo", pageinfo);
		request.getRequestDispatcher("/jsp/xj/xjlist.jsp").forward(request, response);
	}

}
