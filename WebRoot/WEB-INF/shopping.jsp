<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
			<s:property value="#session.us.username" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="outAction!logout.action" style="color: white;">退出</a>&nbsp;&nbsp;
		</div>
	</div>
	<div id="main">
		<div id="left">
			<s:set id="role" value="#session.us.role" />
			<s:if test="#role.roles == 'admin'">
				<div class="menu"
					onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
					onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
					onclick="window.open('comm_add.jsp','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
					商品信息录入</div>
			</s:if>
			<s:if test="#role.roles == 'admin'">
				<div class="menu"
					onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
					onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
					onclick="window.open('commAction!commodityList.action','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
					商品信息查询</div>
			</s:if>
			<br> <br>
			<div class="menu"
				onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
				onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
				onclick="window.open('vip_add.jsp','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
				VIP信息管理</div>
			<div class="menu"
				onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
				onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
				onclick="window.open('shopping.jsp','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
				VIP购物登记</div>
			<div class="menu"
				onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
				onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
				onclick="window.open('login.jsp','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
				VIP信息查询</div>
			<br> <br>
			<div class="menu"
				onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
				onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
				onclick="window.open('login.jsp','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
				系统维护</div>
			<div class="menu"
				onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
				onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
				onclick="window.open('login.jsp','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
				帮助</div>
		</div>

		<div id="right">
			<div id="vipDiv">会员</div>
			<div id="commDiv">商品</div>
			<s:form>
				<div id="chVipDiv"></div>
				<div id="chCommDiv"></div>
			</s:form>
		</div>
	</div>
</body>
</html>
