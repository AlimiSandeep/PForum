package com.pramati.pforum.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "questions")
public class Question implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int questionId;

	@Temporal(TemporalType.DATE)
	private Date datecreated;

	private String desig;

	@Column(length = 2000)
	private String question;

	private String questionedBy;

	private String title;

	private String userName;

	@OneToMany(mappedBy = "question", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Answer> answers;

	@OneToMany(mappedBy = "rQuestion", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<ReportQuestion> reportQuestion;

	@OneToMany(mappedBy = "rQuesId", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<ReportAnswer> reportAnswerQuesId;

	public List<ReportQuestion> getReportQuestion() {
		return reportQuestion;
	}

	public void setReportQuestion(List<ReportQuestion> reportQuestion) {
		this.reportQuestion = reportQuestion;
	}

	public List<ReportAnswer> getReportAnswerQuesId() {
		return reportAnswerQuesId;
	}

	public String getQuestionedBy() {
		return questionedBy;
	}

	public void setQuestionedBy(String questionedBy) {
		this.questionedBy = questionedBy;
	}

	public void setReportAnswerQuesId(List<ReportAnswer> reportAnswerQuesId) {
		this.reportAnswerQuesId = reportAnswerQuesId;
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDesig() {
		return desig;
	}

	public void setDesig(String desig) {
		this.desig = desig;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public void setDatecreated(Date datecreated) {
		this.datecreated = new Date(datecreated.getTime());
	}

	public Date getDatecreated() {
		return (Date) datecreated.clone();
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = "<pre>" + question + "</pre>";
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Question [questionId=" + questionId + ", datecreated=" + datecreated + ", question=" + question
				+ ", title=" + title + ", userName=" + userName + ", desig=" + desig + ", answers=" + answers
				+ ", reportQuestion=" + reportQuestion + ", reportAnswerQuesId=" + reportAnswerQuesId + "]";
	}

}
