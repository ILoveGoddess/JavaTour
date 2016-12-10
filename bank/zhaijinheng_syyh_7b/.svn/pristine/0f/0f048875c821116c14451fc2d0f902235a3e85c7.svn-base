package com.zrkc.syyh.service;

import java.util.List;

import com.zrkc.syyh.dao.IDeptDao;
import com.zrkc.syyh.dao.impl.DeptDaoImpl;
import com.zrkc.syyh.model.Department;
import com.zrkc.syyh.model.DeptModel;
import com.zrkc.syyh.model.Pageinfo;

public interface IDeptService {
	IDeptDao deptDao = new DeptDaoImpl();

	public Pageinfo<DeptModel> deptList(String curpageStr);

	public void deleteDept(long parseLong);

	public Department selectDeptById(String departmentId);

	public void updateDept(Department dept);

	public void insertDept(String deptName);
	
	
}
