<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Vip管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/index.css" type="text/css">
</head>

<body>
	<div id="top"> 
		<div id="topleft">
			<h2>商场VIP管理系统</h2>
		</div>
		<div id="topright">
		<s:property value="#session.us.username"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="outAction!logout.action" style="color: white;">退出</a>&nbsp;&nbsp;
		</div>
	</div>
	<div id="main">
		<div id="left">
			<jsp:include page="menu.jsp" flush="true"></jsp:include>
		</div>
		<div id="right">
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<h3 style="color: red; display:inline;">欢迎使用vip管理系统</h3>
		</div>
	</div>
</body>
</html>
