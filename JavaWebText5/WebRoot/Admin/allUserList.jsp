<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" import="java.sql.*"%>
<jsp:useBean class="util.userConn" id="jdbc" />
<html>
<head>
<title>用户信息列表</title>
		<link type="text/css" href="css/login.css" rel="stylesheet" />	
		<link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html" rel="stylesheet" />	
		<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="js/easyTooltip.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
</head>
<body>
<div id="container">
		<div class="logo">
			<a href="#"><img src="assets/logo.png" alt="" /></a>
		</div>
	<br />
	<br />
	<br />
	<center>
		<h2>用户信息表</h2>
		<table border bordercolor="blue">
			<th>编号
			<th>用户名
			<th>密码
			<th>姓名
			<th>性别
			<th>电话
			</tr>
			<%
				//获取表单信息
				String sql = "select user_id,user_username,password,user_name,user_sex,user_tele from t_user ;";
				ResultSet rs = jdbc.executeQuery(sql);
				while (rs.next()) {
			%>
			<tr>
			  
				<td align="center"><%=rs.getString("user_id")%>
				<td align="center"><%=rs.getString("user_username")%>
				<td align="center"><%=rs.getString("password")%>
				<td align="center"><%=rs.getString("user_name")%>
				<td align="center"><%=rs.getString("user_sex")%>
				<td align="center"><%=rs.getString("user_tele")%>
			</tr>
			<%
				}
				jdbc.close();
			%>
		</table>
		<center>
		<a href="AdminFunction.jsp">返回</a>
	</center>
	</center>
	</div>
</body>
</html>