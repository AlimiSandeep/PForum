package com.pramati.pforum.model;

import java.util.Date;

public class ReportedAnswers {
	
	private String userName;
	private int answerId;
	private int questionId;
	private String answer;
	private Date answerCreateDate = null;
	private String design;
	private String quesText;
	private String reportReason;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getAnswerId() {
		return answerId;
	}

	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getAnswerCreateDate() {
		return answerCreateDate;
	}

	public void setAnswerCreateDate(Date answerCreateDate) {
		this.answerCreateDate = answerCreateDate;
	}

	public String getDesign() {
		return design;
	}

	public void setDesign(String design) {
		this.design = design;
	}

	public String getQuesText() {
		return quesText;
	}

	public void setQuesText(String quesText) {
		this.quesText = quesText;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

}
