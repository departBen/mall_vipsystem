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
		var commodityName = document.getElementById("commodityName").value;
		var price = document.getElementById("price").value;
		var agio = document.getElementById("agio").value;

		if (commodityName == "") {
			document.getElementById("commodityName").focus();
			alert("请输入商品名")
			return false;
		}
		if (price == "") {
			document.getElementById("price").focus();
			alert("请输入价格")
			return false;
		}
		if (agio == "") {
			document.getElementById("agio").focus();
			alert("请输入折扣")
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
		<!-- 控制只能输入金额 -->
		<script type="text/javascript">
			function clearNoNum(obj){
				obj.value = obj.value.replace(/[^\d.]/g, "");
				obj.value = obj.value.replace(/\.{2,}/g,".");
				obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
				obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, "$1$2.$3");
				if(obj.value.indexOf(".")<0 && obj.value !=""){
					obj.value = parseFloat(obj.value);
				}
			}
			function clearAgio(obj){
				obj.value = obj.value.replace(/\D/g, "");
			}
			
		</script>
		<div id="right">
			<div class="mainform">
				<s:form action="commAction!addCommodity" post="post">
					<label>商&nbsp;&nbsp;品&nbsp;&nbsp;名:</label>&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="commodity.commodityName" cssClass="addInput" id="commodityName"/><br>
					<br>
					<br>
					<label>商品价格:</label>&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="commodity.price" onkeyup="clearNoNum(this)" cssClass="addInput" id="price"/><br>
					<br>
					<br>
					<label>商品折扣:</label>&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="commodity.agio" onkeyup="clearNoNum(this)"   cssClass="addInput" id="agio"/> 
					<br>
					<br>
					<h6 style="color: red;">折扣为小于等于1的数</h6><br>
					<h2 style="color: red"><s:property value="#request.errmess"/></h2>
					<br>
					<br>
					<div id="addBtnDiv">
						<s:reset value="重置" cssClass="addBtn"/> 
						&nbsp;&nbsp;&nbsp;&nbsp;
						<s:submit value="提交" cssClass="addBtn" onclick="return check();"/>
					</div>
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>
