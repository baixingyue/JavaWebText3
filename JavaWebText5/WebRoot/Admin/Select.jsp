<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
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
<center><h1>查询商品信息</h1></center>
<hr>
<FORM action="SelectDate.jsp" method="post">
		<table width="50%"  align="center">
		
	    <tr>
	    <td align="center">name
	    <td><input type="text" name ="name">
	    </tr>
		<tr>
	    <td align="center">info
	    <td><input type="text" name ="info">
	    </tr>		
		<tr>
	    <td align="center">price
	    <td><input type="text" name ="price" onkeydown=if(event.keyCode==13)event.keyCode=9 onkeyup="value=value.replace(/[^0-9- ]/g,'');" maxLength=11 onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
	    </tr>		
				
		</table>
		<center><Input Type="submit" value="提交">       <Input Type="reset" value="重置"></center>
	</FORM>
	</div>
</body>
</html>
