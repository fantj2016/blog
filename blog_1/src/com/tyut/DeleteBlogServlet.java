package com.tyut;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

/**
 * Servlet implementation class DeleteBlogServlet
 */
public class DeleteBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteBlogServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		User user = (User) session.getAttribute("user");
//		if (user == null) {
//			response.sendRedirect("/blog_1/admin/login.jsp");
//		} else {
			String id = request.getParameter("id");
			DataSource ds = null;
			try {
				Context context = new InitialContext();
				ds = (DataSource) context.lookup("java:/comp/env/jdbc/mysqlds");
				String sql = "delete from blog where id=" + id;
				QueryRunner qr = new QueryRunner(ds);
				qr.update(sql);
			} catch (Exception e) {
				System.out.println("数据源出错");
			}
			request.getRequestDispatcher("/AdminBlogListServlet").forward(request, response);
		}
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
