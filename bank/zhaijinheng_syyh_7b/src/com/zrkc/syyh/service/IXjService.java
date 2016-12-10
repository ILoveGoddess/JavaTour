package com.zrkc.syyh.service;

import java.util.List;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.RepairViewModel;

public interface IXjService {

	public List<RepairViewModel> getAllRepairView();

	public RepairViewModel getRepairById(long parseLong);

	public void updateGroup(long parseLong, long parseLong2);

	public Pageinfo<RepairViewModel> getAllRepair(String curpageStr);

}
