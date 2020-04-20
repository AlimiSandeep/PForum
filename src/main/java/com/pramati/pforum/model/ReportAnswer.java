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
@Table(name = "report_answer")
public class ReportAnswer {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int reportId;
	private String reportStatement;
	private int quesId;
	private int ansId;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "ansId", referencedColumnName = "ansId", insertable = false, updatable = false)
	private Answer rAnswer;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "quesId", referencedColumnName = "questionId", insertable = false, updatable = false)
	private Question rQuesId;

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

	public int getAnsId() {
		return ansId;
	}

	public void setAnsId(int ansId) {
		this.ansId = ansId;
	}

	public Answer getrAnswer() {
		return rAnswer;
	}

	public void setrAnswer(Answer rAnswer) {
		this.rAnswer = rAnswer;
	}

	public Question getrQuesId() {
		return rQuesId;
	}

	public void setrQuesId(Question rQuesId) {
		this.rQuesId = rQuesId;
	}

	@Override
	public String toString() {
		return "ReportAnswer [reportId=" + reportId + ", reportStatement=" + reportStatement + ", quesId=" + quesId
				+ ", ansId=" + ansId + ", rAnswer=" + rAnswer + ", rQuesId=" + rQuesId + "]";
	}

}
