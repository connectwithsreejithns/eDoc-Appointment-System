<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<%@page import="com.edoc.beans.DoctorBean"%>
<%@page import="com.edoc.dao.DoctorDAO"%>
<%
String sessionkey=(String) session.getAttribute("user");
if(sessionkey==null){
	 response.sendRedirect("index.html");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN PANEL</title>
<link rel="stylesheet" href="css/adminPanel.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<jsp:include page="Navbar.jsp" />
	<div id=div-list>

		<table class="button-list">
			<tr>
				<td><a href="adminPanel.jsp"> <input type="button"
						value="All Doctors" class="login-btn btn-primary btn"
						style="padding-left: 25px; padding-right: 25px; padding-top: 10px; padding-bottom: 10px;">
				</a></td>
				<td><a href="addDoctor.jsp"> <input type="button"
						value="Add Doctor" class="login-btn btn-primary btn"
						style="padding-left: 25px; padding-right: 25px; padding-top: 10px; padding-bottom: 10px;">
				</a></td>
			</tr>
		</table>

		<table id="doc-list">
			<tr>
				<th>Sl.no</th>
				<th>Name</th>
				<th>Department</th>
				<th>Address</th>
				<th>Phone Number</th>
				<th>Actions</th>
			</tr>
			<%
			int i = 1;
			DoctorBean doctorBean = new DoctorBean();
			ArrayList<DoctorBean> doctor = DoctorDAO.getDocList();

			for (DoctorBean doc : doctor) {
			%>
			<tr>
				<td><%=i%></td>
				<td><%=doc.getDocName()%></td>
				<td><%=doc.getDocDep()%></td>
				<td><%=doc.getDocadd()%></td>
				<td><%=doc.getDocPhone()%></td>
				<td>
					<a href="deleteDoctor.jsp?id=<%=doc.getDocFkStaffId()%>"><i
						class="fa fa-remove" style="font-size: 20px; color: red">Delete</i></a>
				</td>


			</tr>
			<%
			i++;
			}
			%>
		</table>
	</div>


</body>
</html>