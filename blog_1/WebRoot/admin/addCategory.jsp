<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="header.jsp" %>
	<p>输入博客的分类</p>
	<form id="form1" name="form1" method="post" action="/blog_1/CategoryServlet">
		<input type="hidden" name="method" value="add"/>
		<table width="425" border="0">
			<tr>
				<td width="120">分类名称：</td>
				<td width="289"><label for="textfield"></label> <input
					type="text" name="name" id="name" /></td>
			</tr>
			<tr>
				<td>分类显示顺序：</td>
				<td><label for="textfield2"></label> <input name="level"
					type="text" id="level" size="2" maxlength="2" /></td>
			</tr>
			<tr>
				<td><input type="submit" name="button" id="button" value="提交" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><a href="/blog_1/CategoryServlet?method=list">分类列表</a></td>
			</tr>
		</table>
	</form>
<%@include file="footer.jsp" %>
