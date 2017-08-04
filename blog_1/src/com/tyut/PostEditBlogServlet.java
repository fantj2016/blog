package com.tyut;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

/**
 * Servlet implementation class PostEditBlogServlet
 */
public class PostEditBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostEditBlogServlet() {
		super();
		// TODO Auto-generated constructor stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//		HttpSession session = request.getSession();
//		User user = (User) session.getAttribute("user");
//		if (user == null) {
//			response.sendRedirect("/blog_1/admin/login.jsp");
//		} else {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String id = request.getParameter("id");
			int result = 0;
			DataSource ds = null;
			try {
				String sql = "update blog set title=?,content=? where id=?";
				String params[] = { title, content, id };
				// 获取数据源对象
				Context context = new InitialContext();
				ds = (DataSource) context.lookup("java:/comp/env/jdbc/mysqlds");
				Connection conn = ds.getConnection();
				// 查询语句
				QueryRunner qr = new QueryRunner(ds);
				result = qr.update(sql, params);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String message = "";
			if (result == 1) {
				message = "更新成功！";
			} else {
				message = "修改失败";
			}
			request.setAttribute("message", message);
			request.getRequestDispatcher("/admin/EditResult.jsp").forward(request, response);
		}
	}
//}
