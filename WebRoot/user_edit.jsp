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
			<jsp:include page="menu.jsp" flush="true"></jsp:include>
		</div>
		<div id="right">
			<div class="mainform">

				<s:if test="#request.user != null">
					<script type="text/javascript">
						function check() {
							var password = document.getElementById("password").value;
							if (password == "") {
								document.getElementById("password").focus();
								alert("密码不可为空");
								return false;
							}
						}
					</script>
					<s:form action="saveEditAction" post="post">
						<label>用户名:</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<s:label value="%{#request.user.username}" cssClass="addInput" />
						<s:hidden value="%{#request.user.username}" name="user.username"></s:hidden>
						<br>
						<br>
						<br>
						<label>密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield
							name="user.password" value="%{#request.user.password}"
							cssClass="addInput" id="password" />
						<br>
						<br>
						<br>
						<label>权&nbsp;&nbsp;&nbsp;&nbsp;限:</label>&nbsp;&nbsp;&nbsp;&nbsp;<s:select
							list="{'admin','user','无权限'}" name="user.role.roles"
							cssClass="addInput"></s:select>
						<br>
						<br>
						<div id="addBtnDiv">
							<s:reset value="重置" cssClass="addBtn" />
							&nbsp;&nbsp;&nbsp;&nbsp;
							<s:submit value="提交" cssClass="addBtn" onclick="return check();" />
						</div>
					</s:form>
				</s:if>

				<s:else>
					<script type="text/javascript">
						function check() {
							var username = document.getElementById("username").value;
							var password = document.getElementById("password").value;
							if (username == "") {
								document.getElementById("username").focus();
								alert("用户名不可为空");
								return false;
							}
							if (password == "") {
								document.getElementById("password").focus();
								alert("密码不可为空");
								return false;
							}
						}
					</script>
					<s:form action="saveEditAction" post="post">
						<label>用户名:</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<s:textfield name="user.username" cssClass="addInput" id="username"/>
						<br>
						<br>
						<br>
						<label>密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield
							name="user.password" value="%{#request.user.password}"
							cssClass="addInput" id="password" />
						<br>
						<br>
						<br>
						<label>权&nbsp;&nbsp;&nbsp;&nbsp;限:</label>&nbsp;&nbsp;&nbsp;&nbsp;<s:select
							list="{'admin','user'}" name="user.role.roles"
							cssClass="addInput"></s:select>
						<br>
						<br>
						<div id="addBtnDiv">
							<s:reset value="重置" cssClass="addBtn" />
							&nbsp;&nbsp;&nbsp;&nbsp;
							<s:submit value="提交" cssClass="addBtn"  onclick="return check();"/>
						</div>
					</s:form>
				</s:else>
			</div>
		</div>
	</div>
</body>
</html>
