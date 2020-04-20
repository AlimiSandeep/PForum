<%@page import="com.pramati.pforum.model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings</title>
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

input[type=password] {
	width: 100%;
	border: 1px solid #03A9F4;
	padding: 4px;
}

input[type=submit] {
	background-color: #03A9F4;
	color: black;
	border: 2px solid black;
	padding: 4px;
	margin: 10px;
}

input[type=submit]:hover {
	color: white;
	background-color: black;
}
</style>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");

		if (session.getAttribute("curuser") == null) {
			response.sendRedirect("LoginPage.pforum");
		}
	%>
	<jsp:include page="headermainProfile.jsp" />

	<div class="col-1"></div>
	<div class="col">


		<div class="card post">

			<div class="card-body question-body">

				<p class="card-text question">
					<span style="font-size: 20px; font-weight: bold;">Account
						Settings</span>
				</p>
				<p>${msg}</p>
				<p>
					<c:set var="u" scope="session" value="${curuser}" />
					Primary Mail Id: ${u.getEmail()}
				</p>



				<p>
					Password :
					<button type="button" class="btn btn-info" data-toggle="modal"
						data-target="#answer1">Update Password</button>
				<div id="answer1" class="modal fade" role="dialog">
					<div class="modal-dialog modal-sm">
						</p>

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Update Password</h4>
								<button type="button" class="modal fade" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">

								<form method="post"
									action="changePassword.pforum">
									<input type="password" id="curPassword" name="curPwd"
										placeholder="Current password" required><br /> <br /> <input
										type="password" id="newPassword" placeholder="New password"
										name="newpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										required /><br /> <br /> <input type="password"
										id="confirmPassword" placeholder="Confirm new password"
										name="cnfpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										required /><br /> <br /> <span id='message'></span> <input
										type="submit" value="Update">
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-2"></div>
	<script src="other/js/jquery.min.js"></script>
	<script src="other/js/bootstrap.min.js"></script>
</body>
</html>