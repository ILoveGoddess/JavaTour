package com.zrkc.syyh.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.EquipmentTypeModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.service.IEquTypeService;
import com.zrkc.syyh.service.impl.EquTypeServiceImpl;

public  class EquTypeController {
	IEquTypeService equTypeService = new EquTypeServiceImpl();
	public void equipmentTypeList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String curpageStr = request.getParameter("curpage");
		Pageinfo<EquipmentTypeModel> pageinfo = equTypeService.getAllEquipmentType(curpageStr);
		request.setAttribute("pageinfo", pageinfo);
		request.getRequestDispatcher("/jsp/equipmentType/equipmentType.jsp").forward(request, response);
	}
	public void deleteEqu(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String equipmentId = request.getParameter("equipmentId");
		equTypeService.deleteEquById(equipmentId);
		response.sendRedirect("equipmentTypeList.do");
	}
	public void toUpdateEqu(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String equipmentId = request.getParameter("equipmentId");
		String equipmentName = request.getParameter("equipmentName");
		request.setAttribute("equipmentId", equipmentId);
		request.setAttribute("equipmentName", equipmentName);
		request.getRequestDispatcher("/jsp/equipmentType/equipmentTypeupdate.jsp").forward(request, response);
	}
	public void updateEqu(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String equipmentId = request.getParameter("equipmenttype.equipmentId");
		String equipmentName =  request.getParameter("equipmenttype.equipmentName");
		equTypeService.updateEqu(equipmentId,equipmentName);
		response.sendRedirect("equipmentTypeList.do");
	}
	public void toAddEqu(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/jsp/equipmentType/equipmentTypenew.jsp").forward(request, response);
	}
	public void addEqu(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String equipmentId = request.getParameter("equipmenttype.equipmentId");
		String equipmentName = request.getParameter("equipmenttype.equipmentName");
		EquipmentType equ = new EquipmentType();
		equ.setEquipmentId(equipmentId);
		equ.setEquipmentName(equipmentName);
		equTypeService.addEqu(equ);
		response.sendRedirect("equipmentTypeList.do");
		
	}

}
