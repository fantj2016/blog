<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tyut.Blog"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%
	List list = (List) request.getAttribute("list");
	Blog blog = (Blog)list.get(1);
%>
<title></title>
</head>
<body>
	<%for(int i=0;i<list.size();i++){ 
	blog = (Blog)list.get(i);%>
	 <table width="962" height="163" border="0">
		<tr>
			<td height="40"><%=blog.getCreatedTime()%></td>
		</tr>
		<tr>
			<td height="40"><a href="http://127.0.0.1:8080/blog_1/GetBlogServlet?id=<%=blog.getId()%>"> <%=blog.getTitle()%>
			</a></td>
		</tr>
		<tr>
			<td height="38">
			<%
				String source = blog.getContent();
				int length = 0;
				if(source.length()<68){
					length = source.length();
				}
				String newsource = source.substring(0,length);
				
				out.print(newsource+"...");
			%>
			</td>
		</tr>
		<tr>
			<td height="35">&nbsp;</td>
		</tr>
	</table> 
	<p>&nbsp;</p>
<%} %>
</body>
</html>
