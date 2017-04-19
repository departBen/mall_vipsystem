<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<meta charset="UTF-8">
<title>Vip管理系统登陆</title>
<link rel="stylesheet" href="css/login.css" type="text/css">
<script type="text/javascript">
	function check() {
		var user_name = document.getElementById("username").value;
		var password = document.getElementById("password").value;

		if (user_name == "") {
			document.getElementById("mes").innerText = "请输入用户名";
			document.getElementById("username").focus();
			return false;
		}
		if (password == "") {
			document.getElementById("mes").innerText = "请输入密码";
			document.getElementById("password").focus();
			return false;
		}
	}
</script>
</head>

<body>

	<div id="login">
		<h1>请登陆</h1>
		&nbsp;<br>
		<s:form action="loginAction!login" method="post">
			<s:textfield placeholder="用户名" name="user.username" cssClass="input"
				id="username" />
			<br>
			&nbsp;<br>
			<s:password placeholder="密码" name="user.password" cssClass="input"
				id="password" />
			<br>
			&nbsp;<br>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label style="color: red" id="mes">
				<s:property value="#request.loginErr"/>
				</label><br>
			</p>
			&nbsp;<br>
			<s:submit value="登陆" name="submit" cssClass="submit"
				onclick="return check();" />
		</s:form>
		
		<h2>管理员用户：admin 密码：123456</h2>
	</div>

</body>
</html>
