package com.zrkc.syyh.service.impl;

import java.util.List;

import com.zrkc.syyh.dao.IWxgDao;
import com.zrkc.syyh.dao.impl.WxgDaoImpl;

import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.RepairViewModel;
import com.zrkc.syyh.model.Repairtype;
import com.zrkc.syyh.service.IWxgService;

public class WxgServiceImpl implements IWxgService{
	IWxgDao wxgDao = new WxgDaoImpl();
	
	public static void main(String[] args) {
		WxgServiceImpl w = new WxgServiceImpl();
		//System.out.println(w.getAllRepair("1").getPagedata());
	}
	
	public Pageinfo<RepairViewModel> getAllRepair(String curpageStr) {
		int curpage = 1;
		if(curpageStr != null && curpageStr != ""){
			curpage = Integer.parseInt(curpageStr);
		}
		Pageinfo<RepairViewModel> pageinfo = new Pageinfo<RepairViewModel>();	
		pageinfo.setCurpage(curpage);
		 List<RepairViewModel> list = wxgDao.repairList(pageinfo);
		 pageinfo.setPagedata(list);
		 int totalCount = wxgDao.getTotalCount();
		 pageinfo.setTotalRecord(totalCount);
		 pageinfo.setPageSize(pageinfo.getPageSize());
		 return pageinfo;
	}

	public RepairViewModel getRepairById(long repairId) {
		return wxgDao.getRepairById(repairId);
	}

	public List<Repairtype> getAllRepairType() {
		return wxgDao.getAllRepairType();
	}

	public void updateStatusTo2(RepairViewModel repair) {
		wxgDao.updateStatusTo2(repair);
	}
}
