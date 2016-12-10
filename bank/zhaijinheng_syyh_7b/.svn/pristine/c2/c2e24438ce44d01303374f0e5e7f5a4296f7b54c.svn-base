package com.zrkc.syyh.dao;

import java.util.List;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.RepairViewModel;
import com.zrkc.syyh.model.Repairtype;

public interface IWxgDao {

	int getTotalCount();

	List<RepairViewModel> repairList(Pageinfo<RepairViewModel> pageinfo);

	RepairViewModel getRepairById(long repairId);

	List<Repairtype> getAllRepairType();

	void updateStatusTo2(RepairViewModel repair);

}
