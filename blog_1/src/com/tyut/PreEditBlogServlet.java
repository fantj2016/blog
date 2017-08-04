package com.tyut;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
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
 * Servlet implementation class PreEditBlogServlet
 */
public class PreEditBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PreEditBlogServlet() {
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
			QueryRunner qr = DbHelper.getQueryRunner();
			List list = null;
			Blog blog = null;
			String sql = null;
			try {
				// 查询语句
				sql = "select b.id,title,content,name as category,category_id as categoryid from blog b,category c where b.id=" + id;
				list = (List) qr.query(sql, new BeanListHandler(Blog.class));
				blog = (Blog) list.get(0);
			} catch (Exception e) {
				e.printStackTrace();
			}
			List category = null;
			sql="select id,name,level from category ORDER BY level DESC";
			try {
				category = (List)qr.query(sql, new BeanListHandler(Category.class));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("category", category);
			request.setAttribute("blog", blog);
			request.getRequestDispatcher("/admin/EditBlog.jsp").forward(request, response);
		}
	//}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
