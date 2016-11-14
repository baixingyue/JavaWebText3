<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" import="java.sql.*"
	%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>添加商品信息</title>
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
	<form action="add.jsp" method="post">
		<table width="50%" border="1" align="center">
			<CAPTION>添加商品信息</CAPTION>
			<tr>
				<th width="30%">商品名：</th>
				<td width="70%"><input name="productname" type="text"></td>
			</tr>
			<tr>
				<th>商品类型：</th>
				<td><input name="producttype" type="text"></td>
			</tr>
			<tr>
				<th>商品描述</th>
				<td><input name="productinfo" type="text"></td>
			</tr>
			<tr>
				<th>商品价格</th>
				<td><input name="productprice" type="text">元</td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" name="submit" value="添加">
					<input type="reset" value="重置"></th>
			</tr>
		</table>
	</form>
	<jsp:useBean id="db" class="util.userConn" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		String submit = request.getParameter("submit");
		if (submit != null && !submit.equals("")) {
			String productname = request.getParameter("productname");
			String producttype = request.getParameter("producttype");
			String productinfo = request.getParameter("productinfo");
			String Strproductprice = request.getParameter("productprice");
			int productprice = Integer.valueOf(Strproductprice);
			String sql = "insert into t_product(product_name,product_type,product_info,product_price) value('"
					+ productname + "','" + producttype + "','" + productinfo + "','" + productprice + "');";
			int i = db.executeUpdate(sql);
			if (i == 1) {
				out.println("<script language='javaScript'>alert('添加成功确定跳转到主页！');</script>");
				request.getRequestDispatcher("produceManager.jsp").forward(request, response);
			} else {
				out.println("<script language='javaScript'>alert('添加失败，单击确定返回添加页面');</script>");
				response.setHeader("refresh", "1;url=add.jsp");
			}
			db.close();
		}
	%>
		</div>
</body>
</html>
