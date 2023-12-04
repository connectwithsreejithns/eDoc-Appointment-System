<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="com.edoc.beans.StaffLoginBean"%>
<%@page import="com.edoc.dao.StaffLoginDAO"%>

<%@page import="com.edoc.beans.AppointPatientForeignBean"%>
<%@page import="com.edoc.dao.AppointPatientForeignDAO"%>
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
<title>View Appointments</title>
<link rel="stylesheet" href="css/adminPanel.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
</head>
<body>
<jsp:include page="Navbar.jsp" />
	<div id=div-list>
		<table id="doc-list">
			<tr>
				<th>Sl.no</th>
				<th>ID</th>
				<th>Patient Name</th>
				<th>Gender</th>
				<th>Age</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Actions</th>
			</tr>
			<%
			String name = (String) session.getAttribute("user");

			StaffLoginBean staff = new StaffLoginBean();
			staff.setStaffUname(name);
			int StaffId = StaffLoginDAO.GetStaffId(staff);

			AppointPatientForeignBean appo = new AppointPatientForeignBean();
			appo.setFkDocId(StaffId);

			int i = 1;
			ArrayList<AppointPatientForeignBean> apfb = AppointPatientForeignDAO.appointmentDetail(appo);

			for (AppointPatientForeignBean list : apfb) {
			%>
			<tr>

				<td><%=i%></td>
				<td><%=list.getAppId()%></td>
				<td><%=list.getPersName()%></td>
				<td><%=list.getPersGender()%></td>
				<td><%=list.getPersAge()%></td>
				<td><%=list.getPersAdd()%></td>
				<td><%=list.getPersPhone()%></td>

				<td> 
				
				<a href="cancelAppointment.jsp?id=<%=list.getAppId() %>"><i class="fa fa-pencil" style="font-size:15px; color:purple"> Done</i></a>&nbsp;&nbsp;
				<a
					href="cancelAppointment.jsp?id=<%=list.getAppId() %>"><i class="fa fa-remove"
						style="font-size: 15px; color: red"> Cancel</i></a></td>


			</tr>
			<%
			i++;
			}
			%>


		</table>
	</div>
</body>
</html>