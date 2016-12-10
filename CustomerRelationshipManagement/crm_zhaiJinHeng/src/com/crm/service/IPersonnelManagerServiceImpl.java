package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.IPersonnelManagerDao;
import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.PersonnelManager;
@Service("IPersonnelManagerService")
public class IPersonnelManagerServiceImpl implements IPersonnelManagerService{
	@Resource
	private IPersonnelManagerDao PersonnelManagerDao;
	/**
	 * 查询显示列表所需的数据
	 */
	@Override
	public DataModel<PersonnelManager> findList(Pager pager) {
		DataModel<PersonnelManager> data=new DataModel<PersonnelManager>();
		//分页查询商品类别列表
		List<PersonnelManager> list=PersonnelManagerDao.findPersonnelManager(pager.getFrom(),pager.getPageSize());
		//查询总记录数
		int totalNum=PersonnelManagerDao.countPersonnelManager();
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有的人事管理列表
	 */
	@Override
	public List<PersonnelManager> findAllPersonnelManager() {
		return PersonnelManagerDao.findAllPersonnelManager();
	}
	/**
	 * 新建人事管理页面
	 */
	@Override
	public void addPersonnelManager(PersonnelManager personnelManager) {
		PersonnelManagerDao.addPersonnelManager(personnelManager);
	}
	/**
	 * 根据id删除人事管理列表
	 */
	@Override
	public void deletePersonnelManager(int[] user_id) {
		if(user_id!=null){
			for (int i = 0; i < user_id.length; i++) {
				int id=user_id[i];
				//根据id删除人事管理列表
				PersonnelManagerDao.deletePersonnelManagerById(id);
			}
		}
	}

}
