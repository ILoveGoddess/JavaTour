package com.zrkc.syyh.servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrkc.syyh.controller.DeptController;
import com.zrkc.syyh.controller.EquTypeController;
import com.zrkc.syyh.controller.JobController;
import com.zrkc.syyh.controller.LogController;
import com.zrkc.syyh.controller.InspectionGroupController;
import com.zrkc.syyh.controller.InspectionWorkerController;
import com.zrkc.syyh.controller.UserController;
import com.zrkc.syyh.controller.WdController;
import com.zrkc.syyh.controller.WxgController;
import com.zrkc.syyh.controller.XjController;
import com.zrkc.syyh.controller.BankController;

public class DispatcherServlet extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		System.out.println("uri:"+uri);//    /syyh_6b/user/userList.do
		String path = uri.substring(uri.indexOf("/", 1)+1, uri.lastIndexOf("."));
		System.out.println("DispatcherServlet-->path:"+path);//   user/userList 
		
		String[] ary=path.split("/");
		System.out.println("DispatcherServlet-->ary:"+Arrays.toString(ary));
		if(ary.length!=2){
			request.getRequestDispatcher("/404.jsp").forward(request, response);
			return;
		}                                                                                        
		
		if(ary[0].equals("user")){//登录,登出,用户模块
			UserController userController=new UserController();
			if(ary[1].equals("login")){
				userController.login(request,response);
			}else if(ary[1].equals("logout")){
				userController.logout(request,response);
			}else if(ary[1].equals("initdata")){
				userController.initdata(request,response);
			}else if(ary[1].equals("leftList")){
				userController.leftList(request,response);
			}else if(ary[1].equals("userList")){
				userController.userList(request,response);
			}else if(ary[1].equals("toAddUser")){
				userController.toAddUser(request,response);
			}else if(ary[1].equals("addUser")){
				userController.addUser(request,response);
			}else if(ary[1].equals("deleteUser")){
				userController.deleteUser(request, response);
			}else if(ary[1].equals("toUpdateUser")){
				userController.toUpdateUser(request, response);
			}else if(ary[1].equals("updateUser")){
				userController.updateUser(request, response);
			}else if(ary[1].equals("updateUserState")){
				userController.updateUserState(request, response);
			}
			
		}else if(ary[0].equals("dept")){//部门模块
			DeptController deptController = new DeptController();
			if(ary[1].equals("deptList")){
				deptController.deptList(request,response);
			}else if(ary[1].equals("deleteDept")){
				deptController.deleteDept(request,response);
			}else if(ary[1].equals("toUpdateDept")){
				deptController.toUpdateDept(request,response);
			}else if(ary[1].equals("updateDept")){
				deptController.updateDept(request,response);
			}else if(ary[1].equals("toAddDept")){
				deptController.toAddDept(request,response);
			}else if(ary[1].equals("addDept")){
				deptController.addDept(request,response);
			}
			
		}else if(ary[0].equals("log")){//日志模块
			LogController logController = new LogController();
			if(ary[1].equals("logList")){
				logController.logList(request, response);
			}else if(ary[1].equals("exportExcel")){
				logController.exportExcel(request, response);
			}else if(ary[1].equals("clearLog")){
				logController.clearLog(request, response);
			}
		}else if(ary[0].equals("equipmentType")){//银行设备模块
			EquTypeController equTypeController = new EquTypeController();
			if(ary[1].equals("equipmentTypeList")){
				equTypeController.equipmentTypeList(request,response);
			}else if(ary[1].equals("deleteEqu")){
				equTypeController.deleteEqu(request,response);
			}else if(ary[1].equals("toUpdateEqu")){
				equTypeController.toUpdateEqu(request,response);
			}else if(ary[1].equals("updateEqu")){
				equTypeController.updateEqu(request,response);
			}else if(ary[1].equals("toAddEqu")){
				equTypeController.toAddEqu(request,response);
			}else if(ary[1].equals("addEqu")){
				equTypeController.addEqu(request,response);
			}			
		}else if(ary[0].equals("bank")){// 银行网点模块
			BankController bankController = new BankController();
			if(ary[1].equals("banklist")){
				bankController.bankList(request,response);
			}else if(ary[1].equals("toAddBank")){
				bankController.toAddBank(request,response);
			}else if(ary[1].equals("addBank")){
				bankController.addBank(request,response);
			}else if(ary[1].equals("toUpdateBank")){
				bankController.toUpdateBank(request,response);
			}else if(ary[1].equals("updateBank")){
				bankController.updateBank(request,response);
			}else if(ary[1].equals("checkEqu")){
				bankController.checkEqu(request,response);
			}else if(ary[1].equals("toAddEqu")){
				bankController.toAddEqu(request,response);
			}else if(ary[1].equals("addEqu")){
				bankController.addEqu(request,response);
			}else if(ary[1].equals("toUpdateEqu")){
				bankController.toUpdateEqu(request,response);
			}else if(ary[1].equals("updateEqu")){
				bankController.updateEqu(request,response);
			}else if(ary[1].equals("deleteEqu")){
				bankController.deleteEqu(request,response);
			}			
		}else if(ary[0].equals("job")){// 岗位模块
			JobController jobController = new JobController();
			if(ary[1].equals("jobList")){
				jobController.jobList(request,response);
			}else if(ary[1].equals("showJob")){
				jobController.showJob(request,response);
			}else if(ary[1].equals("toAddJob")){
				jobController.toAddJob(request,response);
			}else if(ary[1].equals("addJob")){
				jobController.addJob(request,response);
			}else if(ary[1].equals("toUpdateJob")){
				jobController.toUpdateJob(request,response);
			}else if(ary[1].equals("updateJob")){
				jobController.updateJob(request,response);
			}else if(ary[1].equals("toManageFunc")){
				jobController.toManageFunc(request,response);
			}else if(ary[1].equals("toSetPow")){
				jobController.toSetPow(request,response);
			}else if(ary[1].equals("changePow")){
				jobController.changePow(request,response);
			}else if(ary[1].equals("jobdelete")){
				jobController.jobdelete(request,response);
			}		
			
		}else if(ary[0].equals("inspectionWorker")){// 巡检工模块
			InspectionWorkerController inspectionWorkerController = new InspectionWorkerController();
			if(ary[1].equals("inspectionWorkerList")){
				inspectionWorkerController.inspectionWorkerList(request,response);
			}else if(ary[1].equals("toAddWorker")){
				inspectionWorkerController.toAddWorker(request,response);
			}else if(ary[1].equals("addWoker")){
				inspectionWorkerController.addWoker(request,response);
			}else if(ary[1].equals("toUpdateWorker")){
				inspectionWorkerController.toUpdateWorker(request,response);
			}else if(ary[1].equals("updateWorker")){
				inspectionWorkerController.updateWorker(request,response);
			}else if(ary[1].equals("deleteWorker")){
				inspectionWorkerController.deleteWorker(request,response);
			}
			
		}else if(ary[0].equals("inspectionGroup")){// 巡检组模块
			InspectionGroupController inspectionGroupController = new InspectionGroupController();
			if(ary[1].equals("inspectionGroupList")){
				inspectionGroupController.piGroupList(request,response);
			}else if(ary[1].equals("toAddGroup")){
				inspectionGroupController.toAddGroup(request,response);
			}else if(ary[1].equals("addInspectionGroup")){
				inspectionGroupController.addPiGroup(request,response);
			}else if(ary[1].equals("toUpdateGroup")){
				inspectionGroupController.toUpdateGroup(request,response);
			}else if(ary[1].equals("updateGroup")){
				inspectionGroupController.updateGroup(request,response);
			}else if(ary[1].equals("resetWorker")){
				inspectionGroupController.resetWorker(request,response);
			}else if(ary[1].equals("changeWorkerGroup")){
				inspectionGroupController.changeWorkerGroup(request,response);
			}else if(ary[1].equals("viewWorker")){
				inspectionGroupController.viewWorker(request,response);
			}		
		}else if(ary[0].equals("repairtype")){//设备问题报修管理模块
//			RepairtypeController repairtypeController = new RepairtypeController();
//			if(ary[1].equals("repairtypeList")){
//				repairtypeController.repairtypeList(request,response);
//			}
//			else if(ary[1].equals("toAddRepairtype")){
//				repairTypeController.toAddRepairtype(request,response);
//			}else if(ary[1].equals("addRepairtype")){
//				repairTypeController.addRepairtype(request,response);
//			}else if(ary[1].equals("toUpdateType")){
//				repairTypeController.toUpdateType(request,response);
//			}else if(ary[1].equals("updateType")){
//				repairTypeController.updateType(request,response);
//			}else if(ary[1].equals("deleteType")){
//				repairTypeController.deleteType(request,response);
//			}			
		}else if(ary[0].equals("wd")){
			WdController wdController = new WdController();
			if(ary[1].equals("wdlist")){
				wdController.wdsbbxList(request,response);
			}else if(ary[1].equals("sbbxview")){
				wdController.sbbxview(request,response);
			}else if(ary[1].equals("wdsure")){
				wdController.wdsure(request,response);
			}else if(ary[1].equals("towdupdate")){
				wdController.towdupdate(request,response);
			}else if(ary[1].equals("wdupdate")){
				wdController.wdupdate(request,response);
			}else if(ary[1].equals("towdaddrepair")){
				wdController.towdaddrepair(request,response);
			}else if(ary[1].equals("wdaddrepair")){
				wdController.wdaddrepair(request,response);
			}else if(ary[1].equals("wddeleterepair")){
				wdController.wddeleterepair(request,response);
			}else if(ary[1].equals("exportExcel")){
				wdController.exportExcel(request,response);
			}else if(ary[1].equals("wdbxqr")){
				wdController.wdbxqr(request,response);
			}else if(ary[1].equals("wdSureNeedRepair")){
				wdController.wdSureNeedRepair(request,response);
			}		
		}else if(ary[0].equals("xj")){
			XjController xjController = new XjController();
			if(ary[1].equals("xjlist")){
				xjController.xjlist(request,response);
			}else if(ary[1].equals("xjfpxz")){
				xjController.xjfpxz(request,response);
			}else if(ary[1].equals("xjupdategroup")){
				xjController.xjupdategroup(request,response);
			}else if(ary[1].equals("xjsbbx")){
				xjController.xjsbbx(request,response);
			}		
		}else if(ary[0].equals("wxg")){
			WxgController wxgController = new WxgController();
			if(ary[1].equals("wxglist")){
				wxgController.xjlist(request,response);
			}else if(ary[1].equals("getMoreRepair")){
				wxgController.getMoreRepair(request,response);
			}else if(ary[1].equals("wxgrepair")){
				wxgController.wxgrepair(request,response);
			}else if(ary[1].equals("repairOver")){
				wxgController.repairOver(request,response);
			}else if(ary[1].equals("addnewType")){
				wxgController.addnewType(request,response);
			}else if(ary[1].equals("insertType")){
				wxgController.insertType(request,response);
			}
		}else{
			request.getRequestDispatcher("/404.jsp").forward(request, response);
			return;
		}
		
		
	}

}
