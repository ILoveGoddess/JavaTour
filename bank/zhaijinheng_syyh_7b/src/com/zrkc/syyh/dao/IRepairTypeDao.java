package com.zrkc.syyh.dao;

import java.util.List;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.Repairtype;
import com.zrkc.syyh.model.RepairtypeModel;

public interface IRepairTypeDao {

	int getTotalCount();

	List<RepairtypeModel> repairtypeList(Pageinfo<RepairtypeModel> pageinfo);

	void addRepairtype(String typeValue);

	Repairtype geType(long typeId);

	void updateType(Repairtype type);

	void deleteType(long typeId);

}
