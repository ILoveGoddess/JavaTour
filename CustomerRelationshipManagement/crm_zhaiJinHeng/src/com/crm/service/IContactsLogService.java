package com.crm.service;

import java.util.List;

import com.crm.model.ContactsLog;
import com.crm.model.DataModel;
import com.crm.model.Pager;

public interface IContactsLogService {

	public DataModel<ContactsLog> findList(Pager pager);
	
	public List<ContactsLog> findAllContactsLog();

	public void addContactsLog(ContactsLog contactsLog);

	public void deleteContactsLog(int[] companyTouch_id);

}
