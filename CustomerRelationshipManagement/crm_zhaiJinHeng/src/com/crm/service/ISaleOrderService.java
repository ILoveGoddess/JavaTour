package com.crm.service;

import java.util.List;

import com.crm.model.DataModel;
import com.crm.model.Pager;
import com.crm.model.SaleOrder;

public interface ISaleOrderService {

	public DataModel<SaleOrder> findList(Pager pager);

	public List<SaleOrder> findAllSaleOrder();

	public void addSaleOrder(SaleOrder saleOrder);

	public void deleteSaleOrder(int[] order_id);

}
