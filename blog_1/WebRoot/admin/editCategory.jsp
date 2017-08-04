<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tyut.Category" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加分类信息</title>
</head>
<% Category category = (Category)request.getAttribute("category"); %>
<body>
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
	<p>修改博客的分类</p>
	<form id="form1" name="form1" method="post" action="/blog_1/CategoryServlet">
		<input type="hidden" name="method" value="update"/>
		<input type="hidden" name="id" value="<%=category.getId() %>"/>
		<table width="425" border="0">
			<tr>
				<td width="120">分类名称：</td>
				<td width="289"><label for="textfield"></label> <input
					type="text" name="name" value="<%=category.getName() %>" /></td>
			</tr>
			<tr>
				<td>分类显示顺序：</td>
				<td><label for="textfield2"></label> <input name="level"
					type="text" value="<%=category.getLevel() %>" size="2" maxlength="2" /></td>
			</tr>
			<tr>
				<td><input type="submit" name="button" id="button" value="提交" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><a href="http://localhost:8080/blog_1/CategoryServlet?method=list">分类列表</a></td>
			</tr>
		</table>
	</form>
	<p>&nbsp;</p>
</body>
</html>
