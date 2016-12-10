package com.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.crm.model.Receivables;

public interface IReceivablesDao {
	/**
	 * 分页查询商品类别列表
	 * @param from
	 * @param pageSize
	 * @return
	 */
	public List<Receivables> findReceivables(@Param("from")int from, @Param("pageSize")int pageSize);
	/**
	 * 查询总记录数
	 * @return
	 */
	public int countReceivables();
	/**
	 * 获得所有的应收款项列表
	 * @return
	 */
	public List<Receivables> findAllReceivables();
	/**
	 * 新建应收款项页面
	 * @param receivables
	 */
	public void addReceivables(@Param("receivables")Receivables receivables);

}
