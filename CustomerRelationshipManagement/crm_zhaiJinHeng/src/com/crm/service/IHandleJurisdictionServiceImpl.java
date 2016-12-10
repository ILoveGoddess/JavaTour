package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.IHandleJurisdictionDao;
import com.crm.model.DataModel;
import com.crm.model.HandleJurisdiction;
import com.crm.model.Pager;
@Service("IHandleJurisdictionService")
public class IHandleJurisdictionServiceImpl implements IHandleJurisdictionService{
	@Resource
	private IHandleJurisdictionDao HandleJurisdictionDao;
	/**
	 * 查询显示列表所需的数据
	 */
	@Override
	public DataModel<HandleJurisdiction> findList(Pager pager) {
		DataModel<HandleJurisdiction> data=new DataModel<HandleJurisdiction>();
		//分页查询商品类别列表
		List<HandleJurisdiction> list=HandleJurisdictionDao.findHandleJurisdiction(pager.getFrom(),pager.getPageSize());
		//查询总记录数
		int totalNum=HandleJurisdictionDao.countHandleJurisdiction();
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有的操作权限组列表
	 */
	@Override
	public List<HandleJurisdiction> findAllHandleJurisdiction() {
		return HandleJurisdictionDao.findAllHandleJurisdiction();
	}
	/**
	 * 新建操作权限组页面
	 */
	@Override
	public void addHandleJurisdiction(HandleJurisdiction handleJurisdiction) {
		HandleJurisdictionDao.addHandleJurisdiction(handleJurisdiction);
	}
	/**
	 * 根据id删除操作权限组列表
	 */
	@Override
	public void deleteHandleJurisdiction(int[] role_id) {
		if(role_id!=null){
			for (int i = 0; i < role_id.length; i++) {
				int id=role_id[i];
				//根据id删除操作权限组列表
				HandleJurisdictionDao.deleteHandleJurisdictionById(id);
			}
		}
	}

}
