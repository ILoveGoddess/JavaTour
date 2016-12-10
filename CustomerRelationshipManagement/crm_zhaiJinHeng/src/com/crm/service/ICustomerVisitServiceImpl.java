package com.crm.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.ICustomerVisitDao;
import com.crm.model.CustomerVisit;
import com.crm.model.DataModel;
import com.crm.model.Pager;
@Service("ICustomerVisitService")
public class ICustomerVisitServiceImpl implements ICustomerVisitService{
	@Resource
	private ICustomerVisitDao CustomerVisitDao;
	/**
	 * 查询显示列表所需的数据
	 */
	@Override
	public DataModel<CustomerVisit> findList(Pager pager) {
		DataModel<CustomerVisit> data=new DataModel<CustomerVisit>();
		//分页查询商品类别列表
		List<CustomerVisit> list = CustomerVisitDao.findCustomerVisit(pager.getFrom(), pager.getPageSize());
		//查询总记录数
		int totalNum=CustomerVisitDao.countCustomerVisit();
		
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有的客户拜访列表
	 */
	@Override
	public List<CustomerVisit> findAllCustomerVisit() {
		return CustomerVisitDao.findAllCustomerVisit();
	}
	/**
	 * 新建客户拜访页面
	 */
	@Override
	public void addCustomerVisit(CustomerVisit customerVisit) {
		CustomerVisitDao.addProductType(customerVisit);
	}
	/**
	 * 删除客户拜访列表页面
	 */
	@Override
	public void deleteCustomerVisit(int[] company) {
		if(company!=null){
			for (int i = 0; i < company.length; i++) {
				int id=company[i];
//				//获得此商品类别下的下一层的商品类别的数目
//				int num=CustomerVisitDao.countCustomerVisitByPid(id);
//				if(num==0){
//					//获得此商品类别下的商品数目
//					int num2=CustomerVisitDao.countCustomerVisit(id);
//					if(num2==0){
						//根据id删除客服拜访
						CustomerVisitDao.deleteCustomerVisitById(id);
//					}
//				}
			}
		}
	}

}
