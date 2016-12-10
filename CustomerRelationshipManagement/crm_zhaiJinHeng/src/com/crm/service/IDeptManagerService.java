package com.crm.service;

import java.util.List;

import com.crm.model.DataModel;
import com.crm.model.DeptManager;
import com.crm.model.Pager;

public interface IDeptManagerService {

	public DataModel<DeptManager> findList(Pager pager);

	public List<DeptManager> findAllDeptManager();

	public String getStr();

	public void addDeptManager(DeptManager deptManager);

	public void deleteDeptManager(int[] userGroup_id);

}
