<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tyut.Comment" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@include file="header.jsp" %>
<script type="text/javascript">
	function del(){
		var msg="你确定删除吗？";
		if(confirm(msg)==true){
			return true;
		}else{
			return false;
		}
	}
</script>
<h3 align="center">评论内容管理</h3>

<table width="788" height="206" border="1">
  <tr>
    <td width="176">编号：</td>
    <td width="181">评论人：</td>
    <td width="199">内容：</td>
    <td width="137">时间：</td>
    <td width="129">操作：</td>
  </tr>
  <%
  	 List list =(List)request.getAttribute("list"); 
  	 Comment c=null;
  	 for(int i=0;i<list.size();i++){
  	 	c =(Comment)list.get(i);
  %>
  <tr>
    <td><%=c.getId() %></td>
    <td><%=c.getUsername() %></td>
    <td><%=c.getContent() %></td>
    <td><%=c.getCreatedtime() %></td>
    <td><a href="/blog_1/CommentServlet?method=edit&id=<%=c.getId()%> ">修改</a>|
    	<a href="/blog_1/CommentServlet?method=delete&id=<%=c.getId()%>" onclick="javascript:return del();">删除</a></td>
  </tr>
  <%} %>
</table>
<%@include file="footer.jsp" %>