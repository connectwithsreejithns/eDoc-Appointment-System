<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<%@page import="com.edoc.beans.StaffLoginBean"%>
<%@page import="com.edoc.dao.StaffLoginDAO"%>
<%@page import="com.edoc.beans.DoctorBean"%>
<%@page import="com.edoc.dao.DoctorDAO"%>

<%
String uname = request.getParameter("uname");
String upass = request.getParameter("upass");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String dept = request.getParameter("dept");
String add = request.getParameter("add");


StaffLoginBean staff = new StaffLoginBean();
staff.setStaffUname(uname.toLowerCase().trim());
staff.setStaffPass(upass);

int staffId = StaffLoginDAO.InsertDoctorLogin(staff);

DoctorBean doctorBean =new DoctorBean();
doctorBean.setDocName(name);
doctorBean.setDocPhone(phone);
doctorBean.setDocDep(dept);
doctorBean.setDocId(staffId);
doctorBean.setDocadd(add);

int flagone = DoctorDAO.InsertDoctorLogin(doctorBean);
if(flagone==1)
	response.sendRedirect("adminPanel.jsp");
else
	response.sendRedirect("addDoctor.jsp");


%>
