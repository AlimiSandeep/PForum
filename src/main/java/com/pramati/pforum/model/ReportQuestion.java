package com.pramati.pforum.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "report_question")
public class ReportQuestion {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int reportId;
	String reportStatement;
	private int quesId;
	private String reportedBy;

	public String getReportedBy() {
		return reportedBy;
	}

	public void setReportedBy(String reportedBy) {
		this.reportedBy = reportedBy;
	}

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "quesId", referencedColumnName = "questionId", insertable = false, updatable = false)
	private Question rQuestion;

	public int getReportId() {
		return reportId;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}

	public String getReportStatement() {
		return reportStatement;
	}

	public void setReportStatement(String reportStatement) {
		this.reportStatement = reportStatement;
	}

	public int getQuesId() {
		return quesId;
	}

	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}

	public Question getrQuestion() {
		return rQuestion;
	}

	public void setrQuestion(Question rQuestion) {
		this.rQuestion = rQuestion;
	}

	@Override
	public String toString() {
		return "ReportQuestion [reportId=" + reportId + ", reportStatement=" + reportStatement + ", quesId=" + quesId
				+ ", reportedBy=" + reportedBy + ", rQuestion=" + rQuestion + "]";
	}

}
