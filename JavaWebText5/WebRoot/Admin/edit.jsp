<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>修改商品信息</title>
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
	<jsp:useBean id="db" class="util.userConn" scope="page" />
	<%
		request.setCharacterEncoding("utf-8");
		String Strid = request.getParameter("id");
		int id = Integer.valueOf(Strid);
		ResultSet rs = db.executeQuery(
				"select product_id,product_name,product_type,product_info,product_price from t_product where product_id='"
						+ id + "';");
		rs.next();
	%>
	<form action="update.jsp" method="post">
		<table width="50%" border="1" align="center">
			<CAPTION>修改商品信息</CAPTION>
			<tr>
				<th width="30%">商品名：</th>
				<td width="70%"><input name="productname" type="text"
					value="<%=rs.getString("product_name")%>"></td>
			</tr>
			<tr>
				<th width="30%">商品类型：</th>
				<td width="70%"><input name="producttype" type="text"
					value="<%=rs.getString("product_type")%>"></td>
			</tr>
			<tr>
				<th width="30%">商品描述：</th>
				<td width="70%"><input name="productinfo" type="text"
					value="<%=rs.getString("product_info")%>"></td>
			</tr>
			<tr>
				<th width="30%">商品价格：</th>
				<td width="70%"><input name="productprice" type="text"
					value="<%=rs.getString("product_price")%>">元</td>
			</tr>
			<tr>
				<th colspan="2"><input type="hidden" name="id" value="<%=id%>">
					<input type="submit" value="修改"> <input type="reset"
					value="重置"></th>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>
