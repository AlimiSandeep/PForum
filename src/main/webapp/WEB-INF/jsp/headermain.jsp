<%@page import="com.pramati.pforum.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
.search {
	width: 100%;
	margin-top: 4px;
}

.search form {
	margin-left: 20px;
}

.search form input[type=text] {
	padding: 4px;
	border: 1px solid white;
	color: black;
	border-radius: 2px 0px 0px 2px;
}

.search form button {
	background-color: #03a9f4;
	border: 1px solid white;
	padding: 4px;
	border-radius: 0px 2px 2px 0px;
}
</style>
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
			<div class="search">
				<form class="formSearch" method="post" action="searchQues.pforum"
					style="margin: auto; max-width: 300px">
					<input type="text" placeholder="Search.." name="search">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
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
								class="dropdown-item" href="contactus.pforum"><i
								class="fas fa-address-book"></i>&nbsp;&nbsp;Contact us</a>
						</div></li>
				</ul>
			</div>
		</nav>
	</div>

	<div class="row">
		<div class="col-2">
			<div class="list-group">
				<h5
					style="text-align: center; background-color: black; color: white; padding: 5px; border-radius: 05px;">Categories</h5>
				<a href="mainpage.pforum"
					class="list-group-item list-group-item-action">View all</a>
				<c:forEach items="${allcatcount}" var="catcount">
					<a href="${catcount.key}.pforum"
						class="list-group-item list-group-item-action">${catcount.key}
						(${catcount.value})</a>
				</c:forEach>
			</div>
		</div>
</body>
</html>