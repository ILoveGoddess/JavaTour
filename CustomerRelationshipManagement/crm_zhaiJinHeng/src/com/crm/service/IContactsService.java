package com.crm.service;

import java.util.List;

import com.crm.model.Contacts;
import com.crm.model.DataModel;
import com.crm.model.Pager;

public interface IContactsService {
	
	public DataModel<Contacts> findList(Pager pager);

	public List<Contacts> findAllContacts();

	public void addContacts(Contacts contacts);

	public void deleteContacts(int[] companyLinkman_id);

}
