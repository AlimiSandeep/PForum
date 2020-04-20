<%@page import="java.util.List"%>
<%@page import="com.pramati.pforum.model.Employee"%>
<%@page import="com.pramati.pforum.model.Answer"%>
<%@page import="com.pramati.pforum.model.Question"%>
<%@page import="com.pramati.pforum.service.PforumServiceImpl"%>
<%@page import="com.pramati.pforum.service.PforumServiceIface"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Onboarding</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="other/images/shorticon.png" />
<link rel="stylesheet" href="other/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet" href="other/css/navAndHeader.css" />
<style>
/* pre{white-space:normal;} */
</style>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires","0");
		
		if(session.getAttribute("curuser")==null){
			response.sendRedirect("LoginPage.pforum");
		}
	%>
	<jsp:include page="headermain.jsp"></jsp:include>

	<div class="col-1"></div>
	<div class="col">
		<div class="card add_que_btn"><jsp:include page="addques.jsp" /></div>
		<c:set var="allRecentQues" scope="session" value="${allques}"/> 
		<c:choose>   
		<c:when test="${fn:length(allRecentQues) == 0}">
			<div class="card post" style="padding: 17px;">
			<h1>No questions posted yet!</h1>
			</div>
			</c:when>
		<c:otherwise>  
		<c:forEach items="${allRecentQues}" var="question">
		<div class="card post">
			<div class="user-info">
				<ul>
					<li><span class="fas fa-user-circle"
						style="font-size: 35px; padding: 2px;"></span></li>
					<li>
						<ul
							style="list-style: none; display: list-item; padding: 5px 15px; line-height: 0.9rem;">
							<li style="font-weight: bold;">${question.getUserName()}
							<li style="font-size: 10px;">${question.getDesig()}</li>
						</ul>
					</li>
					<li style="right: 2px;position: absolute;padding: 14px;">${question.getDatecreated()}</li>
				</ul>
			</div>
			<div class="card-body question-body">
				<h5 class="card-title">category: ${question.getTitle()}</h5>
				<p class="card-text question">
					<span style="font-size: 20px; font-weight: bold;">Ques. </span>${question.getQuestion()}</p>

				<!-- Answer button start -->

				<button type="button" class="btn answerbtn" data-toggle="modal"
					data-target="#answer${question.getQuestionId()}">Answer</button>
				<div id="answer${question.getQuestionId()}" class="modal fade" role="dialog">
					<div class="modal-dialog modal-lg">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Answer Question</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">
								<div class="list-group">
									<li><span class="fas fa-user-circle"
										style="font-size: 35px; padding: 2px;"></span></li>
									<li style="position: absolute; left: 58px;">
										<ul
											style="list-style: none; display: list-item; padding: 5px 15px; line-height: 1.4rem;">
											<li style="font-weight: bold;">${question.getUserName()}</li>
											<li style="font-size: 10px; color: #9E9E9E;">${question.getDesig()}</li>
										</ul>
									</li>
									<li style="right: 25px; position: absolute;"><span
										style="color: #9E9E9E;">posted on: </span>${question.getDatecreated()}</li>
								</div>
								<div class="well" style="font-size: 16px; padding: 5px;">
									<span>Question:</span>${question.getQuestion()}</div>
								<form method="post" action="addanswer.pforum">
									<div class="form-group">
										<input type="hidden" name="qid"
											value="${question.getQuestionId()}">
										<textarea class="form-control" rows="5" id="comment"
											name="answer" placeholder="Enter Answer..."></textarea>
									</div>
									<button type="submit" class="btn btn-primary btn-lg">Submit
										Answer</button>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Answer button end -->
				<!-- report buttonQuestion start -->
				<button type="button" class="btn reportbtn" data-toggle="modal"
					data-target="#report${question.getQuestionId()}">Report this question</button>
				<div id="report${question.getQuestionId()}" class="modal fade" role="dialog">
					<div class="modal-dialog modal-lg">

						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Report Question</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">
								<div class="list-group">
									<li><span class="fas fa-user-circle"
										style="font-size: 35px; padding: 2px;"></span></li>
									<li style="position: absolute; left: 58px;">
										<ul
											style="list-style: none; display: list-item; padding: 5px 15px; line-height: 1.4rem;">
											<c:set var="uCurrent" scope="session" value="${curuser}"/> 
											<li style="font-weight: bold;">${uCurrent.getFname()}</li>
											<li style="font-size: 10px; color: #9E9E9E;">${uCurrent.getDesig()}</li>
										</ul>
									</li>
									<li style="right: 25px; position: absolute;"><span
										style="color: #9E9E9E;">posted on: </span>${question.getDatecreated()}</li>
								</div>
								<div class="well" style="font-size: 16px; padding: 5px;">
									<span>Question:</span>${question.getQuestion()}</div>
								<form method="post" action="reportquestion.pforum">
									<div class="form-group">
										<input type="hidden" name="qid"
											value="${question.getQuestionId()}" />
										<textarea class="form-control" rows="5" id="report"
											name="report"
											placeholder="please enter reason for reporting..."></textarea>
									</div>
									<button type="submit" class="btn btn-primary btn-lg">Submit</button>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<!-- report Question button end -->
				<div class="list-group answers">
				<c:forEach items="${question.answers}" var="obj">
					<div class="list-group-item list-group-item-action">
						<span>Answered. </span>${obj.getAnswer()}
						 <span>By ~ ${obj.getUsernameAnswer()}</span>&nbsp <span>${obj.getAnswerDate()}</span>
						<!-- Report button for answer -->
						<button type="button" class="report_button" data-toggle="modal"
							data-target="#reportAnswer${obj.getAnsId()}">Report</button>
					</div>
					<div id="reportAnswer${obj.getAnsId()}" class="modal fade" role="dialog">
						<div class="modal-dialog modal-lg">

							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">Report This Answer</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<div class="modal-body">
									<div class="list-group">
										<li><span class="fas fa-user-circle"
											style="font-size: 35px; padding: 2px;"></span></li>
										<li style="position: absolute; left: 58px;">
											<ul
												style="list-style: none; display: list-item; padding: 5px 15px; line-height: 1.4rem;">
												<li style="font-weight: bold;">${uCurrent.getFname()}</li>
												<li style="font-size: 10px; color: #9E9E9E;">${uCurrent.getDesig()}</li>
											</ul>
										</li>
										<li style="right: 25px; position: absolute;"><span
											style="color: #9E9E9E;">posted on: </span>${question.getDatecreated()}</li>
									</div>
									<div class="well" style="font-size: 16px; padding: 5px;">
										<span>Answer:</span>${obj.getAnswer()}</div>
									<form method="post"
										action="reportanswer.pforum">
										<div class="form-group">
										<input name="qid" type="hidden" value="${question.getQuestionId()}" />
										<input name="aid" type="hidden" value="${obj.getAnsId() }" />
											<textarea class="form-control" rows="5" id="report"
												name="rptAns"
												placeholder="please enter reason for reporting..."></textarea>
										</div>
										<button type="submit" class="btn btn-primary btn-lg">Submit</button>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
			</c:forEach>
			</c:otherwise>
			</c:choose>
	</div>
	<div class="col-2"></div>
	</div>
	</div>
	<script src="other/js/jquery.min.js"></script>
	<script src="other/js/bootstrap.min.js"></script>
</body>
</html>