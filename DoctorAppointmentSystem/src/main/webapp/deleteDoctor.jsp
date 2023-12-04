<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.edoc.beans.DoctorBean" %> 
 <%@page import="com.edoc.dao.DoctorDAO" %>
 
<%
int id=Integer.parseInt(request.getParameter("id"));

DoctorBean doc=new DoctorBean();

doc.setDocFkStaffId(id);
Boolean flag= DoctorDAO.deleteDoc(doc);

if(flag)
	response.sendRedirect("adminPanel.jsp");
else
	response.sendRedirect("addDoctor.html");

%>

