<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
String name = (String) session.getAttribute("user");


if(name==null){
	 response.sendRedirect("index.html");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Panel</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/docPanel.css">
</head>
<body>



	<jsp:include page="Navbar.jsp" />

	<h3 class="sub subheading">
		Welcome
		<%=name%>
		!
	</br>
	</br>
	<a href="viewAppointments.jsp"> <input type="button"
		class=" btn btn-primary" value="View My Appointments" id=""></a>
	</h3>
	<h2 class="heading subheading">STATUS</h2>
	<div class="doctor">



		<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost/edocappointments" user="root"
			password="Developer@1104" />

		<sql:query dataSource="${db}" var="rs">
				SELECT COUNT(app_id) as count FROM appointments WHERE fk_doc_id=(SELECT staff_id FROM staff_login WHERE staff_uname="<%=name%>");
				</sql:query>

<div>
		<div class="patientnum">
			<h3 class="subheading">Total Patients</h3>

			<c:forEach var="total" items="${rs.rows}">
				<h4 class="subvalue">${total.count}</h4>
				<c:set value="${total.count}" var="remaining"></c:set>


			</c:forEach>
		</div>

		<sql:query dataSource="${db}" var="rs">
		SELECT COUNT(app_id) as count FROM appointments WHERE fk_doc_id=(SELECT staff_id FROM staff_login WHERE staff_uname="<%=name%>") AND app_status="Session Over";
		</sql:query>
		<div class="sessionover">
			<h3 class="subheading">Session Over</h3>
			<c:forEach var="total" items="${rs.rows}">
				<h4 class="subvalue">${total.count}</h4>
				<c:set value="${remaining-total.count}" var="remaining"></c:set>
			</c:forEach>
		</div>
</div>
<div>
		<sql:query dataSource="${db}" var="rs">
		SELECT COUNT(app_id) as count FROM appointments WHERE fk_doc_id=(SELECT staff_id FROM staff_login WHERE staff_uname="<%=name%>") AND app_status="Cancelled";
		</sql:query>
		<div class="cancelled">
			<h3 class="subheading">Cancelled Sessions</h3>
			<c:forEach var="total" items="${rs.rows}">
				<h4 class="subvalue">${total.count}</h4>

				<c:set value="${remaining-total.count}" var="remaining"></c:set>

			</c:forEach>
		</div>

		<div class="remain">
			<h3 class="subheading">Remaining Session</h3>

			<c:choose>
				<c:when test="${remaining<0}">
					<h4 class="subvalue">0</h4>
				</c:when>
				<c:otherwise>
					<h4 class="subvalue">${remaining}</h4>
				</c:otherwise>
			</c:choose>

</div>
		</div>
		</div>
</body>
</html>