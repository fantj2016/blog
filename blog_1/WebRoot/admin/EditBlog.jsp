<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="com.tyut.Blog" %>
<%@ page import="com.tyut.Category" %>
<%@include file="header.jsp" %>
<script type="text/JavaScript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
 			var attime;
  		function clock(){
    	   	var time=new Date();  
    		var HH = time.getHours();
    			if(HH<10){HH = "0"+HH}
    		var MM = time.getMinutes();
    			if(MM<10){MM = "0" +MM}
    		var SS = time.getSeconds();
    			if(SS<10){SS = "0"+SS}
  		    var ww = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
    		var neww = time.getDay();
    		attime="北京时间:  "+ HH+":"+MM+":"+SS+":"+" "+ww[neww] ;
    		document.getElementById("clock").value = attime;
 	   }
  		var timer = setInterval(clock,1000);
</script>
</head>
<% Blog blog = (Blog)request.getAttribute("blog"); %>

	<h3>请修改你的博文</h3>
	<p><a href ="/blog_1/GetBlogListServlet">查看博文内容</a></p>
	<form id="form1" name="form1" method="post"
		action="/blog_1/PostEditBlogServlet">
		<input type="hidden" name="id" value="<%=blog.getId()%>">
		<table width="540" border="0">
			<tbody>
				<tr>
					<td width="56">主题：</td>
					<td width="474"><input name="title" type="text" id="title"
						size="60" value="<%= blog.getTitle() %>"></td>
				</tr>
				<tr>
					<td height="42">类别：</td>
					<td><label for="category"></label> 
					<select name="category" id="select">
							<%
								List list = (List) request.getAttribute("category");
								for (int i = 0; i < list.size(); i++) {
									Category c = (Category) list.get(i);
							%>
							<option value="<%=c.getId()%>"><%=c.getName()%></option>
							<%
								}
							%>
							<option value="<%=blog.getCategoryId()%>" selected><%=blog.getCategory() %></option>
					</select>

				</tr>
				<tr>
					<td height="37">内容：</td>
					<td><textarea name="content" cols="60" rows="8" maxlength="60"
							id="content"><%=blog.getContent() %></textarea> <script type="text/javascript">CKEDITOR.replace('content'); CKEDITOR.editorConfig = 'Basic';</script>
					</td>
				</tr>
				<tr>
					<td><input type="reset" name="reset" id="reset" value="重置"></td>
					<td>
						<blockquote>
							<blockquote>
								<blockquote>
									<p>
										<input type="submit" name="submit2" id="submit2" value="提交">
										</
								</blockquote>
							</blockquote>
						</blockquote>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<input type="text" id="clock" size="20" />
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</form>
<%@ include file="footer.jsp"%>