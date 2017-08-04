package com.tyut;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

public class AddBlogServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddBlogServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 解决JSP接受中文参数乱码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 接受JSP页面提交的三个参数
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String categoryId = request.getParameter("category");
		// 通过他可以管理连接池，操作数据
		DataSource ds = null;
		int result = 0;
		try {
			// 获取数据源对象
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:/comp/env/jdbc/mysqlds");
			Connection conn = ds.getConnection();
			// 添加语句
			String sql = "insert into blog(title,content,category_id,created_time) values(?,?,?,now())";
			// 为SQL语句中的?设定参数
			String params[] = { title, content, categoryId };
			// dbutils 中核心类
			QueryRunner qr = new QueryRunner(ds);
			// 调用他的update 完成执行
			result = qr.update(sql, params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// String sql ="insert into
		// blog(title,content,category_id,created_time)
		// values(?,?,?,now())";
		// out.print("连接成功！");

		String message = "";
		if (result == 1) {
			message = "添加博文成功！";
		} else {
			message = "添加博文失败！";
		}
		request.setAttribute("message", message);
		request.getRequestDispatcher("/addResult.jsp").forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
