package com.zrkc.syyh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zrkc.syyh.model.Department;
import com.zrkc.syyh.model.Function;
import com.zrkc.syyh.model.Job;
import com.zrkc.syyh.model.Log;
import com.zrkc.syyh.model.Pageinfo;
import com.zrkc.syyh.model.User;
import com.zrkc.syyh.model.UserModel;
import com.zrkc.syyh.model.Xtymb;
import com.zrkc.syyh.service.ILogService;
import com.zrkc.syyh.service.IUserService;
import com.zrkc.syyh.service.impl.LogServiceImpl;
import com.zrkc.syyh.service.impl.UserServiceImpl;
/**
 * 用户
 * @author dz
 *
 */
public class UserController {
	private IUserService userService=new UserServiceImpl();
	private ILogService logService=new LogServiceImpl();
	/**
	 * 用户登录
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String loginId=request.getParameter("loginId");
		String loginPassword=request.getParameter("loginPassword");
		User user=userService.findUser(loginId,loginPassword);
		
		if(user!=null){
			if ("1".equals(user.getUserStatus().trim())) {
				request.getSession().setAttribute("user", user);
				//日志记录
				Log log = new Log();
				log.setUserId(loginId);
				log.setCheckinTime(new Date());
				
				long logId= logService.addLog(log);//添加日志
				request.getSession().setAttribute("logId",logId);
				
				response.sendRedirect("../user/initdata.do");//调用初始化数据
			}else {
				request.setAttribute("err", "账号被禁用，请联系管理员");
				request.getRequestDispatcher("../login.jsp").forward(request, response);
			}
			
		}else{
			PrintWriter out=response.getWriter();
			out.println("<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\">");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('用户名或密码有误，请重新输入！');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			out.close();
		}
		
	}
	/**
	 * 登出,退出
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session= request.getSession();
		Long logId= (Long)session.getAttribute("logId");
		
		if(logId!=null){
			//更新登出时间
			Log log = new Log();
			log.setCheckoutTime(new Date());
			logService.updateCheckoutTime(logId,log);
		}
		session.invalidate();
		
		response.sendRedirect(request.getContextPath()+"/login.jsp");
	}
	/**
	 * 获得用户能操作的模块(大模块)
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void initdata(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//1.从session中获得用户
		User user=(User) request.getSession().getAttribute("user");
		
		if(user!=null){//登录状态
			//2.根据用户的岗位id获得用户能操作的模块
			List<Function> list=userService.findFunctionsByJobId(user.getJobId());
			System.out.println("list:"+list);
			request.getSession().setAttribute("functions", list);
			
			//3.根据用户，根据模块id(funcId)获得左侧列表:子模块列表
			List<Xtymb> list2=userService.leftList(user, list.get(0).getFuncId());
			
			request.getSession().setAttribute("leftList", list2);
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		}else{//未登录
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}	
		
	}
	/**
	 * 获得左侧列表(根据用户，根据模块id:funcId 获得左侧列表)
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void leftList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//1.获得模块id
		long funcId = Long.parseLong(request.getParameter("funcId"));
		//2.从session中获得用户
		User user=(User) request.getSession().getAttribute("user");
		//3.根据用户，根据模块id(funcId)获得左侧列表:子模块列表
		List<Xtymb> list=userService.leftList(user, funcId);
		
		request.getSession().setAttribute("leftList", list);
		request.getRequestDispatcher("/left.jsp").forward(request, response);
		
	}
	/**
	 * 用户列表
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
//	public void userList(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
//		String curpage=request.getParameter("curpage");//当前页
//		//1.查出用户列表页面要显示的数据
//		Pageinfo<UserModel> data=userService.userList(curpage);
//		
//		//2.把数据放放request
//		request.setAttribute("pageinfo", data);
//		//3.转发到用户列表页面
//		request.getRequestDispatcher("/jsp/user/userlist.jsp").forward(request, response);
//	}
	public void userList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 获得用户提交的数据
		String curpage=request.getParameter("curpage");//当前页
		String loginId=request.getParameter("loginId");
		String username=request.getParameter("username");
		//1.查出用户列表页面要显示的数据
		User user = new User();
		user.setLoginId(loginId);
		user.setUserName(username);
		Pageinfo<UserModel> data=userService.userList(curpage, user);
		
		//2.把数据放放request
		request.setAttribute("pageinfo", data);
		request.setAttribute("userSearch", user);
		//3.转发到用户列表页面
		request.getRequestDispatcher("/jsp/user/userlist.jsp").forward(request, response);
	}
	/**
	 * 跳转到新增用户页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void toAddUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1.查出所有部门
		List<Department> depts = userService.findAllDepartment();
		// 2.查出所有的岗位
		List<Job> jobs = userService.findAllJob();
		// 3.放入request
		request.setAttribute("depts", depts);
		request.setAttribute("jobs", jobs);
		// 4.跳转到新增用户页面
		request.getRequestDispatcher("/jsp/user/usernew.jsp").forward(request, response);
	}
	/**
	 * 新增用户
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获得用户提交的数据
		String loginId=request.getParameter("users.loginId");
		String password=request.getParameter("users.loginPassword");
		String userName=request.getParameter("users.userName");
		
		
		Long departmentId=Long.parseLong(request.getParameter("departmentId"));
		Long jobId=Long.parseLong(request.getParameter("jobId"));
		String userStatus=request.getParameter("users.userStatus");
		//2.调用service保存用户
		User user=new User(loginId, jobId, departmentId, password, userName, userStatus);
		userService.addUser(user);
		//3.跳转页面
		request.getRequestDispatcher("userList.do").forward(request, response);

		
	}
	/**
	 * 删除用户
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void deleteUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1.获得loginId
		String loginId = request.getParameter("loginId");
		// 2.根据loginId删除用户
		userService.deleteUser(loginId);
		// 3.跳转页面
		request.getRequestDispatcher("userList.do").forward(request, response);
	}
	/**
	 * 跳转到修改用户页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void toUpdateUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1.获得loginId
		String loginId = request.getParameter("loginId");
		// 2.根据loginId获得用户信息
		User user=userService.findUser(loginId);
		//3.获得所有的部门
		List<Department> depts=userService.findAllDepartment();
		// 4.获得所有的岗位
		List<Job> jobs = userService.findAllJob();
		// 5.放入request
		request.setAttribute("user0", user);
		request.setAttribute("depts", depts);
		request.setAttribute("jobs", jobs);
		// 6.跳转到用户修改页面
		request.getRequestDispatcher("/jsp/user/userupdate.jsp").forward(request, response);
	}
	/**
	 * 修改用户
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void updateUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1.获得用户提交的数据
		String loginId = request.getParameter("users.loginId");
		String loginPassword = request.getParameter("users.loginPassword");
		String userName = request.getParameter("users.userName");
		Long departmentId = Long.parseLong(request.getParameter("departmentId"));
		Long jobId = Long.parseLong(request.getParameter("jobId"));
		String userStatus = request.getParameter("users.userStatus");
		// 2.修改用户信息
		User user = new User(loginId, jobId, departmentId, loginPassword, userName, userStatus);
		userService.updateUser(user);
		// 3.跳转到用户列表页面
		request.getRequestDispatcher("userList.do").forward(request, response);
	}
	/**
	 * 修改用户状态
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void updateUserState(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1.获得loginId和用户状态
		String loginId = request.getParameter("loginId");
		String userStatus = request.getParameter("userStatus");
		// 2.修改用户状态
		userService.updateUserStatus(loginId, userStatus);
		// 3.跳转到用户列表页面
		request.getRequestDispatcher("userList.do").forward(request, response);
	}
	
}
