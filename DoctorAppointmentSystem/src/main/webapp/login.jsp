<%--
Document : Login
Created on : 28.11.2023
Author :Sreejith N S
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<%@page import="com.edoc.beans.StaffLoginBean"%>
<%@page import="com.edoc.dao.StaffLoginDAO"%>
<%@page import="com.edoc.beans.PatientBean"%>
<%@page import="com.edoc.dao.PatientDAO"%>
<%@ page errorPage="errorPage.jsp" %>
<%
String sessionkey=(String) session.getAttribute("user");
if(sessionkey==null){
	 response.sendRedirect("index.html");
}
%>

<%
String uname = request.getParameter("uname");
String upass = request.getParameter("upass");

StaffLoginBean staff = new StaffLoginBean();
staff.setStaffUname(uname.toLowerCase().trim());
staff.setStaffPass(upass);

String staffType = StaffLoginDAO.checkLogin(staff);

if (staffType.equals("Admin")) {
	session.setAttribute("user",uname);
	response.sendRedirect("adminPanel.jsp");
}

else if (staffType.equals("Doctor")) {
	session = request.getSession(false); 
	session.setAttribute("user",uname);
	response.sendRedirect("doctorPanel.jsp");
}

else if (staffType.equals("Patient")) {
	
	session.setAttribute("user",uname);
	PatientBean pat = new PatientBean();
	pat.setPatUname(uname.toLowerCase().trim());
	pat.setPatPass(upass);

	Boolean flag=PatientDAO.checkLogin(pat);
	
	if(flag){
		response.sendRedirect("PatientPanel.jsp");
	}else{
		
        response.sendRedirect("login.html"); 
		
        
	}
}
%>