<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="com.edoc.beans.PatientBean"%>
<%@page import="com.edoc.dao.PatientDAO"%>
<%@page import="com.edoc.beans.PatientPersonalBean"%>
<%@page import="com.edoc.dao.PatientPersonalDAO"%>

<%
String uname=request.getParameter("uname");
String upass=request.getParameter("upass");

PatientBean pat =new PatientBean();

pat.setPatUname(uname);
pat.setPatPass(upass);

int flag = PatientDAO.PatientLogin(pat);
if(flag==1){
	int patId=PatientDAO.GetId(pat);
	if(patId!=0){
		PatientPersonalBean ppb=new PatientPersonalBean();
		
		String fname=request.getParameter("fname");
		String addr=request.getParameter("addr");
		String age=request.getParameter("age");
		String phone=request.getParameter("phone");
		String gender=request.getParameter("gender");
		
		ppb.setPersName(fname);
		ppb.setPersAdd(addr);
		ppb.setPersAge(age);
		ppb.setPersPhone(phone);
		ppb.setPatId(patId);
		ppb.setPersGender(gender);
		
		int flagOne=0;
		flagOne=PatientPersonalDAO.insertPersonals(ppb);
		if(flagOne==1){
			response.sendRedirect("signup.html");
		}
	}
}else{
	response.sendRedirect("PatientPanel.html");
}

%>
    