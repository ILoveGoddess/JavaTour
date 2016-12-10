package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.IReceivablesDao;
import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.Receivables;
@Service("IReceivablesService")
public class IReceivablesServiceImpl implements IReceivablesService{
	@Resource
	private IReceivablesDao ReceivablesDao;
	/**
	 * 查询显示列表所需的数据
	 */
	@Override
	public DataModel<Receivables> findList(Pager pager) {
		DataModel<Receivables> data=new DataModel<Receivables>();
		//分页查询商品类别列表
		List<Receivables> list=ReceivablesDao.findReceivables(pager.getFrom(),pager.getPageSize());
		//查询总记录数
		int totalNum=ReceivablesDao.countReceivables();
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有的应收款项列表
	 */
	@Override
	public List<Receivables> findAllReceivables() {
		return ReceivablesDao.findAllReceivables();
	}
	/**
	 * 新建应收款项页面
	 */
	@Override
	public void addReceivables(Receivables receivables) {
		ReceivablesDao.addReceivables(receivables);
	}

}
