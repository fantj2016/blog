<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	
	font-size:24px;
	font-family:"微软雅黑";
	font-color:#666;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="banner">
			<h1>老焦的博客</h1>
		</div>
<% String message=(String)request.getAttribute("message"); 
	if(message!=null){
		out.print("<font color='red'>"+message+"<font>");
	}
%>
<form  method="post" action="/blog_1/UserServlet">
<input type="hidden" name="method" value="login">
  <table width="481" border="0">
    <tr>
      <td width="172"><h3 ><font color="red">用户名：</font></h3></td>k 
      <td width="293"><label for="username"></label>
      <input type="text" name="username" id="username" /> </td>
    </tr>
    <tr>
      <td><h3 ><font color="red">密码：</font></h3></td>
      <td><label for="password"></label>
      <input type="password" name="password" id="password" /></td>
    </tr>
    <tr>
      <td><blockquote>
        <blockquote>
          <p>
            <input type="submit" name="注册" id="注册" value="注册" style=" font-size:18px; "/>
          </p>
        </blockquote>
      </blockquote></td>
      <td><blockquote>
        <blockquote>
          <p>
            <input type="submit" name="button" id="button" value="登录" style=" font-size:18px; "/>
          </p>
        </blockquote>
      </blockquote></td>
    </tr>
  </table>
</form>
<%@include file="footer.jsp" %>