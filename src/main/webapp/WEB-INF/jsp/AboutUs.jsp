<%@page import="com.pramati.pforum.model.Employee"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="other/css/bootstrap.min.css" />
<link rel="shortcut icon" href="other/images/shorticon.png" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<style>
@font-face {
	font-family: rk;
	src: url("other/ttf/UberMove-Medium.TTF");
}

body {
	font-family: rk;
}

p {
	padding: 10px;
	font-size: 1.2vw;
}

.m {
	 position:fixed;
    top: 40%;
    left: 35%;
    width:50em;
    height:18em;
    margin-top: -9em; /*set to a negative number 1/2 of your height*/
    margin-left: -15em; /*set to a negative number 1/2 of your width*/
   
  
	/* max-width: 800px;
	margin: auto;
	padding: 10px;
	border: 3px solid green;
 */
}

h3 b {
	position: absolute;
	top: 100px;
	left:100px;
}
</style>
<title>About us</title>
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

	<h3>
		<b>About Us:</b>
	</h3>
	<div class="m">


		<p align="justify">
			<b>PFORUM</b> is the Question-and-Answer website where questions are
			asked and answered by the users in the form of their opinions. The
			main objective of this website is to make the people in an
			organization feel free to ask any question related to any technical
			or general perspective and get the answer. This website is available
			to all the users from anywhere in the organization. This website
			cannot be accessed by any user outside of the organization. This
			website helps the users in turn time saving and not disturbing the
			people at work for very small doubts, will be an efficient way of
			working.<br><br> PFORUM supports the employees in an organization to interact
			with all the employees in a sophisticated way. It provides the user
			to review the question so that if anyone previously faced the same
			problem and get a solution for that. Employees answering a question
			will have a clear idea of what they are dealing with. As the sharing
			of knowledge is the main objective here, all the employees will
			interact with each other properly.
		</p>
	</div>
	<script src="other/js/jquery.min.js"></script>
	<script src="other/js/bootstrap.min.js"></script>
</body>
</html>