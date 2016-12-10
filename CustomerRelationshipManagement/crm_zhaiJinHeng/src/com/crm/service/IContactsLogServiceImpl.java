package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.IContactsLogDao;
import com.crm.model.ContactsLog;
import com.crm.model.DataModel;
import com.crm.model.Pager;
@Service("IContactsLogService")
public class IContactsLogServiceImpl implements IContactsLogService{
	@Resource
	private IContactsLogDao ContactsLogDao;
	/**
	 * 查询显示列表所需的数据
	 */
	@Override
	public DataModel<ContactsLog> findList(Pager pager) {
		DataModel<ContactsLog> data=new DataModel<ContactsLog>();
		//分页查询商品类别列表
		List<ContactsLog> list=ContactsLogDao.findContactsLog(pager.getFrom(),pager.getPageSize());
		//查询总记录数
		int totalNum=ContactsLogDao.countContactsLog();
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有的联系人记录列表
	 */
	@Override
	public List<ContactsLog> findAllContactsLog() {
		return ContactsLogDao.findAllContactsLog();
	}
	/**
	 * 新建联系人记录列表页面
	 */
	@Override
	public void addContactsLog(ContactsLog contactsLog) {
		ContactsLogDao.addContactsLog(contactsLog);
	}
	/**
	 * 根据id删除商品类别
	 */
	@Override
	public void deleteContactsLog(int[] companyTouch_id) {
		if(companyTouch_id!=null){
			for (int i = 0; i < companyTouch_id.length; i++) {
				int id=companyTouch_id[i];
				//根据id删除联系人
				ContactsLogDao.deleteContactsLogById(id);
			}
		}
	}
}
