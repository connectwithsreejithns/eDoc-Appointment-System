<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<%@page import="com.edoc.beans.AppointmentBean"%>
<%@page import="com.edoc.dao.AppointmentDAO"%>

<%@page import="com.edoc.beans.DoctorBean"%>
<%@page import="com.edoc.dao.DoctorDAO"%>

<%@page import="com.edoc.beans.PatientBean"%>
<%@page import="com.edoc.dao.PatientDAO"%>

<%
String name = (String) session.getAttribute("user");
PatientBean pat=new PatientBean();
pat.setPatUname(name);
int patId=PatientDAO.GetIdByName(pat);

String date = request.getParameter("appdate");
String docname = request.getParameter("docname");
DoctorBean docbean=new DoctorBean();
docbean.setDocName(docname);
int staffId=DoctorDAO.getDocId(docbean);
int timeslot = Integer.parseInt(request.getParameter("timeslot"));

AppointmentBean appbean=new AppointmentBean();
appbean.setAppDate(date);
appbean.setTimeId(timeslot);

appbean.setFkPatId(patId);
appbean.setFkDocId(staffId);

Boolean flag=AppointmentDAO.fixAppointment(appbean);


%>
