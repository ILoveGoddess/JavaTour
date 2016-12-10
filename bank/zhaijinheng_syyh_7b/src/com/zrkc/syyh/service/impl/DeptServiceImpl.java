package com.zrkc.syyh.service.impl;

import java.util.List;

import com.zrkc.syyh.model.Department;
import com.zrkc.syyh.model.DeptModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.service.IDeptService;

public class DeptServiceImpl implements IDeptService{
	
	public static void main(String[] args) {
		DeptServiceImpl d = new DeptServiceImpl();
		//System.out.println(d.deptList("1"));
	}
	
	public Pageinfo<DeptModel> deptList(String curpageStr) {
		int curpage = 1;
		if(curpageStr != null && curpageStr != ""){
			curpage = Integer.parseInt(curpageStr);
		}
		Pageinfo<DeptModel> pageinfo = new Pageinfo<DeptModel>();	
		pageinfo.setCurpage(curpage);
		List<DeptModel> list = deptDao.deptList(pageinfo);
		pageinfo.setPagedata(list);
		int totalCount = deptDao.getTotalCount();
		pageinfo.setTotalRecord(totalCount);
		pageinfo.setPageSize(pageinfo.getPageSize());
		return pageinfo;
	}

	public void deleteDept(long deptId) {
		deptDao.deleteDept(deptId);
	}

	public Department selectDeptById(String departmentId) {
		return deptDao.selectDeptById(departmentId);
	}

	public void updateDept(Department parseLong) {
		deptDao.updateDept(parseLong);
	}

	public void insertDept(String deptName) {
		deptDao.insertDept(deptName);
	}
}
