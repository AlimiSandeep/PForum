
<%@page import="com.pramati.pforum.model.ReportedAnswers"%>
<%@page import="com.pramati.pforum.model.Contactus"%>
<%@page import="com.pramati.pforum.model.ReportAnswer"%>
<%@page import="com.pramati.pforum.model.ReportedQuestions"%>
<%@page import="com.pramati.pforum.model.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pramati.pforum.service.PforumServiceImpl"%>
<%@page import="com.pramati.pforum.service.PforumServiceIface"%>
<%@page import="com.pramati.pforum.model.Employee"%><%-- 
<%@page import="com.pforum.model.Contactus"%> --%>
<%@page import="com.pramati.pforum.model.ReportQuestion"%>
<%@page import="com.pramati.pforum.dao.PforumDaoImpl"%>
<%@page import="java.util.List"%>
<%-- <%@ page errorPage="AdminError.html" language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome Admin!</title>
<link rel="stylesheet" href="other/css/bootstrap.min.css" />
<link rel="shortcut icon" href="other/images/shorticon.png" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet" href="other/css/navAndHeader.css" />

<script src="other/js/jquery.min.js"></script>
<script src="other/js/bootstrap.min.js"></script>





<script type="text/javascript">
	$(function() {
		$('#myModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget); // Button that triggered the modal
			var umail = button.data('usermail'); // Extract info from data-* attributes

			var modal = $(this);
			modal.find('#email').val(umail);
		});
	});
	
	//Keep Last Selected Bootstrap Tab Active on Page Refresh
	$(document).ready(function() {
	    if (location.hash) {
	        $("a[href='" + location.hash + "']").tab("show");
	    }
	    $(document.body).on("click", "a[data-toggle='tab']", function(event) {
	        location.hash = this.getAttribute("href");
	    });
	});
	$(window).on("popstate", function() {
	    var anchor = location.hash || $("a[data-toggle='tab']").first().attr("href");
	    $("a[href='" + anchor + "']").tab("show");
	});
</script>

<style>
.nav {
	margin: 10px;
	display: flex;
}

.nav-item {
	width: 100%;
	flex: 1 100px;
	margin-left: 5px;
	background-color: #03A9F4;
	border-radius: 6px 6px 0px 0px;
}

.nav-item .nav-link {
	color: white;
	text-decoration: none;
}

.well {
	box-shadow: 0 0 2px #9E9E9E;
	background-color: #f5f5f5;
	color: black;
	margin: 5px;
	padding: 6px;
	border-radius: 5px;
	border: 0.1px solid #101010;
}

.deleteBtn {
	width: 30px;
	height: 30px;
	background-image: url('other/images/deleteB.svg');
	transition: all 0.2s;
	background-size: 100% 100%;
	float: right;
}

.deleteBtn:hover {
	background-image: url('other/images/deleteH.svg');
	transition: all 0.2s;
}

.ul_question {
	list-style: none;
}

.well span {
	font-size: 16px;
}

.questionReport {
	font-size: 15px;
	padding: 2px;
	color: #9e9e9e;
}

.userTable {
	width: 100%;
}

.userTable tr td {
	padding: 5px;
}

#users .list-group .list-group-item {
	display: flex;
}

#users .list-group .list-group-item:nth-child(1) {
	display: flex;
	background-color: #03A9F4;
	color: white;
}

#users .list-group .list-group-item span {
	flex: 1 100px;
}

.uname {
	background-color: #03A9F4;
	color: white;
	font-weight: bold;
}

.msgtitle {
	font-size: 1vw;
}

.msgdesc {
	font-size: 1vw;
}

.reply {
	background-color: #101010;
	color: white;
	text-align: center;
	cursor: pointer;
}

.modal-body input[type=email] {
	border-radius: 05px;
	border: 0.5px solid black;
	margin: 5px;
	padding: 4px;
}

textarea {
	width: 100%;
	border-radius: 05px;
	border: 0.5px solid black;
	margin: 5px;
	padding: 4px;
}

@media ( min-width : 320px) and (max-width: 480px) {
	#users .list-group .list-group-item span {
		font-size: 3vw;
		word-break: break-word;
	}
	.nav-item {
		flex: 1 10px;
		font-size: 10px;
	}
	.msgtitle {
		font-size: 3.5vw;
	}
	.msgdesc {
		font-size: 3.5vw;
	}
}
</style>

