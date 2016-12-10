package com.zrkc.syyh.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.zrkc.syyh.dao.ILogDao;
import com.zrkc.syyh.dao.impl.LogDaoImpl;
import com.zrkc.syyh.model.Log;
import com.zrkc.syyh.model.Pageinfo;

public interface ILogService {
	ILogDao logDao = new LogDaoImpl();

	public Pageinfo<Log> logList(String curPage);

	public List<Log> findAllLog();

	public void exportExcel(List<Log> list, HttpServletResponse response)throws UnsupportedEncodingException;

	public void clearLog();
	
	public long addLog(Log log);
	
	public void updateCheckoutTime(Long logId);

	public long saveLog(Log log);

	public void updateCheckoutTime(Long logId, Log log);

}
