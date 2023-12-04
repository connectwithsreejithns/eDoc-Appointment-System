<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	margin: 0;
	padding: 0;
}

.navbar {
	width: 100%;
	background-color: #4E96FF;
}

.list {
	height: 60px;
	display: flex;
	flex-direction: row;
	align-items: baseline;
	justify-content: space-between;
	padding: 0 40px 0 40px;
}

.user {
	display: flex;
	flex-direction: row;
	color: white;
	gap: 30px;
	font-size: 20px;
}

a {
	text-decoration: none;
}

#logo {
	color: white;
	font-weight: bolder;
	font-size: 40px;
}
</style>
<meta charset="ISO-8859-1">
</head>
<body>
	<div class="navbar">
		<div class="list">
			<div id="logo">eDoc.</div>
			<%
			String name = (String) session.getAttribute("user");
			
			%>
			<div class="user">
				<div><%=name%></div>
				<div>
					<a href="logout.jsp">Logout</a>
				</div>
			</div>

		</div>
	</div>
</body>
</html>