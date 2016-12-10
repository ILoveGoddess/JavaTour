package com.zrkc.syyh.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrkc.syyh.model.Bank;
import com.zrkc.syyh.model.BankEquipment;
import com.zrkc.syyh.model.BankEquipmentModel;
import com.zrkc.syyh.model.BankModel;
import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.service.IBankService;
import com.zrkc.syyh.service.impl.BankServiceImpl;
import com.zrkc.syyh.utils.DateUtils;

public class BankController {
	IBankService bankService = new BankServiceImpl();
	/**
	 * 银行网点列表
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void bankList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String curpageStr = request.getParameter("curpage");
		Pageinfo<BankModel> pageinfo = bankService.bankList(curpageStr);
		request.setAttribute("pageinfo", pageinfo);
		request.getRequestDispatcher("/jsp/bank/bank.jsp").forward(request, response);
	}
	/**
	 * 跳转到新增银行网点页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void toAddBank(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/jsp/bank/banknew.jsp").forward(request, response);
	}
	/**
	 * 新增银行网点
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void addBank(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//1.获得用户提交新增银行网点的数据
		String bankId = request.getParameter("bank.bankId");
		String bankName = request.getParameter("bank.bankName");
		String bankLongitude = request.getParameter("bank.bankLongitude");
		String bankLatitude = request.getParameter("bank.bankLatitude");
		String bankIp = request.getParameter("bank.bankIp");
		//2.调用service保存用户提交新增银行网点的数据
		Bank bank = new Bank(bankId, bankName, new BigDecimal(bankLongitude),new BigDecimal(bankLatitude), bankIp);
		bankService.addBank(bank);
		//3.使用重定向跳转页面
		response.sendRedirect("banklist.do");
	}
	/**
	 * 跳转到修改银行网点页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void toUpdateBank(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1.获得bankId
		String bankIdStr = request.getParameter("bankId");
		// 2.根据bankId获得用户信息
		Bank bank = bankService.getBankById(bankIdStr);
		request.setAttribute("bank", bank);
		// 6.跳转到银行网点修改页面
		request.getRequestDispatcher("/jsp/bank/bankupdate.jsp").forward(request, response);
	}
	/**
	 * 修改银行网点信息
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void updateBank(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String bankId = request.getParameter("bank.bankId");
		String bankName = request.getParameter("bank.bankName");
		String bankLongitude = request.getParameter("bank.bankLongitude");
		String bankLatitude = request.getParameter("bank.bankLatitude");
		String bankIp = request.getParameter("bank.bankIp");
		Bank bank = new Bank(bankId, bankName, new BigDecimal(bankLongitude),new BigDecimal(bankLatitude), bankIp);
		bankService.updateBank(bank);
		response.sendRedirect("banklist.do");
	}
	/**
	 * 查看银行网点设备明细列表
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void checkEqu(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1.获得bankId和银行网点设备明细
		String bankIdStr = request.getParameter("bankId");
		String curpageStr = request.getParameter("curpage");
		Pageinfo<BankEquipmentModel> pageinfo = bankService.checkEqu(bankIdStr,curpageStr);
		request.setAttribute("pageinfo", pageinfo);
		request.getRequestDispatcher("/jsp/bank/bankEquipment.jsp").forward(request, response);
	}
	/**
	 * 跳转到新增银行网点设备明细页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void toAddEqu(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String bankIdStr = request.getParameter("bankId");
		request.setAttribute("bankId", bankIdStr);
		String bankName = bankService.getBankName(bankIdStr);
		request.setAttribute("bankName", bankName);
		List<EquipmentType> equipmentTypes = bankService.getAllTypes();
		request.setAttribute("equipmentTypes", equipmentTypes);
		request.getRequestDispatcher("/jsp/bank/bankequnew.jsp").forward(request, response);
	}
	/**
	 * 新增银行网点设备明细
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void addEqu(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//1.获得用户提交新增银行网点设备明细的数据
		String equipmentEachId = request.getParameter("bankEquipment.equipmenteachId");
		String bankId = request.getParameter("bankEquipment.bank.bankId");
		String equipmentId = request.getParameter("equipmentId");
		System.out.println(equipmentId);
		String equipmentValue = request.getParameter("bankEquipment.equipmentValue");
		String equipmentBuyDate = request.getParameter("equipmentBuyDate");
		String status = request.getParameter("status");
		String depreciationValue = request.getParameter("bankEquipment.depreciationValue");
		//2.调用service保存用户提交的新增银行网点设备明细的数据
		BankEquipment be = new BankEquipment(equipmentEachId, equipmentId, bankId, new BigDecimal(equipmentValue), DateUtils.strToDate(DateUtils.YYMMDD, equipmentBuyDate), status, new BigDecimal(depreciationValue));
		System.out.println(be);
		bankService.addBankEquipment(be);
		//3.跳转页面
		response.sendRedirect("banklist.do");
	}
	public void toUpdateEqu(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String equipmentEachId = request.getParameter("equipmentEachId");
		BankEquipmentModel bem = bankService.getEquById(equipmentEachId);
		request.setAttribute("bem", bem);
		request.getRequestDispatcher("/jsp/bank/bankequpdate.jsp").forward(request, response);
	}
	public void updateEqu(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String equipmentEachId = request.getParameter("bankEquipment.equipmenteachId");
		String status = request.getParameter("status");
		String depreciationValue = request.getParameter("bankEquipment.depreciationValue");
		BankEquipment be = new BankEquipment();
		be.setEquipmentEachId(equipmentEachId);
		be.setStatus(status);
		be.setDepreciationValue(new BigDecimal(depreciationValue));
		bankService.updateEqu(be);
		response.sendRedirect("banklist.do");
	}
	public void deleteEqu(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String equipmentEachId = request.getParameter("equipmenteachId");
		bankService.deleteEqu(equipmentEachId);
		response.sendRedirect("banklist.do");
	}

}
