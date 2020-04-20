<%@page import="com.pramati.pforum.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

	<div class="container-fluid">
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<a class="navbar-brand" href="mainpage.pforum"><span
				style="color: #03A9F4;">P</span>FORUM</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<c:set var="empcur" scope="session" value="${curuser}" />
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> ${empcur.getFname()}
							${empcur.getLname()} </a>
						<div class="dropdown-menu dropdown-menu-right text-left">
							<h5 class="dropdown-header">Details</h5>
							<a class="dropdown-item" href="profile.pforum"><i
								class="fas fa-user-circle"></i>&nbsp;&nbsp;Profile</a> <a
								class="dropdown-item" href="logout.pforum"><i
								class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;Logout</a> <a
								class="dropdown-item" href="setting.pforum"><i
								class="fas fa-tools"></i>&nbsp;&nbsp;Settings</a>
							<h5 class="dropdown-header">Other</h5>
							<a class="dropdown-item" href="aboutus.pforum"><i
								class="fas fa-info-circle"></i>&nbsp;&nbsp;About us</a> <a
								class="dropdown-item" href="contactus.pforum"><i class="fas fa-address-book"></i>&nbsp;&nbsp;Contact
								us</a>
						</div></li>
				</ul>
			</div>
		</nav>
	</div>
</body>
</html>