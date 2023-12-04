<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
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
<title>Patient Panel</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/patientPanel.css">
<script>


var request;
function sendInfo() {
	var v = document.forms["docapp"]["department"].value;
	var url = "getAvailableDoctors.jsp?val=" + v;

	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = getInfo;
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}
function getInfo() {
	if (request.readyState == 4) {
		var val = request.responseText;
		document.getElementById('selectOne').innerHTML=val;
	}
} 

</script>

</head>
<body>
<jsp:include page="Navbar.jsp" />
	<form name="docapp" class="docchoose">
		
		
<h2>Choose your physician Now !</h2>
		 <select class="choose" name="department" id="text-box" onchange="sendInfo()" >
			<option value="" disabled selected>Choose a specialist</option>
			 <option value="General practitioner">General practitioner</option>
            <option value="Neurologist">Neurologist</option>
            <option value="Pediatrician">Pediatrician</option>
            <option value="Dermatologist">Dermatologist</option>
            <option value="Psychiatrist">Psychiatrist</option>
            <option value="Oncologist">Oncologist</option>
            <option value="Gynaecologist">Gynaecologist</option>
		</select>
		
		
		
		

	</form>
	<span id="selectOne"> </span>
</body>
</html>