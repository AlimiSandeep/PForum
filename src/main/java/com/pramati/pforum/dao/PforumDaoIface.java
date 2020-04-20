package com.pramati.pforum.dao;

import java.util.List;
import java.util.Map;

import com.pramati.pforum.model.Answer;
import com.pramati.pforum.model.Contactus;
import com.pramati.pforum.model.Employee;
import com.pramati.pforum.model.Question;
import com.pramati.pforum.model.ReportAnswer;
import com.pramati.pforum.model.ReportQuestion;

public interface PforumDaoIface {
	boolean registerEmp(Employee employee);

	Employee loginEmp(String username, String passkey);

	int checkEmployeeExists(String email,int empId);
	
	int checkEmailExists(String email);

	List<Question> getAllQuestions();

	int addQuestion(Question question);

	int addAnswer(Answer answer);

	List<Question> getAllQuestionByCategory(String cat);

	List<Question> getAllQuestionByLoginUser(String username);

	List<Answer> getAllAnsweredByLoginUser(String username);

	int reportQuestion(ReportQuestion reportQuestion);

	int reportAnswer(ReportAnswer reportAnswer);

	boolean changePassword(Employee employee, String newPassKey);

	String saveContactUs(Contactus contactus);

	List<Question> searchQuestion(String searchText);

	Map<String, Integer> catCount();
}
