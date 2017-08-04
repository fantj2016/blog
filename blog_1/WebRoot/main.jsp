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
<EMBED src="background.mp3" width=0 height=0 type=audio/mpeg loop="-1" autostart="true" volume="0"></EMBED>
</head>
<body>
<div id="container">	
	<div id="banner">
		<h1><a href="/blog_1/">老焦的博客</a></h1><br />
		<a href="/blog_1/">http://www.goujiabi.cn</a><br />
		<span style="float:right;">---争做最好的自己。</span>
	</div>

<div id="center">
<div class="content">
    <!-- list blog begin  -->
    <%
    	List list = (List)request.getAttribute("list");
    	Blog blog = null;
    	for(int i=0;i<list.size();i++){
    		blog = (Blog)list.get(i);
     %>
   	<h2><%=blog.getCreatedTime() %></h2>
    <div class="entry">
	    <a id="6"></a>	
		<h2><a href="/blog_1/GetBlogServlet?id=<%=blog.getId()%>" ><%=blog.getTitle() %></a></h2>
			<%
				String source =blog.getContent();
				int length =200;
				if(source.length()<200){
					length = source.length();
				}
					String newString =source.substring(0,length);
					out.print(newString+".....");
				
			%>
		<p class="posted"><%=blog.getCreatedTime() %><a href="/blog_1/GetBlogListServlet?cid=<%=blog.getCategoryId()%>"><%=blog.getCategory() %></a> | 
		<a href="/blog_1/GetBlogServlet?id=<%=blog.getId()%>">评论</a></p>
    </div>
<%} %>
	<!-- 产生分页的连接-->
   	&nbsp; 1/2 &nbsp;<a href="tm?method=h&p=2">&gt;&gt;</a>
 <!-- end list -->	

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
  	for(int i=0;i<list.size();i++){
  		blog = (Blog)list.get(i);
   %>
	    <li><a href="/blog_1/GetBlogServlet?method=get&id=<%=blog.getId()%>"><%=blog.getTitle() %></a></li>
<%} %>
      </ul>
  	    <h2>最近的评论</h2>
	  <ul>		
	  <%
	  	List list3 = (List)request.getAttribute("list3");
	  	Comment comment = null;
	  	for(int i=0;i<list3.size();i++){
	  		comment = (Comment)list3.get(i);
	   %>
	    <li><a href="/blog_1/GetBlogServlet?method=get&id=<%=comment.getBlogId()%>" ><%=comment.getContent() %></a></li>
        <%} %>
      </ul>
  	   	
</div><!-- end sidebar -->	
</div><!-- end right -->
</div><!-- end container -->
</body>
</html>
