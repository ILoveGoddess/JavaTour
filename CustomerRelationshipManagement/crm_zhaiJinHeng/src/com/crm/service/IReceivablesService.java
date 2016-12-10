package com.crm.service;

import java.util.List;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.Receivables;

public interface IReceivablesService {

	public DataModel<Receivables> findList(Pager pager);

	public List<Receivables> findAllReceivables();

	public void addReceivables(Receivables receivables);

}
