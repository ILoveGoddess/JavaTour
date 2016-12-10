package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.ISaleOrderDao;
import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.SaleOrder;
@Service("ISaleOrderService")
public class ISaleOrderServiceImpl implements ISaleOrderService{
	@Resource
	private ISaleOrderDao SaleOrderDao;
	/**
	 * 查询显示列表所需的数据
	 */
	@Override
	public DataModel<SaleOrder> findList(Pager pager) {
		DataModel<SaleOrder> data=new DataModel<SaleOrder>();
		//分页查询商品类别列表
		List<SaleOrder> list=SaleOrderDao.findSaleOrder(pager.getFrom(),pager.getPageSize());
		//查询总记录数
		int totalNum=SaleOrderDao.countSaleOrder();
		
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有的销售单列表
	 */
	@Override
	public List<SaleOrder> findAllSaleOrder() {
		return SaleOrderDao.findAllSaleOrder();
	}
	/**
	 * 新建销售单页面
	 */
	@Override
	public void addSaleOrder(SaleOrder saleOrder) {
		SaleOrderDao.addSaleOrder(saleOrder);
		
	}
	/**
	 * 根据id删除销售单
	 */
	@Override
	public void deleteSaleOrder(int[] order_id) {
		if(order_id!=null){
			for (int i = 0; i < order_id.length; i++) {
				int id=order_id[i];
				//根据id删除销售单
				SaleOrderDao.deleteSaleOrderById(id);
			}
		}
	}

}
