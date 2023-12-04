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
<title>Add Doctor</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/addDoctor.css">
<script type="text/javascript">
function validateForm() {
	
	var userName = document.forms["doc-form"]["uname"].value;
	var password = document.forms["doc-form"]["upass"].value;
	var upassconfirm = document.forms["doc-form"]["upassconfirm"].value;
	var name = document.forms["doc-form"]["name"].value;
	var phone = document.forms["doc-form"]["phone"].value;
	var dept = document.forms["doc-form"]["dept"].value;
	var add = document.forms["doc-form"]["add"].value;
	
	if (userName == "" || userName == null) {
		alert("Please Enter the UserName");
		document.forms["login-form"]["uname"].focus();
		return false;
	}
	if (userName.length < 5) {
		alert("Username must be at least of 5 characters.");
		document.forms["login-form"]["uname"].focus();
		return false;
	}
	if (password == "") {
		alert("Please enter your password.");
		document.forms["login-form"]["upass"].focus();
		return false;
	}
	if (password.length < 8) {
		alert("Password must contain at least of 8 digits");
		document.forms["login-form"]["upass"].focus();
		return false;
	}
	if (password == "") {
		alert("Please enter your password.");
		document.forms["login-form"]["password"].focus();
		return false;
	}
	if (upassconfirm == "") {
		alert("Please Confirm password.");
		document.forms["login-form"]["upassconfirm"].focus();
		return false;
	}
	
	if(password!=upassconfirm){
		alert("Password Combo Incorrect.");
		document.forms["login-form"]["upassconfirm"].focus();
		return false;
	}
	if (name == "") {
		alert("Please enter your name.");
		document.forms["login-form"]["name"].focus();
		return false;
	}
	if (dept == "") {
		alert("Please enter your department.");
		document.forms["login-form"]["dept"].focus();
		return false;
	}
	if (add == "") {
		alert("Please enter your add.");
		document.forms["login-form"]["add"].focus();
		return false;
	}
	document.form.submit();
}
</script>
</head>
<body>

	<jsp:include page="Navbar.jsp" />
	<div id=div-list>
	<h2 class="heading">Add New Doctor</h2>
	<form name="doc-form" action="addDoctorfunction.jsp" class="adddoc" onsubmit="return validateForm()">
        <input type="text" name="uname" id="text-box" placeholder="Username">
        <input type="password" name="upass" id="text-box" placeholder="Password">
        <input type="password" name="upassconfirm" id="text-box" placeholder="Confirm Password">
        <input type="text" name="name" id="text-box" placeholder="Full Name">
        <input type="text" name="phone" id="text-box" placeholder="Phone Number">
        <select name="dept" id="text-box">
			<option value="" disabled selected>Select Specialization</option>
            <option value="General practitioner">General practitioner</option>
            <option value="Neurologist">Neurologist</option>
            <option value="Pediatrician">Pediatrician</option>
            <option value="Dermatologist">Dermatologist</option>
            <option value="Psychiatrist">Psychiatrist</option>
            <option value="Oncologist">Oncologist</option>
            <option value="Gynaecologist">Gynaecologist</option>
        </select>
        <textarea name="add" id="textarea-box"  placeholder="Address"></textarea>
        <input type="submit" class="btn btn-primary" value="Add DOCTOR">
    </form>
 </div> 
</body>
</html>