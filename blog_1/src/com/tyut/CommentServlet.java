package com.tyut;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommentServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//		HttpSession session = request.getSession();
//		User user = (User) session.getAttribute("user");
//		if (user == null) {
//			response.sendRedirect("/blog_1/admin/login.jsp");
//		} else {
			String method = request.getParameter("method");
			if (method == null) {
				method = "";
			} else if (method.equals("add")) {
				add(request, response);
			} else if (method.equals("list")) {
				list(request, response);
			} else if (method.equals("delete")) {
				delete(request, response);
			} else if (method.equals("edit")) {
				preEdit(request, response);
			} else if (method.equals("update")) {
				postEdit(request, response);
			}

		}
//	}

	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("name");
		String content = request.getParameter("content");
		String blog_id = request.getParameter("blog_id");
		if (username == null | username.equals(null)) {
			username = "匿名";
		}
		String sql = "insert into comment (username,content,blog_id,createdtime) values(?,?,?,now())";
		String params[] = { username, content, blog_id };
		QueryRunner qr = DbHelper.getQueryRunner();
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 跳转
		//request.getRequestDispatcher("/GetBlogServlet?id="+blog_id).forward(request, response);
		response.sendRedirect("/blog_1/GetBlogServlet?id="+blog_id);
	}

	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "select id,username,content,createdtime from comment order by id desc";
		QueryRunner qr = DbHelper.getQueryRunner();
		List list = null;
		try {
			list = (List) qr.query(sql, new BeanListHandler(Comment.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/adminCommentList.jsp").forward(request, response);
	}

	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String sql = "delete from comment where id=" + id;
		QueryRunner qr = DbHelper.getQueryRunner();
		try {
			qr.update(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		list(request, response);
	}

	public void preEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String sql = "select id,username,content from comment where id=" + id;
		QueryRunner qr = DbHelper.getQueryRunner();
		Comment comment = null;
		try {
			List list = (List) qr.query(sql, new BeanListHandler(Comment.class));
			comment = (Comment) list.get(0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("comment", comment);
		request.getRequestDispatcher("/admin/editComment.jsp").forward(request, response);
	}

	public void postEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String content = request.getParameter("content");

		String sql = "update comment set username=?,content=? where id=?";
		String params[] = { username, content, id };
		QueryRunner qr = DbHelper.getQueryRunner();
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		list(request, response);
	}
}
