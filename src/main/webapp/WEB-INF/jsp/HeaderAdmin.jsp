<%@ page errorPage="Error.html" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="other/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<a class="navbar-brand" href="admin.pforum"> <span
				style="color: #03A9F4;">P</span>FORUM <span style="color: white;">|
					<span style="color: #03A9F4;"> A</span>DMIN
			</span>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<c:set var="empcur" scope="session" value="${curuser}" />
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
						<div class="nav-link dropdown-toggle adminNavDrop"
							style="background-color: white; border-radius: 4px; color: #101010;"
							id="navbardrop" data-toggle="dropdown">
							<%="Admin"%>
						</div>
						<div class="dropdown-menu dropdown-menu-right text-left">
							<a class="dropdown-item" href="logout.pforum">Logout</a>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</body>
</html>