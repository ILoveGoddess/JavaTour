package com.crm.service;

import java.util.List;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.PersonnelManager;

public interface IPersonnelManagerService {

	public DataModel<PersonnelManager> findList(Pager pager);

	public List<PersonnelManager> findAllPersonnelManager();

	public void addPersonnelManager(PersonnelManager personnelManager);

	public void deletePersonnelManager(int[] user_id);

}
