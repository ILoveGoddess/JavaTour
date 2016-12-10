package com.crm.service;

import java.util.List;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.QueryJurisdiction;

public interface IQueryJurisdictionService {

	public DataModel<QueryJurisdiction> findList(Pager pager);

	public List<QueryJurisdiction> findAllQueryJurisdiction();

	public void addQueryJurisdiction(QueryJurisdiction queryJurisdiction);

	public void deleteQueryJurisdiction(int[] accessGroup_id);

}
