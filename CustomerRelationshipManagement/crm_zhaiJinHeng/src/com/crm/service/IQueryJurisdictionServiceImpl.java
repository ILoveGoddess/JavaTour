package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.IQueryJurisdictionDao;
import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.QueryJurisdiction;
@Service("IQueryJurisdictionService")
public class IQueryJurisdictionServiceImpl implements IQueryJurisdictionService{
	@Resource
	private IQueryJurisdictionDao QueryJurisdictionDao;
	/**
	 * 查询显示列表所需的数据
	 */
	@Override
	public DataModel<QueryJurisdiction> findList(Pager pager) {
		DataModel<QueryJurisdiction> data=new DataModel<QueryJurisdiction>();
		//分页查询商品类别列表
		List<QueryJurisdiction> list=QueryJurisdictionDao.findQueryJurisdiction(pager.getFrom(),pager.getPageSize());
		//查询总记录数
		int totalNum=QueryJurisdictionDao.countQueryJurisdiction();
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有的查询权限组列表
	 */
	@Override
	public List<QueryJurisdiction> findAllQueryJurisdiction() {
		return QueryJurisdictionDao.findAllQueryJurisdiction();
	}
	/**
	 * 新建查询权限组页面
	 */
	@Override
	public void addQueryJurisdiction(QueryJurisdiction queryJurisdiction) {
		QueryJurisdictionDao.addQueryJurisdiction(queryJurisdiction);
	}
	/**
	 * 根据id删除查询权限组列表
	 */
	@Override
	public void deleteQueryJurisdiction(int[] accessGroup_id) {
		if(accessGroup_id!=null){
			for (int i = 0; i < accessGroup_id.length; i++) {
				int id=accessGroup_id[i];
				//根据id删除查询权限组列表
				QueryJurisdictionDao.deleteQueryJurisdictionById(id);
			}
		}
	}
}
