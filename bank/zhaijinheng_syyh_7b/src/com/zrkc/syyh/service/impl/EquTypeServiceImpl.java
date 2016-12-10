package com.zrkc.syyh.service.impl;

import java.util.List;

import com.zrkc.syyh.dao.IEquTypeDao;
import com.zrkc.syyh.dao.impl.EquTypeDaoImpl;
import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.EquipmentTypeModel;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.service.IEquTypeService;

public class EquTypeServiceImpl implements IEquTypeService{
	
	public static void main(String[] args) {
		EquTypeServiceImpl e = new EquTypeServiceImpl();
	}
	IEquTypeDao equTypeDao = new EquTypeDaoImpl();
	public Pageinfo<EquipmentTypeModel> getAllEquipmentType(String curpageStr) {
		int curpage = 1;
		if(curpageStr != null && curpageStr != ""){
			curpage = Integer.parseInt(curpageStr);
		}
		Pageinfo<EquipmentTypeModel> pageinfo = new Pageinfo<EquipmentTypeModel>();
		pageinfo.setCurpage(curpage);
		List<EquipmentTypeModel> list = equTypeDao.getAllEquipmentType(pageinfo);
		pageinfo.setPagedata(list);
		int totalRecord = equTypeDao.getTotalRecord();
		pageinfo.setTotalRecord(totalRecord);
		pageinfo.setPageSize(pageinfo.getPageSize());
		return pageinfo;
	}
	public void deleteEquById(String equipmentId) {
		equTypeDao.deleteEquById(equipmentId);
	}
	public void updateEqu(String equipmentId, String equipmentName) {
		equTypeDao.updateEqu(equipmentId,equipmentName);
	}
	public void addEqu(EquipmentType equ) {
		equTypeDao.addEqu(equ);
	}
}
