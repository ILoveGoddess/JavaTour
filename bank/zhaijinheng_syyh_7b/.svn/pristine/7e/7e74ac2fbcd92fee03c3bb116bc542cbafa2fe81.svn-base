package com.zrkc.syyh.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrkc.syyh.model.Log;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.service.ILogService;
import com.zrkc.syyh.service.impl.LogServiceImpl;

public class LogController {
	private ILogService logService = new LogServiceImpl();
	/**
	 * 日志列表
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void logList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.获得页码
		String curPage = request.getParameter("curpage");
		// 2.查出日志列表所需要的数据
		Pageinfo<Log> pageInfo = logService.logList(curPage);
		// 3.放入request
		request.setAttribute("pageInfo", pageInfo);
		// 4.跳转到日志列表页面
		request.getRequestDispatcher("/jsp/log/logslist.jsp").forward(request, response);
	}
	/**
	 * 生成excel
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException 
	 */
	public void exportExcel(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		// 1.获得要导出的数据
		List<Log> list = logService.findAllLog();
		// 2.导出
		logService.exportExcel(list, response);
	}
	/**
	 * 清空日志
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void clearLog(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// 1.清空日志
		logService.clearLog();
		// 2.重定向跳转到logList日志列表页面
		response.sendRedirect("logList.do");
	}
	
}