</head>
<body>

	<jsp:include page="HeaderAdmin.jsp" />
	<h4>${msg}</h4>
	<ul class="nav nav-tabs" id="myTab">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#question">Reported Questions</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#answer">Reported Answers</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#users">Users</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#contactus">Contact Us</a></li>
	</ul>
	<!-- Tab panes -->
	<div class="tab-content">
		<div class="container tab-pane active" id="question">
			<div>
				<span>Refresh:</span><span title="refresh"
					style="background-color: #101010; border: 1px solid transparent; color: #fff; padding: 5px 10px; margin: 10px; font-weight: bolder; cursor: pointer; border-radius: 50%; font-size: 17px;"
					onclick="location.reload();">&#8635;</span>
			</div>

			<c:forEach items="${allreportques}" var="allReportQues">
				<div class="well">
					<div class="user-info">
						<ul>
							<li><span class="fas fa-user-circle"
								style="font-size: 35px; padding: 2px;"></span></li>
							<li>
								<ul
									style="list-style: none; display: list-item; padding: 5px 15px; line-height: 1.2rem;">
									<li style="font-weight: bold;">${allReportQues.getQuesCreateUser()}<span
										style="color: red;">&#10071;</span></li>
									<li style="font-size: 10px; color: #9E9E9E;">${allReportQues.quesCreateUserDesig}</li>
								</ul>
							<li style="width: 100%;"><a
								href="admin/que/${allReportQues.quesId}.pforum"><span
									class="deleteBtn"></span> </a></li>
						</ul>
					</div>
					<div class="well">
						<ul class="ul_question">
							<li><span class="questionReport">Question :</span>
								${allReportQues.questionText}</li>
							<li><span class="questionReport">Reason of reporting
									this Question :</span>${allReportQues.questionReportText}</li>
						</ul>
					</div>
					<span class="questionReport">Question was created on
						:${allReportQues.quesCreateDate}</span>

				</div>
			</c:forEach>

		</div>
		<div class="container tab-pane fade" id="answer">

			<c:forEach items="${allreportans}" var="allReportAns">
				<div class="well">
					<div class="user-info">
						<ul>
							<li><span class="fas fa-user-circle"
								style="font-size: 35px; padding: 2px;"></span></li>
							<li>
								<ul
									style="list-style: none; display: list-item; padding: 5px 15px; line-height: 1.2rem;">
									<li style="font-weight: bold;">${allReportAns.getUserName()}<span
										style="color: red;">&#10071;</span></li>
									<li style="font-size: 10px; color: #9E9E9E;">${allReportAns.getDesign()}</li>
								</ul>
							<li style="width: 100%;"><a
								href="admin/ans/${allReportAns.getAnswerId()}.pforum"> <span
									class="deleteBtn"></span>
							</a></li>

						</ul>

					</div>
					<div class="well">
						<ul class="ul_question">
							<li><span class="questionReport">Question :</span>
								${allReportAns.getQuesText()}</li>
							<li><span class="questionReport">Answer :</span>
								${allReportAns.getAnswer()}</li>
							<li><span class="questionReport">Reason for reporting
									this answer :</span> ${allReportAns.getReportReason()}</li>
						</ul>
					</div>
					<span class="questionReport">Answer was created on:</span>
					${allReportAns.getAnswerCreateDate()}
				</div>
			</c:forEach>

		</div>
		<div class="container tab-pane fade" id="users">
			<ul class="list-group">
				<li class="list-group-item"><span>Name</span><span>Email</span><span>Location</span><span>Designation</span></li>
				<c:forEach items="${allemp}" var="obj">
					<li class="list-group-item"><span>${obj.getFname()}</span><span>${obj.getEmail()}</span>
						<span>${obj.getLocation()}</span><span>${obj.getDesig()}</span></li>
				</c:forEach>
			</ul>
		</div>
		<div class="container tab-pane fade" id="contactus">
			<c:forEach items="${allcontactus}" var="obj">
				<ul class="list-group">
					<li class="list-group-item uname">${obj.getUname()}</li>
					<li class="list-group-item msgtitle">Title :
						${obj.getMsgTitle()}</li>
					<li class="list-group-item msgdesc">Description :
						${obj.getMsgDesc()}</li>
					<li class="list-group-item reply btn btn-primary btn-lg"
						data-toggle="modal" data-target="#myModal"
						data-usermail="${obj.getEmail()}">Reply</li>

				</ul>
			</c:forEach>
			<form method="post" action="sendEmail">
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">Reply</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<div class="modal-body">
								<input type="email" name="email" id="email" readonly /><br />

								<textarea rows=5 name="replymsg"
									placeholder="Enter Your Message" required></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Reply</button>

							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>
</body>
<script src="other/js/jquery.min.js"></script>
<script src="other/js/bootstrap.min.js"></script>
</html>