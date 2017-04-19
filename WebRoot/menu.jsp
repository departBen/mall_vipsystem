<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s"  uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<s:set id="role" value="#session.us.role" />
<s:if test="#role.roles == 'admin'">
	<div class="menu"
		onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
		onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
		onclick="window.open('comm_add.jsp','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
		商品信息录入</div>
</s:if>
<s:if test="#role.roles == 'admin' || #role.roles == 'user' ">
	<div class="menu"
		onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
		onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
		onclick="window.open('commAction!commodityList.action','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
		商品信息查询</div>
</s:if>
<br>
<br>
<s:if test="#role.roles == 'admin'">
	<div class="menu"
		onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
		onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
		onclick="window.open('vip_add.jsp','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
		VIP信息管理</div>
</s:if>
<s:if test="#role.roles == 'admin'">
	<div class="menu"
		onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
		onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
		onclick="window.open('consAction!shopping.action','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
		VIP购物登记</div>
</s:if>
<s:if test="#role.roles == 'admin' || #role.roles == 'user' ">
	<div class="menu"
		onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
		onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
		onclick="window.open('consAction!infoVip.action','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
		VIP信息查询</div>
</s:if>
<br>
<br>
<s:if test="#role.roles == 'admin'">
	<div class="menu"
		onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
		onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
		onclick="window.open('sysMangAction.action','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
		系统维护</div>
</s:if>

<div class="menu"
	onmouseover="this.style.backgroundColor='#F4F9FD';this.style.color='#FFCC66'"
	onmouseout="this.style.backgroundColor='cornsilk';this.style.color='blue'"
	onclick="window.open('help.jsp','_self');this.style.backgroundColor='cornsilk';this.style.color='blue'">
	帮助</div>