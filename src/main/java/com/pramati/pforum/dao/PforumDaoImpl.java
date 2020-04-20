package com.pramati.pforum.dao;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.pramati.pforum.model.Answer;
import com.pramati.pforum.model.Contactus;
import com.pramati.pforum.model.Employee;
import com.pramati.pforum.model.Question;
import com.pramati.pforum.model.ReportAnswer;
import com.pramati.pforum.model.ReportQuestion;

@Repository
public class PforumDaoImpl implements PforumDaoIface {

	@PersistenceContext
	private EntityManager em;

	public boolean registerEmp(Employee employee) {
		em.persist(employee);
		return true;

	}

	public boolean changePassword(Employee employee, String newPassKey) {
		employee.setPasskey(newPassKey);
		try {
			em.merge(employee);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public Employee loginEmp(String email, String passkey) {
		try {
			return (Employee) em.createQuery("from Employee where email=:email and passkey=:pass")
					.setParameter("email", email).setParameter("pass", passkey).getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	// to check employee exists already or not
	public int checkEmployeeExists(String email, int empId) {
		String query = "select count(id) from employee_reg where email=:email or employee_id=:empId";
		BigInteger count = (BigInteger) em.createNativeQuery(query).setParameter("email", email)
				.setParameter("empId", empId).getSingleResult();
		return count.intValue();
	}

	public int checkEmailExists(String email) {
		String query = "select count(id) from employee_reg where email=:email";
		BigInteger count = (BigInteger) em.createNativeQuery(query).setParameter("email", email).getSingleResult();
		return count.intValue();
	}

	// get All Questions
	@SuppressWarnings("unchecked")
	public List<Question> getAllQuestions() {
		return em.createQuery("from Question order by datecreated desc,questionId desc").getResultList();
	}

	// get all count of questions
	@SuppressWarnings("unchecked")
	public Map<String, Integer> catCount() {

		Map<String, Integer> catCount = new HashMap<>();
		List<Object[]> catCountResult = (List<Object[]>) em
				.createNativeQuery("select title,count(*) from questions group by title").getResultList();
		for (Object[] val : catCountResult) {
			catCount.put(val[0].toString(), Integer.parseInt(val[1].toString()));
		}
		return catCount;
	}

	// add Question
	public int addQuestion(Question question) {
		em.persist(question);
		return 1;
	}

	// add Answer
	public int addAnswer(Answer answer) {
		em.persist(answer);
		return 1;
	}

	// get All question by category
	@SuppressWarnings("unchecked")
	public List<Question> getAllQuestionByCategory(String cat) {
		return em.createQuery("from Question where title=:category order by datecreated,questionId desc")
				.setParameter("category", cat).getResultList();
	}

	// Question asked by logined User
	@SuppressWarnings("unchecked")
	public List<Question> getAllQuestionByLoginUser(String uname) {

		return (List<Question>) em.createQuery("from Question where questionedBy=:uname").setParameter("uname", uname)
				.getResultList();
	}

	// Answered by logined User

	@SuppressWarnings("unchecked")
	public List<Answer> getAllAnsweredByLoginUser(String username) {

		return (List<Answer>) em.createQuery("from Answer where answeredBy=:username")
				.setParameter("username", username).getResultList();
	}

	// Report answer
	public int reportAnswer(ReportAnswer reportAnswer) {
		em.persist(reportAnswer);
		return 1;
	}

	// Report Question
	public int reportQuestion(ReportQuestion reportQuestion) {
		em.persist(reportQuestion);
		return 1;
	}

	// save contact
	public String saveContactUs(Contactus contactus) {
		em.persist(contactus);
		return "Thank you for contacting us!";

	}

	// Search Question

	@SuppressWarnings("unchecked")
	public List<Question> searchQuestion(String searchText) {

		return (List<Question>) em.createQuery("from Question where question like ?0")
				.setParameter(0, "%" + searchText + "%").getResultList();
	}

}
