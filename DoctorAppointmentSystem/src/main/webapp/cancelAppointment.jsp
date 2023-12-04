<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.edoc.beans.AppointmentBean"%>
<%@page import="com.edoc.dao.AppointmentDAO"%>
		
<%
int appId=Integer.parseInt(request.getParameter("id"));
AppointmentBean appbean =new AppointmentBean();
appbean.setAppId(appId);
Boolean flag=AppointmentDAO.cancelApp(appbean);
if(flag){
	response.sendRedirect("viewAppointments.jsp");
}
%>

