package com.zrkc.syyh.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrkc.syyh.model.Department;
import com.zrkc.syyh.model.DeptModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.service.IDeptService;
import com.zrkc.syyh.service.impl.DeptServiceImpl;

public class DeptController {
	IDeptService deptService = new DeptServiceImpl(); 
	public void deptList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String curpageStr = request.getParameter("curpage");
		Pageinfo<DeptModel> pageinfo = deptService.deptList(curpageStr);
		request.setAttribute("pageinfo", pageinfo);
		
		request.getRequestDispatcher("/jsp/dept/deptlist.jsp").forward(request, response);
	}
	public void deleteDept(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String departmentId = request.getParameter("departmentId");
		deptService.deleteDept(Long.parseLong(departmentId));
		response.sendRedirect("deptList.do");
	}
	public void toUpdateDept(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String departmentId = request.getParameter("departmentId");
		Department dept = deptService.selectDeptById(departmentId);
		request.setAttribute("dept", dept);
		request.getRequestDispatcher("/jsp/dept/deptupdate.jsp").forward(request, response);
	}
	public void updateDept(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String departmentId = request.getParameter("dept.departmentId");
		String departmentName = request.getParameter("dept.departmentName");
		Department dept = new Department();
		dept.setDepartmentId(Long.parseLong(departmentId));
		dept.setDepartmentName(departmentName);
		deptService.updateDept(dept);
		
		response.sendRedirect("deptList.do");
	}
	public void toAddDept(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/jsp/dept/deptnew.jsp").forward(request, response);
	}
	public void addDept(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String deptName = request.getParameter("dept.departmentName");
		deptService.insertDept(deptName);
		
		response.sendRedirect("deptList.do");
	}

	
}
