<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tyut.User"%>
<%-- <%
	User user = (User)session.getAttribute("user");
	System.out.print(user);
	out.print(user);
	if(user==null){
		request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
	}
 %> --%>
 
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link href="/blog_1/admin/style.css" type="text/css" rel="stylesheet">
<script type="text/JavaScript" src="admin/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div id="container">
		<div id="banner">
			<h1>老焦的博客</h1>
		</div>
		<div id="menu">
	<%-- 		欢迎，<% 
			if(user!=null){
					out.print(user.getUsername());
			} %>用户
 --%>			| <a href="/blog_1/PreAddBlogServlet">发博文</a> |
			<a href="/blog_1/AdminBlogListServlet">博文管理</a>
			| <a href="/blog_1/admin/addCategory.jsp">添加分类</a>
			| <a href="/blog_1/CategoryServlet?method=list">分类管理</a>
			| <a href="/blog_1/CommentServlet?method=list">评论管理</a>
			| <a href="/blog_1/admin/changePassword.jsp">修改密码</a> | <a
				href="/blog_1/UserServlet?method=logout">退出</a>
		</div>
		<br />
		<div id="main">