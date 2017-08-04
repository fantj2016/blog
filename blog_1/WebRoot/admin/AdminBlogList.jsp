<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tyut.Blog"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin page</title>
</head>

<% List list = (List)request.getAttribute("list");
	Blog blog = null;
 %>
<body><meta http-equiv="content-type" content="text/html;charset=UTF-8">
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
<script type="text/javascript">
	function predelete(){
		var message =confirm("你确定要删除吗?");
		if(message==true){
			return true;
		}else{
		 	return false;
		 	}
	}
</script>
<form id="form1" name="form1" method="post" action="">
  <div align="center">
    <p>博客文章管理
    </p>
    <table width="641" height="101" border="0">
      <tr>
        <td height="31">文章号</td>
        <td>文章主题</td>
        <td>操作</td>
      </tr>
      <%
      for(int i=0;i<list.size();i++){
      	blog = (Blog)list.get(i);
      	       %>
      <tr>
        <td height="31"><%=blog.getId() %></td>
        <td><%=blog.getTitle() %></td>
        <td><a href="PreEditBlogServlet?id=<%=blog.getId()%>">修改</a>|<a href="/blog_1/DeleteBlogServlet?id=<%=blog.getId()%>" onclick="javascript:return predelete()">删除</a></td>
      </tr>
    <%} %>
    </table>
    <p>&nbsp;</p>
  </div>
</form>
</body>
</html>

