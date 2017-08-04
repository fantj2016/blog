<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tyut.Blog" %>
<%@ page import="com.tyut.Category" %>
<%@ page import="com.tyut.Comment" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>老焦的博客</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="play.css" />
</head>
<body>
<div id="container">	
	<div id="banner">
		<h1><a href="/blog">老焦的博客</a></h1>
	</div>

<div id="center">
<div class="content">
	<%
		Blog blog = (Blog) request.getAttribute("blog");
	%>
	<%
		List list = (List) request.getAttribute("commentList");
		Comment comment = null;
	%>
	<table width="800" height="648" border="0">
		<tr>
			<td width="800" height="59" align="center">

				<p>
				<%=blog.getTitle() %>
				</p>

			</td>
		</tr>
		<tr>
			<td height="364"><%=blog.getContent()%></td>
		</tr>
		<tr>
			<td height="111"><%=blog.getCreatedTime()%></td>
		</tr>
		<tr>
			<td height="58">&nbsp;</td>
		</tr>
	</table>
	<tr>
		<td height="111">
			<%
				for (int i = 0; i < list.size(); i++) {
					 comment = (Comment)list.get(i);
			%>
			<table width="681" border="1">
				<tr>
					<td><%=comment.getUsername()%>：的评论</td>
				</tr>
				<tr>
					<td><%=comment.getContent()%></td>
				</tr>
				<tr>
					<td>评论时间：<%=comment.getCreatedtime() %></td>
				</tr>
			</table> 
			<%
 				}
			 %>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
		</td>
	</tr>
	<tr>
		<td height="104">
			<form name="form1" method="post" action="/blog_1/CommentServlet">
				<input type="hidden" name="method" value="add" /> <input
					type="hidden" name="blog_id" value="<%=blog.getId()%>" />

				<table width="425" border="1">
					<tr>
						<td width="115">评论人：</td>
						<td width="425"><label for="name"></label> <input name="name"
							type="text" id="name" size="20" /></td>
					</tr>
					<tr>
						<td>内容：</td>
						<td><textarea name="content" cols="55" rows="10"></textarea></td>
					</tr>
					<tr>
						<td><input type="submit" name="button"  value="提交" 
						style="border:1px;font-size:18px;margin-top:10px;background-color:#b788b6;"/></td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</form>

<br clear="all" />
</div><!-- end content -->
</div><!-- end center -->

<div id="right">
<div class="sidebar">
        <ul>
        <div class="new">
    	<li><h3 style="color:#804000">欢迎大家来唠嗑！</h3></li>
    	<li><a href="/blog_1/PreAddBlogServlet">我要上墙！</a></li>
    	<li><a href="/blog_1/admin/login.jsp">我要管理！</a></li>
    	 </div>
      </ul>
  	     <h2>分类</h2>
   <ul>	
   <div class="new">	
	<li><a href="/blog_1/GetBlogListServlet">全部</a></li>
	<%
		List list2 = (List)request.getAttribute("list2");
		Category category = null;
		for(int i=0;i<list2.size();i++){
			category = (Category)list2.get(i);
	 %>
	    <li><a href="/blog_1/GetBlogListServlet?cid=<%=category.getId()%>"><%=category.getName() %></a></li>
<%} %>
</div>
       </ul>

  	    <h2>最近的主题</h2>
  <ul>		
  <%
  List list4 = (List)request.getAttribute("list");
  	for(int i=0;i<list4.size();i++){
  		blog = (Blog)list4.get(i);
   %>
	    <li><a href="/blog_1/GetBlogServlet?method=get&id=<%=blog.getId()%>" target="_blank"><%=blog.getTitle() %></a></li>
<%} %>
      </ul>
  	    <h2>最近的评论</h2>
	  <ul>		
	  <%
	  	List list3 = (List)request.getAttribute("list3");
	  	Comment c = null;
	  	for(int i=0;i<list3.size();i++){
	  		c = (Comment)list3.get(i);
	   %>
	    <li><a href="/blog_1/GetBlogServlet?method=get&id=<%=c.getBlogId()%>" target="_blank"><%=c.getContent() %></a></li>
        <%} %>
      </ul>
  	   	
</div><!-- end sidebar -->	
</div><!-- end right -->
</div><!-- end container -->
</body>
</html>

