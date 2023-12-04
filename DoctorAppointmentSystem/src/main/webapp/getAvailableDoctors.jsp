<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<%@page import="com.edoc.beans.DoctorBean"%>
<%@page import="com.edoc.dao.DoctorDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
String sessionkey=(String) session.getAttribute("user");
if(sessionkey==null){
	 response.sendRedirect("index.html");
}
%>
<%
			String dept = request.getParameter("val");
			DoctorBean doc = new DoctorBean();
			doc.setDocDep(dept);
			ArrayList<DoctorBean> a = DoctorDAO.getDocByDept(doc);
			%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/patientPanel.css">
</head>
<body>
	<form name="docapp" class="" action="fixAppointment.jsp" method="post">
	<div class=ajaxdoc>
		<select name="docname" class="selectbut">
			<option value="" disabled selected>Choose a Doctor</option>
			
			
			<%
			for (DoctorBean list : a) {
			%>
			<option value="<%=list.getDocName()%>"><%=list.getDocName()%></option>
			<%
			}
			%>
		</select>
		<input type="date" id="appdate" name="appdate" class="selectbut"/>
		 <select name="timeslot" id="" class="slots selectbut" >
			<option value="" disabled selected>Choose your Time Slot</option>
			<option value="1">09.00 - 09.15 AM</option>
			<option value="2">09.15 - 09.30 AM</option>
			<option value="3">09.30 - 09.45 AM</option>
			<option value="4">09.45 - 10.00 AM</option>
			<option value="5">10.00 - 10.15 AM</option>
			<option value="6">10.15 - 10.30 AM</option>
			<option value="7">10.30 - 10.45 AM</option>
			<option value="8">10.45 - 11.00 AM</option>
			<option value="9">11.00 - 11.15 AM</option>
			<option value="10">11.15 - 11.30 AM</option>
			<option value="11">11.30 - 11.45 AM</option>
			<option value="12">11.45 - 12.00 AM</option>
		</select>
		
	
	</div>
	</br></br>
	
	 <input type="submit" class="btn btn-primary fixbutton" value="FiX Appointment"/>
	 
	</form>

</body>
</html>