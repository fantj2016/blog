<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Edit Result</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%=request.getAttribute("message") %><br>
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
  </body>
</html>
