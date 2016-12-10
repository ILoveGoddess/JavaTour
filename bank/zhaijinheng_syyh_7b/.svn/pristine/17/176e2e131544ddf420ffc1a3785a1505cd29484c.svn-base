package com.zrkc.syyh.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

import com.zrkc.syyh.dao.IRepairDao;
import com.zrkc.syyh.dao.impl.RepairDaoImpl;

import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.Repair;
import com.zrkc.syyh.model.RepairModel;
import com.zrkc.syyh.model.RepairSearch;
import com.zrkc.syyh.model.RepairViewModel;
import com.zrkc.syyh.service.IWdService;
import com.zrkc.syyh.utils.DateUtils;

public class WdServiceImpl implements IWdService{
	IRepairDao repairDao = new RepairDaoImpl();
	
	public static void main(String[] args) {
		WdServiceImpl w = new WdServiceImpl();
		//RepairSearch r = new RepairSearch("3", "1", null, null, null, null);
		//System.out.println(w.repairList("1",r).getPagedata());
	}
	
	public Pageinfo<RepairModel> repairList(String curpageStr,RepairSearch repairSearch) {
		int curpage = 1;
		if(curpageStr != null && curpageStr != ""){
			curpage = Integer.parseInt(curpageStr);
		}
		Pageinfo<RepairModel> pageinfo = new Pageinfo<RepairModel>();	
		pageinfo.setCurpage(curpage);
		List<RepairModel> list = new ArrayList<RepairModel>();
		if(repairSearch == null){
			list = repairDao.repairList(pageinfo);
		}else{
			list = repairDao.repairList(pageinfo,repairSearch);
		}
		pageinfo.setPagedata(list);
		int totalCount = repairDao.getTotalCount();
		pageinfo.setTotalRecord(totalCount);
		pageinfo.setPageSize(pageinfo.getPageSize());
		return pageinfo;
	}

	public RepairViewModel getRepairView(long repairId) {
		return repairDao.getRepairView(repairId);
	}

	public void updateRepairStatus(long repairId) {
		repairDao.updateRepairStatus(repairId);
	}

	public List<EquipmentType> getAllEquipmentType() {
		return repairDao.getAllEquipmentType();
	}

	public List<String> getAllEachId() {
		return repairDao.getAllEachId();
	}

	public void updateRepair(Repair repair) {
		repairDao.updateRepair(repair);
	}

	public String selectBankId(String equipmentEachId) {
		return repairDao.selectBankId(equipmentEachId);
	}

	public void insertRepair(Repair repair) {
		repairDao.insertRepair(repair);
	}

	public String selectEquId(String equipmentEachId) {
		return repairDao.selectEquId(equipmentEachId);
	}

	public void deleteRepair(long repairId) {
		repairDao.deleteRepair(repairId);
	}

	public List<Repair> getAllRepair() {
		return repairDao.getAllRepair();
	}

	public void exportExcel(List<RepairModel> list, HttpServletResponse response) {
		response.setHeader("Content-Disposition", "attachment;filename=repair.xls");
		ServletOutputStream out = null;
		WritableWorkbook workBook = null;
		try {
			out = response.getOutputStream();
			workBook = Workbook.createWorkbook(out);
			
			WritableSheet sheet = workBook.createSheet("维修", 0);
			sheet.addCell(new Label(0, 0, "编号"));
			sheet.addCell(new Label(1, 0, "银行名称"));
			sheet.addCell(new Label(2, 0, "设备种类"));
			sheet.addCell(new Label(3, 0, "设备流水号"));
			sheet.addCell(new Label(4, 0, "报修时间"));
			sheet.addCell(new Label(5, 0, "记录状态"));
			sheet.addCell(new Label(6, 0, "修完时间"));
			for(int i=0;i<list.size();i++){
				RepairModel repair = list.get(i);
				
				sheet.addCell(new Label(0, i+1, repair.getRepairId()+""));
				sheet.addCell(new Label(1, i+1, repair.getBankName()));
				sheet.addCell(new Label(2, i+1, repair.getEquipmentName()));
				sheet.addCell(new Label(3, i+1, repair.getEquipmentEachId()));
				sheet.addCell(new Label(4, i+1, repair.getRepairDateStr()));
				sheet.addCell(new Label(5, i+1, repair.getStatus()+""));
				sheet.addCell(new Label(6, i+1, repair.getRepairEndDateStr()));
				
			}
			workBook.write();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(workBook != null){
				try {
					workBook.close();
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
			if(out != null){
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		
	}

	public List<RepairModel> getAllRepairModel() {
		return repairDao.getAllRepairModel();
	}

	public void updateRepairStatusTo3(long repairId) {
		repairDao.updateRepairStatusTo3(repairId);
	}
}
