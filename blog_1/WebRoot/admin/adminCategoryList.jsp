<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tyut.Category" %>
<%@include file="header.jsp" %>
<% List list = (List)request.getAttribute("list");
	Category category = null;
 %>

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
    <p>博客分类管理
    </p>
    <table width="800" height="200" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td height="50">分类编号</td>
        <td>分类名称</td>
        <td>操作</td>
        <td>顺序</td>
      </tr>
      <%
      for(int i=0;i<list.size();i++){
      	category = (Category)list.get(i);
      	       %>
      <tr>
        <td height="31"><%=category.getId() %></td>
        <td><%=category.getName() %></td>
        
        <td><a href="CategoryServlet?method=edit&id=<%=category.getId()%>">修改</a>|
        	<a href="CategoryServlet?method=delete&id=<%=category.getId()%>" onclick="javascript:return predelete()">删除</a></td>
        <td><%=category.getLevel() %></td>
      </tr>
    <%} %>
    </table>
    <p>&nbsp;</p>
  </div>
</form>
<%@include file="footer.jsp" %>
