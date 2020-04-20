package com.pramati.pforum.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.pramati.pforum.model.Answer;
import com.pramati.pforum.model.Contactus;
import com.pramati.pforum.model.Employee;
import com.pramati.pforum.model.Question;
import com.pramati.pforum.model.ReportAnswer;
import com.pramati.pforum.model.ReportQuestion;
import com.pramati.pforum.model.ReportedAnswers;
import com.pramati.pforum.model.ReportedQuestions;

@Repository
public class PforumAdminDaoImpl implements PforumAdminDaoIface {

	@PersistenceContext
	private EntityManager em;

	@SuppressWarnings("unchecked")
	public List<ReportedQuestions> getReportQuestion() {

		List<ReportQuestion> allques = (List<ReportQuestion>) em.createQuery("from ReportQuestion q order by q.id desc")
				.getResultList();
		List<ReportedQuestions> allreportedQuestions = new ArrayList<ReportedQuestions>();
		for (ReportQuestion reportQuestion : allques) {
			int questionId = reportQuestion.getQuesId();
			Question question = this.questionById(questionId);
			ReportedQuestions reportedQuestions = new ReportedQuestions();
			reportedQuestions.setQuesId(questionId);
			reportedQuestions.setQuesCreateDate(question.getDatecreated());
			reportedQuestions.setQuesCreateUser(question.getUserName());
			reportedQuestions.setQuesCreateUserDesig(question.getDesig());
			reportedQuestions.setQuestionReportText(reportQuestion.getReportStatement());
			reportedQuestions.setQuestionText(question.getQuestion());
			allreportedQuestions.add(reportedQuestions);
		}

		return allreportedQuestions;
	}

	@SuppressWarnings("unchecked")
	public List<ReportedAnswers> getReportAnswer() {

		List<ReportAnswer> allans = (List<ReportAnswer>) em.createQuery("from ReportAnswer q order by q.id desc")
				.getResultList();
		List<ReportedAnswers> allreportedAnswers = new ArrayList<ReportedAnswers>();
		for (ReportAnswer reportAnswer : allans) {
			int answerId = reportAnswer.getAnsId();
			int questionId = reportAnswer.getQuesId();
			Question question = this.questionById(questionId);
			Answer answer = this.answerById(answerId);
			ReportedAnswers reportedAnswers = new ReportedAnswers();
			reportedAnswers.setAnswerId(answerId);
			reportedAnswers.setAnswerCreateDate(answer.getAnswerDate());
			reportedAnswers.setQuesText(question.getQuestion());
			reportedAnswers.setUserName(answer.getUsernameAnswer());
			reportedAnswers.setDesign(question.getDesig());
			reportedAnswers.setReportReason(reportAnswer.getReportStatement());
			reportedAnswers.setAnswer(answer.getAnswer());
			allreportedAnswers.add(reportedAnswers);
		}
		return allreportedAnswers;
	}

	public Question questionById(int quesid) {

		return em.find(Question.class, quesid);
	}

	public Answer answerById(int ansid) {

		return em.find(Answer.class, ansid);
	}

	@SuppressWarnings({ "unchecked" })
	public List<Employee> getAllEmployees() {

		return em.createQuery("from Employee").getResultList();
	}

	public boolean deleteQuestion(int qid) {

		em.remove(questionById(qid));
		return true;
	}

	public boolean deleteAnswer(int aid) {

		em.createNativeQuery("delete from report_answer where ans_id=:ansid").setParameter("ansid", aid)
				.executeUpdate();
		em.createNativeQuery("delete from answers where ans_id=:ansid").setParameter("ansid", aid).executeUpdate();
		return true;
	}

	@SuppressWarnings({ "unchecked" })
	public List<Contactus> getallContactUs() {

		return em.createQuery("from Contactus").getResultList();
	}
}
