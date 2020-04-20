package com.pramati.pforum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pramati.pforum.dao.PforumAdminDaoIface;
import com.pramati.pforum.model.Answer;
import com.pramati.pforum.model.Contactus;
import com.pramati.pforum.model.Employee;
import com.pramati.pforum.model.Question;
import com.pramati.pforum.model.ReportedAnswers;
import com.pramati.pforum.model.ReportedQuestions;

@Service
@Transactional
public class PforumAdminServiceImpl implements PforumAdminServiceIface {
	@Autowired
	private PforumAdminDaoIface pforumAdminDaoIface;

	@Autowired
	private JavaMailSender javaMailSender;

	public List<ReportedQuestions> getReportQuestion() {
		return pforumAdminDaoIface.getReportQuestion();
	}

	public List<ReportedAnswers> getReportAnswer() {
		return pforumAdminDaoIface.getReportAnswer();
	}

	public Question questionById(int quesid) {

		return pforumAdminDaoIface.questionById(quesid);
	}

	public Answer answerById(int ansid) {

		return pforumAdminDaoIface.answerById(ansid);
	}

	public List<Employee> getAllEmployees() {
		return pforumAdminDaoIface.getAllEmployees();
	}

	public boolean deleteQuestion(int qid) {
		return pforumAdminDaoIface.deleteQuestion(qid);
	}

	public boolean deleteAnswer(int aid) {
		return pforumAdminDaoIface.deleteAnswer(aid);
	}

	public List<Contactus> getallContactUs() {
		return pforumAdminDaoIface.getallContactUs();
	}

	@Override
	public boolean sendEmail(String toMail, String replyMsg) {
//		System.out.println(replyMsg + " " + toMail);
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setTo(toMail);

		msg.setSubject("Feedback response");
		msg.setText(replyMsg);

		try {
			javaMailSender.send(msg);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

}
