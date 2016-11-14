<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" import="java.sql.*"%>
<jsp:useBean class="util.userConn" id="jdbc" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" dir="ltr">
<head>
<link rel="stylesheet" type="text/css" href="css.css" />
<title>iCart 在线购物</title>
</head>
<body>
<div class="menu">
<ul>
<li style="width:0px;"><a></a></li>
<li class="active"><a href="noLogin.jsp" class="home">主页</a></li>
<li><a href="noLogin_browse_product.jsp" class="wishlist">查看全部商品</a></li>
<li><a class="checkout">Checkout</a></li>
<li style="float:right;"><a href="http://localhost:8080/JavaWebText5/Login/wonderfulLogin.jsp" class="login">Login</a></li>
<li style="float:right;"><a href="http://localhost:8080/JavaWebText5/Login/register.html" class="register">注册新账户</a></li>
</ul>
</div>

	<center>
		<h2>商品信息表</h2>
		<table border bordercolor="blue">
			<th>编号
			<th>商品名
			<th>商品类型
			<th>商品描述
			</tr>
			<%
				//获取表单信息
				String sql = "select product_id,product_name,product_type,product_info from t_product ;";
				ResultSet rs = jdbc.executeQuery(sql);
				while (rs.next()) {
			%>
			<tr>
			  
				<td align="center"><%=rs.getString("product_id")%>
				<td align="center"><%=rs.getString("product_name") %>
				<td align="center"><%=rs.getString("product_type")%>
				<td align="center"><%=rs.getString("product_info")%>
			</tr>
			<%
				}
				jdbc.close();
			%>
		</table>
	</center>
</body>
</html>