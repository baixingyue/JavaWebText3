<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<script language=javascript>
   function out(obj){
   var i = obj ;
   if(i==0)
document.location.href="http://localhost:8080/JavaWebText5/User/produceIndex.jsp";
document.body.innerHTML=i;
i--;
setTimeout("out("+i+")",1000);
}
</script>
<!-- Page title -->
<title>Login-user-success</title>
<!-- End of Page title -->
<!-- Libraries -->
<link type="text/css" href="css/login.css" rel="stylesheet" />
<link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html"
	rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/easyTooltip.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
<!-- End of Libraries -->
</head>
<body onload="out(5)">
	<div id="container">
		<div class="logo">
			<a href="#"><img src="assets/logo.png" alt="" /></a>
		</div>
		<div id="box">

			欢迎您,<font color="red"><s:property value="username" /></font>登录成功！
			<div>即将进入商品系统！</div>
		</div>
	</div>
</body>
</html>
