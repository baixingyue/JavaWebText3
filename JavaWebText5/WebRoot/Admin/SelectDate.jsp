<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*" import="util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CheckUser</title>
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
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<div id="container">
		<div class="logo">
			<a href="#"><img src="assets/logo.png" alt="" /></a>
		</div>

		<br /> <br /> <br /> <br /> <br />
		<jsp:useBean id="bean" class="util.Conn" scope="session">
		</jsp:useBean>

		<%
			int count = 1;
		

			String name = request.getParameter("name");
			String info = request.getParameter("info");
			String price = request.getParameter("price");

					
					
			//		select * from t_product where product_type='apple' and product_info ='k' and product_price=2
					
					
					try {
						String sqlname = " product_type='" + name + "'  and ";
						String sqlinfo = "product_info ='" + info + "' and ";
						String sqlprice = " product_price=" + price;
						
						if (name == null || name.equals("")) {
							sqlname = "";
							if(info != null && !info.equals("")){
								
								if (price == null || price.equals("")){
									sqlinfo = "product_info ='" + info + "'  ";
								}
							}
						}
						
						if (name != null &&! name.equals("")) {
							
							if(info == null||info.equals("")){
								
								if (price == null || price.equals("")){
									sqlname=" product_type='" + name + "'  ";
								}
							}
						}
						
						if (info == null || info.equals("")) {
							sqlinfo = "";
							
						}
						if (price == null || price.equals("")) {
							sqlprice = "";
							if (name != null &&! name.equals("")) {
								if(info != null && !info.equals("")){
									sqlinfo = "product_info ='" + info + "'  ";
								}
							}
							
							
						}

						Connection con;
						Statement sql;
						ResultSet rs;

						con = bean.getCon();

						sql = con.createStatement();

						{
							String select = "select * from t_product where " + sqlname + sqlinfo + sqlprice;
				//			out.print(select);
System.out.print(select);
							//	sql.executeQuery(select);

							rs = sql.executeQuery(select);
							out.print("<center>");
							out.print("<font size=36 color=\"#7E3D76\">库存</font>");
							out.print("<table  border >");
							out.print("<tr>");
							out.print("<th width=100>" + "商品编号");
							out.print("<th width=100>" + "商品名称");
							out.print("<th width=100>" + "商品信息");
							out.print("<th width=100>" + "商品价格");
							out.print("<th width=100>" + "修改");
							out.print("<th width=100>" + "删除");
							out.print("</tr>");
							while (rs.next()) {
								out.print("<tr>");
								out.print("<td>" + count + "</td>");
								out.print("<td>" + rs.getString(2) + "</td>");
								out.print("<td>" + rs.getString(3) + "</td>");
								out.print("<td>" + rs.getString(4) + "</td>");
								out.print("<td><a href='Update.jsp?id="+ rs.getString(1) +"'>修改</a></td>");
								out.print("<td><a href='/MyJavaWeb-/servlet/DeleteServlet?id="+rs.getString(1)+"'>删除</a></td>");
								count++;
							}
							out.print("</table>");
							out.print("</center>");
                            out.print("<a href='produceManager.jsp'>返回</a>");
						}
						con.close();
					} catch (NumberFormatException e) {

					}
		%>




		<pre></pre>

	</div>
	</div>
</body>
</html>