package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.ISaleCollectionDao;
import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.SaleCollection;
@Service("ISaleCollectionService")
public class ISaleCollectionServiceImpl implements ISaleCollectionService{
	@Resource
	private ISaleCollectionDao SaleCollectionDao;
	/**
	 * 查询显示列表所需的数据
	 */
	@Override
	public DataModel<SaleCollection> findList(Pager pager) {
		DataModel<SaleCollection> data=new DataModel<SaleCollection>();
		//分页查询商品类别列表
		List<SaleCollection> list=SaleCollectionDao.findSaleCollection(pager.getFrom(),pager.getPageSize());
		//查询总记录数
		int totalNum=SaleCollectionDao.countSaleCollection();
		
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有的销售收款列表
	 */
	@Override
	public List<SaleCollection> findAllSaleCollection() {
		return SaleCollectionDao.findAllSaleCollection();
	}

}
