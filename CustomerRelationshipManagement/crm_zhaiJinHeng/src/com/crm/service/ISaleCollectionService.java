package com.crm.service;

import java.util.List;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.SaleCollection;

public interface ISaleCollectionService {

	public DataModel<SaleCollection> findList(Pager pager);

	public List<SaleCollection> findAllSaleCollection();

}
