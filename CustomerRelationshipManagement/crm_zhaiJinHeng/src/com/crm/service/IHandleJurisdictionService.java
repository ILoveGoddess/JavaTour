package com.crm.service;

import java.util.List;

import com.crm.model.DataModel;
import com.crm.model.HandleJurisdiction;
import com.crm.model.Pager;

public interface IHandleJurisdictionService {

	public DataModel<HandleJurisdiction> findList(Pager pager);

	public List<HandleJurisdiction> findAllHandleJurisdiction();

	public void addHandleJurisdiction(HandleJurisdiction handleJurisdiction);

	public void deleteHandleJurisdiction(int[] role_id);

}
