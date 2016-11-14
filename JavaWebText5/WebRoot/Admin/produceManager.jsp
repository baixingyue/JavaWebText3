<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>商品管理系统</title>

		<link type="text/css" href="css/login.css" rel="stylesheet" />	
		<link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html" rel="stylesheet" />	
		<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="js/easyTooltip.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
		<a href="add.jsp">添加商品信息</a>
		<a href="Select.jsp">查询</a>
	</center>
	<p>
	<table align="center" width="75%" border="1">
		<tr>
			<td>商品名称
			<td>商品类型
			<td>商品描述
			<td>商品价格
			<td>管理 <jsp:useBean id="db" class="util.userConn"
					scope="page" /> <%
   String s="select product_id,product_name,product_type,product_info,product_price from t_product;";
   ResultSet rs=db.executeQuery(s);
   while(rs.next()){
   int id=rs.getInt(1);
   out.println("</tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getInt("product_price")+"元</td><td><a href='edit.jsp?id="+id+"'>修改</a>&nbsp;<a href='del.jsp?id="+id+"'>删除</a></td></tr>");
    }
    rs.close();
    db.close();
    %>
	</table>
	<center>
		<a href="AdminFunction.jsp">返回</a>
	</center>
	</div>
	
</body>
</html>
