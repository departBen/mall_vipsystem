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
<script type="text/javascript">
	function check() {
		var name = document.getElementById("name").value;
		var age = document.getElementById("age").value;

		if (name == "") {
			document.getElementById("name").focus();
			alert("请输入姓名!")
			return false;
		}
		if (age == "") {
			document.getElementById("age").focus();
			alert("请输入年龄!")
			return false;
		}
	}
</script>
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
			<div class="mainform">
				<s:form action="vipAction!addVip" post="post">
					<label>姓名:</label>&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="vip.name" cssClass="addInput" id="name"/><br>
					<br>
					<br>
					<label>年龄:</label>&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="vip.age" onkeyup="value=value.replace(/\D/g,'')" cssClass="addInput" id="age"/><br>
					<br>
					<br>
					<label>成分:</label>&nbsp;&nbsp;&nbsp;&nbsp;<s:select list="{'铂金卡','金卡','银卡'}" name="vip.profession" cssClass="addInput"></s:select>
					<br>
					<br>
					<div id="addBtnDiv">
						<s:reset value="重置" cssClass="addBtn"/> 
						&nbsp;&nbsp;&nbsp;&nbsp;
						<s:submit value="提交" cssClass="addBtn" onclick="return check();"/>
					</div>
				</s:form>
				<br>
				<br>
				<s:label value="%{#request.message}" cssClass="mesLab"></s:label>
			</div>
		</div>
	</div>
</body>
</html>
