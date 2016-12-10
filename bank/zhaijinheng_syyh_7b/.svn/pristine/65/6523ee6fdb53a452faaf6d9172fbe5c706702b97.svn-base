package com.zrkc.syyh.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.Repair;
import com.zrkc.syyh.model.RepairModel;
import com.zrkc.syyh.model.RepairSearch;
import com.zrkc.syyh.model.RepairViewModel;
import com.zrkc.syyh.model.User;

import com.zrkc.syyh.service.IWdService;
import com.zrkc.syyh.service.impl.EquTypeServiceImpl;
import com.zrkc.syyh.service.impl.WdServiceImpl;
import com.zrkc.syyh.utils.DateUtils;

public class WdController {
	IWdService wdService = new WdServiceImpl();
	public void wdsbbxList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String curpageStr = request.getParameter("curpage");
		String repairStatus = request.getParameter("rs");
		String allocateStatus = request.getParameter("as");
		String repairfrom = request.getParameter("repairfrom");
		String repairend = request.getParameter("repairend");
		String endfrom = request.getParameter("endfrom");
		String endend = request.getParameter("endend");
		RepairSearch repairSearch = null;
		if(repairfrom !=null && repairend != null && endfrom != null && endend!= null){
		repairSearch = new RepairSearch(repairStatus, allocateStatus,
		DateUtils.strToDate(DateUtils.YYMMDD, repairfrom), DateUtils.strToDate(DateUtils.YYMMDD, 
				repairend),DateUtils.strToDate(DateUtils.YYMMDD, endfrom) ,
		DateUtils.strToDate(DateUtils.YYMMDD, endend));
		}
		Pageinfo<RepairModel> pageinfo = wdService.repairList(curpageStr,repairSearch);
		request.setAttribute("pageinfo", pageinfo);
		request.getRequestDispatcher("/jsp/wd/wdlist.jsp").forward(request, response);
	}
	public void sbbxview(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String repairId = request.getParameter("repairId");
		RepairViewModel view = wdService.getRepairView(Long.parseLong(repairId));
		request.setAttribute("view", view);
		request.getRequestDispatcher("/jsp/wd/sbbxview.jsp").forward(request, response);
	}
	public void wdsure(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String repairId = request.getParameter("repairId");
		String curpageStr = request.getParameter("curpage");
		wdService.updateRepairStatus(Long.parseLong(repairId));
		request.getRequestDispatcher("wdlist.do?curpage="+curpageStr).forward(request, response);
		
	}
	public void towdupdate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String repairId = request.getParameter("repairId");
		RepairViewModel rvm = wdService.getRepairView(Long.parseLong(repairId));
		request.setAttribute("rvm",rvm);
		String curpageStr = request.getParameter("curpage");
		request.setAttribute("curpage",curpageStr);
		List<EquipmentType> list = wdService.getAllEquipmentType();
		request.setAttribute("equTypes", list);
		List<String> list2 = wdService.getAllEachId();
		request.setAttribute("eachIds", list2);
		request.getRequestDispatcher("/jsp/wd/wdupdate.jsp").forward(request, response);
	}
	public void wdupdate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String repairId = request.getParameter("po.repairid");
		String curpageStr = request.getParameter("pageinfo.curpage");
		String equipmentId = request.getParameter("po.equipmenttype.equipmentId");
		String equipmentEachId = request.getParameter("po.bankEquipment.equipmenteachId");
		Repair repair = new Repair();
		repair.setRepairId(Long.parseLong(repairId));
		repair.setEquipmentId(equipmentId);
		repair.setEquipmentEachId(equipmentEachId);
		wdService.updateRepair(repair);
		request.getRequestDispatcher("wdlist.do?curpage="+curpageStr).forward(request, response);
	}
	public void towdaddrepair(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<EquipmentType> list = wdService.getAllEquipmentType();
		request.setAttribute("equTypes", list);
		List<String> list2 = wdService.getAllEachId();
		request.setAttribute("eachIds", list2);
		//User user = (User)request.getSession().getAttribute("user");
		
		request.getRequestDispatcher("/jsp/wd/wdsave.jsp").forward(request, response);
	}
	public void wdaddrepair(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String loginId = request.getParameter("po.users.loginId");
		//String equipmentId = request.getParameter("po.equipmenttype.equipmentId");
		String equipmentEachId = request.getParameter("po.bankEquipment.equipmenteachId");
		String bankId = wdService.selectBankId(equipmentEachId);
		String equipmentId = wdService.selectEquId(equipmentEachId);
		Date date = new Date();
		Repair repair = new Repair();
		repair.setLoginId(loginId);
		repair.setEquipmentId(equipmentId);
		repair.setEquipmentEachId(equipmentEachId);
		repair.setBankId(bankId);
		repair.setRepairDate(date);
		wdService.insertRepair(repair);
		response.sendRedirect("wdlist.do");
	}
	public void wddeleterepair(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String repairId = request.getParameter("repairId");
		String curpageStr = request.getParameter("curpage");
		wdService.deleteRepair(Long.parseLong(repairId));	
		response.sendRedirect("wdlist.do?curpage="+curpageStr);
	}
	public void exportExcel(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		List<RepairModel> list = wdService.getAllRepairModel();
		wdService.exportExcel(list,response);
	}
	public void wdbxqr(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<RepairModel> list = wdService.getAllRepairModel();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/jsp/wd/wdlogin.jsp").forward(request, response);
	}
	public void wdSureNeedRepair(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String repairId = request.getParameter("repairId");
		wdService.updateRepairStatusTo3(Long.parseLong(repairId));
		response.sendRedirect("wdbxqr.do");
		
	}

}
