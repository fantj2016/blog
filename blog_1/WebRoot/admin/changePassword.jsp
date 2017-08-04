<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="header.jsp" %>
<% 
	String message = (String)request.getAttribute("message");
	out.print(message);
 %>
<body>
	<p>修改密码：</p>
	<form id="form1" name="form1" method="post" action="/blog_1/UserServlet">
	<input type="hidden" name="method" value="change">
		<table width="752" border="1">
			<tr>
				<td width="167">旧密码：</td>
				<td width="569"><label for="oldPassword"></label> <input
					name="oldPassword" type="password" id="oldPassword" size="20" /></td>
			</tr>
			<tr>
				<td>新密码：</td>
				<td><label for="newPassword"></label> <input name="newPassword"
					type="password" id="newPassword" size="20" /></td>
			</tr>
			<tr>
				<td>新密码：</td>
				<td><label for="reNewPassword"></label> <input
					name="reNewPassword" type="password" id="reNewPassword" size="20" /></td>
			</tr>
			<tr>
				<td><blockquote>
						<p>
							<input type="submit" name="button" id="button" value="提交" />
						</p>
					</blockquote></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
<%@include file="footer.jsp" %>
