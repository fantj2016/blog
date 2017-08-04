package com.tyut;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import com.tyut.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if(method==null){
			method="";
		}else if(method.equals("login")){
			login(request,response);
		}else if(method.equals("logout")){
			logout(request,response);
		}else if(method.equals("change")){
			change(request, response);
		}
	}
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String sql = "select id,username,password from users where username=? and password=?";
		String params[] = { username, password };
		QueryRunner qr = DbHelper.getQueryRunner();
		User user = null;
		List list = null;
		try {
			list = (List) qr.query(sql,new BeanListHandler(User.class), params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (list.size() > 0) {
			user = (User) list.get(0);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			System.out.println(user.getUsername());
			System.out.println(user.getPassword());
			request.getRequestDispatcher("/admin/admin.jsp").forward(request,
					response);
		} else {
			request.setAttribute("message", "用户名或者密码不正确!");
			request.getRequestDispatcher("/admin/login.jsp").forward(request,
					response);
		}

	}
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("/blog_1");
	}
	public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("change");
		PrintWriter out = response.getWriter();
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String reNewPassword = request.getParameter("reNewPassword");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(!oldPassword.equals(user.getPassword())){
			out.print("你的原密码有误");
		}else 
		
			if(!newPassword.equals("reNewPassword")){
			out.print("你两次密码输入不同");
		}else{
			String sql = "update users set password=? where id=?";
			String params[]={newPassword,user.getId().toString()};
			QueryRunner qr = DbHelper.getQueryRunner();
			try {
				qr.update(sql,params);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("message", "修改成功！");
			request.getRequestDispatcher("/admin/changePassword.jsp").forward(request, response);
			
		}
	}
}
