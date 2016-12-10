package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.IContactsDao;
import com.crm.model.Contacts;
import com.crm.model.DataModel;
import com.crm.model.Pager;
@Service("IContactsService")
public class IContactsServiceImpl implements IContactsService{
	@Resource
	private IContactsDao ContactsDao;
	/**
	 * 查询显示列表所需的数据
	 */
	@Override
	public DataModel<Contacts> findList(Pager pager) {
		DataModel<Contacts> data=new DataModel<Contacts>();
		//分页查询商品类别列表
		List<Contacts> list=ContactsDao.findContacts(pager.getFrom(),pager.getPageSize());
		//查询总记录数
		int totalNum=ContactsDao.countContacts();
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有的联系人列表
	 */
	@Override
	public List<Contacts> findAllContacts() {
		return ContactsDao.findAllContacts();
	}
	/**
	 * 新建联系人列表页面
	 */
	@Override
	public void addContacts(Contacts contacts) {
		ContactsDao.addContacts(contacts);
	}
	/**
	 * 删除联系人列表
	 */
	@Override
	public void deleteContacts(int[] companyLinkman_id) {
		if(companyLinkman_id!=null){
			for (int i = 0; i < companyLinkman_id.length; i++) {
				int id=companyLinkman_id[i];
				//根据id删除联系人
				ContactsDao.deleteContactsById(id);
			}
		}
	}

}
