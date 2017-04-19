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
			<div id="helpDiv">
				<ul>
					<li>管理员具有官网本系统的全部权限</li>
					<li>一般用户可以查询vip会员列表和vip交易情况</li>
					<li>没有权限的用户只能看帮助文档</li>
					<li>因为vip会员消费是在商场pos机上进行，本系统的消费仅仅是模拟</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
