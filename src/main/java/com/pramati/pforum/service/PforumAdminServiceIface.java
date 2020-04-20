package com.pramati.pforum.service;

import java.util.List;

import com.pramati.pforum.model.Answer;
import com.pramati.pforum.model.Contactus;
import com.pramati.pforum.model.Employee;
import com.pramati.pforum.model.Question;
import com.pramati.pforum.model.ReportedAnswers;
import com.pramati.pforum.model.ReportedQuestions;

public interface PforumAdminServiceIface {
	
	boolean sendEmail(String toMail,String replyMsg);
	
    List<ReportedQuestions> getReportQuestion();

    List<ReportedAnswers> getReportAnswer();

    Question questionById(int quesid);

    Answer answerById(int ansid);

    List<Employee> getAllEmployees();

    boolean deleteQuestion(int qid);

    boolean deleteAnswer(int aid);

    List<Contactus> getallContactUs();
}
