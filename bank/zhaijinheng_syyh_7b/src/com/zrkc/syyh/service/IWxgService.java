package com.zrkc.syyh.service;

import java.util.List;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.RepairViewModel;
import com.zrkc.syyh.model.Repairtype;

public interface IWxgService {

	public Pageinfo<RepairViewModel> getAllRepair(String curpageStr);

	public RepairViewModel getRepairById(long parseLong);

	public List<Repairtype> getAllRepairType();

	public void updateStatusTo2(RepairViewModel repair);

}
