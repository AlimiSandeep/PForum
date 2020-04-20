package com.pramati.pforum.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pramati.pforum.dao.PforumDaoIface;
import com.pramati.pforum.model.Answer;
import com.pramati.pforum.model.Contactus;
import com.pramati.pforum.model.Employee;
import com.pramati.pforum.model.Question;
import com.pramati.pforum.model.ReportAnswer;
import com.pramati.pforum.model.ReportQuestion;

@Service
@Transactional
public class PforumServiceImpl implements PforumServiceIface {
	@Autowired
	private PforumDaoIface pforumDaoIface;

	public boolean registerEmp(Employee employee) {

		int count = checkEmployeeExists(employee.getEmail(), employee.getEmployeeId());
		if (count == 0)
			return pforumDaoIface.registerEmp(employee);
		else
			return false;
	}

	public int checkEmployeeExists(String email, int empId) {

		return pforumDaoIface.checkEmployeeExists(email, empId);
	}

	public Employee loginEmp(String email, String passkey) {
		int exists = pforumDaoIface.checkEmailExists(email);
		if (exists != 0)
			return pforumDaoIface.loginEmp(email, passkey);
		else
			return null;
	}

	public List<Question> getAllQuestions() {
		return pforumDaoIface.getAllQuestions();
	}

	public int addQuestion(Question question) {
		return pforumDaoIface.addQuestion(question);
	}

	public int addAnswer(Answer answer) {
		return pforumDaoIface.addAnswer(answer);
	}

	public List<Question> getAllQuestionByCategory(String cat) {
		return pforumDaoIface.getAllQuestionByCategory(cat);
	}

	public List<Question> getAllQuestionByLoginUser(String username) {
		return pforumDaoIface.getAllQuestionByLoginUser(username);
	}

	public List<Answer> getAllAnsweredByLoginUser(String username) {
		return pforumDaoIface.getAllAnsweredByLoginUser(username);
	}

	public int reportQuestion(ReportQuestion reportQuestion) {
		return pforumDaoIface.reportQuestion(reportQuestion);
	}

	public int reportAnswer(ReportAnswer reportAnswer) {
		return pforumDaoIface.reportAnswer(reportAnswer);
	}

	public boolean changePassword(Employee employee, String newPassKey) {
		return pforumDaoIface.changePassword(employee, newPassKey);
	}

	public String saveContactUs(Contactus contactus) {
		return pforumDaoIface.saveContactUs(contactus);
	}

	public List<Question> searchQuestion(String searchText) {
		return pforumDaoIface.searchQuestion(searchText);
	}

	public Map<String, Integer> catCount() {
		return pforumDaoIface.catCount();
	}

}
