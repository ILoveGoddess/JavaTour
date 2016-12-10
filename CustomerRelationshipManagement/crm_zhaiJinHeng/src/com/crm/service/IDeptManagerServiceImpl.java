package com.crm.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.IDeptManagerDao;
import com.crm.model.DataModel;
import com.crm.model.DeptManager;
import com.crm.model.Pager;
import com.crm.model.ProductType;
@Service("IDeptManagerService")
public class IDeptManagerServiceImpl implements IDeptManagerService{
	@Resource
	private IDeptManagerDao DeptManagerDao;
	/**
	 * 查询显示列表所需的数据
	 */
	@Override
	public DataModel<DeptManager> findList(Pager pager) {
		DataModel<DeptManager> data=new DataModel<DeptManager>();
		//分页查询商品类别列表
		List<DeptManager> list=DeptManagerDao.findDeptManager(pager.getFrom(),pager.getPageSize());
		//查询总记录数
		int totalNum=DeptManagerDao.countDeptManager();
		pager.setTotalRecord(totalNum);
		data.setRows(list);
		data.setPager(pager);
		return data;
	}
	/**
	 * 获得所有的部门管理列表
	 */
	@Override
	public List<DeptManager> findAllDeptManager() {
		return DeptManagerDao.findAllDeptManager();
	}
	/**
	 * 拼接成有层次结构的字符串
	 */
	@Override
	public String getStr() {
		//查询最顶层的商品类别
		List<DeptManager> rootList=DeptManagerDao.findRootDeptManager();
		if(rootList!=null && rootList.size()>0){
			String str="";
			for (int i = 0; i < rootList.size(); i++) {
				DeptManager p=rootList.get(i);
				str+="<option value='"+p.getId()+"'>"+p.getName()+"</option>";
				str+=getChildrenStr(p.getId(),"");
			}
				return str;
		}else{
			return "";
		}
	}
	private String getChildrenStr(Integer id, String nbsp) {
		//根据pid查询商品类别
		List<DeptManager> list=DeptManagerDao.findDeptManagerbyPid(id);
		if(list!=null){
			String str="";
			nbsp+="&nbsp;&nbsp;&nbsp;";
			for (int i = 0; i < list.size(); i++) {
				DeptManager p=list.get(i);
				str+="<option value='"+p.getId()+"'>"+nbsp+p.getName()+"</option>";
				str+=getChildrenStr(p.getId(),nbsp);
			}
				return str;
		}else{
			return "";
		}
	}
	/**
	 * 新建部门管理页面
	 */
	@Override
	public void addDeptManager(DeptManager deptManager) {
		DeptManagerDao.addDeptManager(deptManager);
		
	}
	/**
	 * 根据id删除部门管理列表
	 */
	@Override
	public void deleteDeptManager(int[] userGroup_id) {
		if(userGroup_id!=null){
			for (int i = 0; i < userGroup_id.length; i++) {
				int id=userGroup_id[i];
				//根据id删除部门管理列表
				DeptManagerDao.deleteDeptManagerById(id);
			}
		}
	}

}
