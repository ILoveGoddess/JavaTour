package com.zrkc.syyh.dao;

import java.util.List;

import com.zrkc.syyh.model.Department;
import com.zrkc.syyh.model.DeptModel;
import com.zrkc.syyh.model.Pageinfo;

public interface IDeptDao {

	List<DeptModel> deptList(Pageinfo<DeptModel> pageinfo );

	int getTotalCount();

	void deleteDept(long deptId);

	Department selectDeptById(String departmentId);

	void updateDept(Department parseLong);

	void insertDept(String deptName);

}
