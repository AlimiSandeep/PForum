package com.pramati.pforum.model;

import java.util.Date;

public class ReportedQuestions {
	private int quesId;
	private String questionReportText;
	private String questionText;
	private String answerText;
	private String quesCreateUser;
	private String quesCreateUserDesig;
	private Date quesCreateDate = null;

	public int getQuesId() {
		return quesId;
	}

	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}

	public String getQuestionReportText() {
		return questionReportText;
	}

	public void setQuestionReportText(String questionReportText) {
		this.questionReportText = questionReportText;
	}

	public String getQuestionText() {
		return questionText;
	}

	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}

	public String getAnswerText() {
		return answerText;
	}

	public void setAnswerText(String answerText) {
		this.answerText = answerText;
	}

	public String getQuesCreateUser() {
		return quesCreateUser;
	}

	public void setQuesCreateUser(String quesCreateUser) {
		this.quesCreateUser = quesCreateUser;
	}

	public String getQuesCreateUserDesig() {
		return quesCreateUserDesig;
	}

	public void setQuesCreateUserDesig(String quesCreateUserDesig) {
		this.quesCreateUserDesig = quesCreateUserDesig;
	}

	public Date getQuesCreateDate() {
		return quesCreateDate;
	}

	public void setQuesCreateDate(Date quesCreateDate) {
		this.quesCreateDate = quesCreateDate;
	}

}