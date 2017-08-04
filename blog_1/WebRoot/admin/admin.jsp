<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tyut.User"%>

<!DOCTYPE html>
<html>
<title>用户管理</title>
<head>

<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link href="/blog_1/admin/style.css" type="text/css" rel="stylesheet">
<script type="text/JavaScript" src="admin/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div id="container">
		<div id="banner">
			<h1>老焦的博客</h1>
		</div>
		<%
	User user =(User)session.getAttribute("user");
	if (user != null) {
		out.print("欢迎，" + user.getUsername());
	}
%>
		<div id="menu">
			| <a href="/blog_1/PreAddBlogServlet">发博文</a> |
			<a href="/blog_1/AdminBlogListServlet">博文管理</a>
			| <a href="/blog_1/admin/addCategory.jsp">添加分类</a>
			| <a href="/blog_1/CategoryServlet?method=list">分类管理</a>
			| <a href="/blog_1/CommentServlet?method=list">评论管理</a>
			| <a href="">修改密码</a> | <a
				href="/blog_1/UserServlet?method=logout">退出</a>
		</div>
		<br />
</head>

<body>
	<!--  <table width="200" border="1" align="center" cellspacing="0">
		<tr>
			<td><a href="http://localhost:8080//blog_1/PreAddBlogServlet">发博文</a></td>
		</tr>
		<tr>
			<td><a href="http://localhost:8080//blog_1/AdminBlogListServlet">管理博文</a><a
				href="http://127.0.0.1:8080/blog_1/GetBlogListServlet"></a></td>
		</tr>
		<tr>
			<td><a href="http://localhost:8080/blog_1/admin/addCategory.jsp">添加分类</a></td>
		</tr>
		<tr>
			<td><a
				href="http://localhost:8080/blog_1/CategoryServlet?method=list">管理分类</a></td>
		</tr>
		<tr>
			<td><a
				href="http://localhost:8080/blog_1/CommentServlet?method=list">管理评论</a></td>
		</tr>
		<tr>
			<td><a href="http://127.0.0.1:8080/blog_1/GetBlogListServlet">查看博文</a></td>
		</tr>
		<tr>
			<td><a
				href="http://127.0.0.1:8080/blog_1/UserServlet?method=logout">退出系统</a></td>
		</tr>
	</table>-->
</body>
</html>
