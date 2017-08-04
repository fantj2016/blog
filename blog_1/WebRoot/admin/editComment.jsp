<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tyut.Comment"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>评论修改</title>
</head>

<body>
	<%
		Comment c = null;
		c = (Comment) request.getAttribute("comment");
	%>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link href="/blog_1/admin/style.css" type="text/css" rel="stylesheet">
	<div id="container">
		<div id="banner">
			<h1>老焦的博客</h1>
		</div>
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
		</div>
	<form name="form1" method="post" action="/blog_1/CommentServlet">
		<input type="hidden" name="method" value="update" /> <input
			type="hidden" name="id" value="<%=c.getId()%>" />

		<table width="683" border="1">
			<tr>
				<td width="115">评论人：</td>
				<td width="552"><label for="name"></label> <input type="text"
					name="username" size="20" value="<%=c.getUsername()%>" /></td>
			</tr>
			<tr>
				<td>内容：</td>
				<td><textarea name="content" cols="80" rows="10"><%=c.getContent()%></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" name="button" id="button" value="提交" /></td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
</body>
</html>
