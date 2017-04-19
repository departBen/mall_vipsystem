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
<link rel="stylesheet" href="css/comm_info.css" type="text/css">
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
			<jsp:include page="menu.jsp" flush="true"></jsp:include>
		</div>

		<div id="right">
			<table>
				<tr>
					<th>用户名</th>
					<th>权限</th>
					<th>操作</th>
				</tr>

				<s:iterator value="#request.users" var="us">
					<tr>
						<td><s:property value="#us.username" /></td>
						<td><s:property value="#us.role.roles" /></td>
						<td>
							<a href="syseditAction.action?user.username=<s:property value='#us.username'/>">修改</a>
						</td>
					</tr>
				</s:iterator>
			</table>
			<br>
			<div id="addsubDiv">
				<s:submit value="添加" onclick="window.open('user_edit.jsp','_self')" cssStyle="height: 30px;width: 60px;"/>&nbsp;&nbsp;
			</div>
			<div style="clear: both"> 
				<s:set name="page" value="#request.pager" />
				<s:if test="#page.hasFirst">
					<a href="commAction!commodityList.action?currentPage=1">首页</a>
				</s:if>
				<s:if test="#page.hasPrevious">
					<a
						href="commAction!commodityList.action?currentPage=
								<s:property  value="#page.currentPage-1"/>">上一页</a>
				</s:if>
				<s:if test="#page.hasNext">
					<a
						href="commAction!commodityList.action?currentPage=
							<s:property  value="#page.currentPage+1"/>">下一页</a>
				</s:if>
				<s:if test="#page.hasLast">
					<a
						href="commAction!commodityList.action?currentPage=
							<s:property  value="#page.totalPage"/>">尾页</a>
				</s:if>
				<br> 当前第
				<s:property value="#page.currentPage" />
				页, 总共
				<s:property value="#page.totalPage" />
				页
			</div>
		</div>
	</div>
</body>
</html>
