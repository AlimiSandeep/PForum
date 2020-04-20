package com.pramati.pforum.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "answers")
public class Answer {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int ansId;

	@Column
	private String usernameAnswer;

	@Column(length = 3000)
	private String answer;

	@Temporal(TemporalType.DATE)
	private Date answerDate;

	@Column
	private String answeredBy;

	@Column
	private int qid;

	@OneToMany(mappedBy = "rAnswer", cascade = CascadeType.ALL, orphanRemoval = true)
	@JsonIgnore
	private List<ReportAnswer> reportAnswer;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "qid", referencedColumnName = "QUESTIONID", insertable = false, updatable = false)
	private Question question;

	public List<ReportAnswer> getReportAnswer() {
		return reportAnswer;
	}

	public void setReportAnswer(List<ReportAnswer> reportAnswer) {
		this.reportAnswer = reportAnswer;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public int getAnsId() {
		return ansId;
	}

	public String getAnsweredBy() {
		return answeredBy;
	}

	public void setAnsweredBy(String answeredBy) {
		this.answeredBy = answeredBy;
	}

	public void setAnsId(int ansId) {
		this.ansId = ansId;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public String getUsernameAnswer() {
		return usernameAnswer;
	}

	public void setUsernameAnswer(String usernameAnswer) {
		this.usernameAnswer = usernameAnswer;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = "<pre>" + answer + "</pre>";
	}

	public Date getAnswerDate() {
		return (Date) answerDate.clone();
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = new Date(answerDate.getTime());
	}

	
	/*If uncommented throws stackoverflow error for profile.pforum
	 * @Override public String toString() { return "Answer [ansId=" + ansId +
	 * ", usernameAnswer=" + usernameAnswer + ", answer=" + answer + ", answerDate="
	 * + answerDate + ", answeredBy=" + answeredBy + ", qid=" + qid +
	 * ", reportAnswer=" + reportAnswer + ", question=" + question + "]"; }
	 */
}
