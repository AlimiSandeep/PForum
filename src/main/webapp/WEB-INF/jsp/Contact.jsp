<%@page import="com.pramati.pforum.model.Employee"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Contact Us</title>
<link rel="stylesheet" href="other/css/bootstrap.min.css" />
<link rel="shortcut icon" href="other/images/shorticon.png" />
<link rel="stylesheet" href="other/css/navAndHeader.css" />
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=submit] {
	background-color: #101010;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		Employee email = (Employee) session.getAttribute("curuser");
		String pageToRe = "";
		if (email == null) {
			RequestDispatcher rd = request.getRequestDispatcher("LoginPage.pforum");
			rd.forward(request, response);
		}
	%>
	<jsp:include page="headermainProfile.jsp" />
	<div class="row">
		<div class="col-2 spacerk"></div>
		<div class="col">
		<center>${msg}</center>
			<div class="container contactus">
				<h3>Contact Us</h3>
				<form action="saveContactus.pforum" method="post">
					<label for="name">Name</label><br /> <input type="text" id="uname"
						name="uname" value="${curuser.getUserName() }" placeholder="Your name.." readonly><br /> <br /> 
						<label
						for="email">Email</label><br /> <input type="text" id="email"
						name="email" value="${curuser.getEmail()}"placeholder="Your email id.." readonly><br /> <br />
					<label for="complain">What can we help you with?</label><br /> <select
						id="complain" name="msgTitle">
						<option value="Report an Bug">Report an Bug</option>
						<option value="General Feedback">General Feedback</option>
						<option value="I Have an Safety concern">I Have an Safety
							concern</option>
					</select><br /> <label for="Description">Description</label><br />
					<textarea id="Description" name="msgDesc"
						placeholder="Write something.." style="height: 200px" required></textarea>
					<br /> <br /> <input type="submit" value="Submit">
				</form>
			</div>
			</center>
		</div>
		<div class="col-2 spacerk"></div>
	</div>
	<script src="other/js/jquery.min.js"></script>
	<script src="other/js/bootstrap.min.js"></script>
</body>
</html>