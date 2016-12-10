package com.zrkc.syyh.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

import com.zrkc.syyh.dao.ILogDao;
import com.zrkc.syyh.dao.impl.LogDaoImpl;
import com.zrkc.syyh.model.Log;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.service.ILogService;

public class LogServiceImpl implements ILogService{
	private ILogDao logDao = new LogDaoImpl();
	/**
	 * 查出日志列表当前页所需要的数据
	 */
	public Pageinfo<Log> logList(String curPage) {
		int page = 1;
		if(curPage != null && !"".equals(curPage)){
			page = Integer.parseInt(curPage);
		}
		Pageinfo<Log> pageInfo = new Pageinfo<Log>();
		pageInfo.setCurpage(page);
		// 获得日志列表数据
		List<Log> list = logDao.logList(pageInfo.getFrom(), pageInfo.getPageSize());
		// 查询日志总数
		int num = logDao.countLog();
		pageInfo.setPagedata(list);
		pageInfo.setTotalRecord(num);
		return pageInfo;
	}
	/**
	 * 查询所有日志
	 */
	public List<Log> findAllLog() {
		return logDao.findAllLog();
	}
	/**
	 * 生成excel
	 * @throws UnsupportedEncodingException 
	 */
	public void exportExcel(List<Log> list, HttpServletResponse response) throws UnsupportedEncodingException {
		//response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment; filename =" + new String("日志.xlsx".getBytes("utf-8"), "iso-8859-1"));
		ServletOutputStream out = null;
		WritableWorkbook workBook = null;
		try{
			// 获得输出流
			out = response.getOutputStream();
			// 创建workBook(工作表, 工作薄)
			workBook = Workbook.createWorkbook(out);
			// 创建sheet(表格)
			WritableSheet sheet0 = workBook.createSheet("全部日志", 0);
			// 向sheet中添加数据
			sheet0.addCell(new Label(0, 0, "序号"));// 第0列，第0行
			sheet0.addCell(new Label(1, 0, "登录账号"));// 第1列，第0行
			sheet0.addCell(new Label(2, 0, "登录时间"));// 第2列，第0行
			sheet0.addCell(new Label(3, 0, "退出时间"));// 第3列，第0行
			for(int i = 0; i < list.size(); i++){
				Log log = list.get(i);
				sheet0.addCell(new Label(0, i+1, String.valueOf(i+1)));
				sheet0.addCell(new Label(1, i+1, log.getUserId()));
				if(log.getCheckinTime() != null){
					sheet0.addCell(new Label(2, i+1, log.getCheckinTimeStr()));
				}else{
					sheet0.addCell(new Label(2, i+1, ""));
				}
				if(log.getCheckoutTime() != null){
					sheet0.addCell(new Label(3, i+1, log.getCheckoutTimeStr()));
				}else{
					sheet0.addCell(new Label(3, i+1, ""));
				}
			}
			// 写入
			workBook.write();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				workBook.close();
			} catch (WriteException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 清空日志
	 */
	public void clearLog() {
		logDao.clearLog();
	}
	/**
	 * 添加日志
	 */
	public long addLog(Log log) {
		return logDao.addLog(log);
	}
	/**
	 * 更新退出时间
	 */
	public void updateCheckoutTime(Long logId, Log log) {
		logDao.updateCheckoutTime(logId, log);
	}
	public long saveLog(Log log) {
		return logDao.saveLog(log);
	}
	public void updateCheckoutTime(Long logId) {
		// TODO Auto-generated method stub
		
	}
	
	
}
