<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%-- <%@ include file="header.jsp" %> --%>
<%@ page import="java.util.*,com.tyut.*"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link href="/blog_1/admin/style.css" type="text/css" rel="stylesheet">
<script type="text/JavaScript" src="admin/ckeditor/ckeditor.js"></script>
<style type="text/css">
	h3{
	font-size:12px;font-family:"微软雅黑";color:#666;
	}
	input{
	border-radius:10px;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="banner">
			<h1>老焦的博客</h1>
		</div>
<%@ page import="com.tyut.User"%>
		<script type="text/JavaScript" src="admin/ckeditor/ckeditor.js"></script>
		<h2>发表博文</h2>
		<form id="form1" name="form1" method="post"
			action="/blog_1/servlet/AddBlogServlet">
			<table id="tab">
				<tr>
					<td width="100"><h3>主题：</h3></td>
					<td width="474"><input name="title" type="text" id="title"
						size="60"></td>
				</tr>

				<tr>
					<td height="42"><h3>类别：</h3></td>
					<td><label for="category"></label> <select name="category">
							<%
								List list = (List) request.getAttribute("list");
								for (int i = 0; i < list.size(); i++) {
									Category c = (Category) list.get(i);
							%>
							<option value="<%=c.getId()%>">
							<h3><%=c.getName()%></h3>
							</option>
							<%
								}
							%>
					</select>
				</tr>


				<tr>
					<td height="20" width="200"><h3>内容：</h3></td>
					<td><textarea name="content" cols="60" rows="80" maxlength="60"
							id="content" ></textarea> <script type="text/javascript">CKEDITOR.replace('content');
								CKEDITOR.editorConfig = 'Basic';
							</script></td>
				</tr>
				</tr>

				<tr>
					<td colspan="2"><input type="submit" name="submit2"
						 value="提交" style="border:1px;font-size:18px;background-color:#ff00ff;float:right;" ></td>
						 
				</tr>
			</table>
		</form>
<%@include file="footer.jsp" %>
