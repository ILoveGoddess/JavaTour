package com.zrkc.syyh.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.RepairViewModel;
import com.zrkc.syyh.model.Repairtype;
import com.zrkc.syyh.service.IRepairtypeService;
import com.zrkc.syyh.service.IWxgService;

import com.zrkc.syyh.service.impl.WxgServiceImpl;

public class WxgController {
	IWxgService wxgService = new WxgServiceImpl();
//	IRepairtypeService repairtypeService = new RepairtypeServiceImpl();
	public void xjlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curpageStr = request.getParameter("curpage");
		Pageinfo<RepairViewModel> pageinfo = wxgService.getAllRepair(curpageStr);
		RepairViewModel repair = pageinfo.getPagedata().get(0);
		request.setAttribute("repair", repair);
		request.getRequestDispatcher("/jsp/wxg/glogin.jsp").forward(request, response);
	}
	public void getMoreRepair(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String curpageStr = request.getParameter("curpage");
		Pageinfo<RepairViewModel> pageinfo = wxgService.getAllRepair(curpageStr);
		request.setAttribute("pageinfo", pageinfo);
		request.getRequestDispatcher("/jsp/wxg/glist.jsp").forward(request, response);
	}
	public void wxgrepair(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String repairId = request.getParameter("repairId");
		RepairViewModel repair = wxgService.getRepairById(Long.parseLong(repairId));
		request.setAttribute("repair", repair);
		List<Repairtype> list = wxgService.getAllRepairType();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/jsp/wxg/gwx1.jsp").forward(request, response);
	}
	public void repairOver(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String repairId = request.getParameter("po.repairid");
		String repairTypeId = request.getParameter("repairType");
		String repairEvaluation = request.getParameter("po.faultRepairEvaluation");
		RepairViewModel repair = new RepairViewModel();
		repair.setRepairId(Long.parseLong(repairId));
		repair.setTypeId(Long.parseLong(repairTypeId));
		repair.setRepairEvaluation(repairEvaluation);
		wxgService.updateStatusTo2(repair);
		response.sendRedirect("getMoreRepair.do");
	}
	public void addnewType(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String repairId = request.getParameter("repairId");
		request.setAttribute("repairId", repairId);
		request.getRequestDispatcher("/jsp/wxg/wtlxsave.jsp").forward(request, response);
	}
	public void insertType(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String typeName = request.getParameter("wtlxmc");
//		repairtypeService.addRepairtype(typeName);
		String repairId = request.getParameter("po.repairid");
		request.getRequestDispatcher("wxgrepair.do?repairId="+repairId).forward(request, response);
	}

}
