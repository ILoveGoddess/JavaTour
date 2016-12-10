package com.zrkc.syyh.dao;

import java.util.List;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.InspectionWorker;

public interface InspectionWorkerDao {

	int getTotalCount();

	List<InspectionWorker> piWorkerList(Pageinfo<InspectionWorker> pageinfo);

	void addWorker(InspectionWorker worker);

	InspectionWorker getWorkerById(long workerId);

	void updateWorker(InspectionWorker worker);

	void deleteWorker(String workerId);

}
