package com.tyut;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class GetBlogListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetBlogListServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int result = 0;
		DataSource ds = null;
		List list = null;
		String cid = request.getParameter("cid");
		String sql = null;
		if(cid!=null){
		sql = "select id,title,content,created_time as createdTime from blog where category_id=" + cid;
		}else{
		sql = "select b.id as id,title,content,created_time as createdTime,name as category,c.id as categoryid from blog b,category c where category_id=c.id order by b.id desc limit 0,4";
		}
		QueryRunner qr = DbHelper.getQueryRunner();
		try {
			list = (List) qr.query(sql, new BeanListHandler(Blog.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		sql="select id,name from category order by level desc,id desc";
		List list2 = null;
		try {
			list2 = qr.query(sql, new BeanListHandler(Category.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql="select id,username,content,blog_id as blogId from comment order by id desc limit 0,4";
		List list3 = null;
		try {
			list3 = (List)qr.query(sql, new BeanListHandler(Comment.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.getRequestDispatcher("/main.jsp").forward(request, response);
	}

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
