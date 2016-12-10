package com.crm.service;

import java.util.List;

import com.crm.model.CustomerVisit;
import com.crm.model.DataModel;
import com.crm.model.Pager;

public interface ICustomerVisitService {
	
	public DataModel<CustomerVisit> findList(Pager pager);

	public List<CustomerVisit> findAllCustomerVisit();

	public void addCustomerVisit(CustomerVisit customerVisit);

	public void deleteCustomerVisit(int[] company);
}
