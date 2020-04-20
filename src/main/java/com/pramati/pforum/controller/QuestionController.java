package com.pramati.pforum.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pramati.pforum.model.Answer;
import com.pramati.pforum.model.Employee;
import com.pramati.pforum.model.Question;
import com.pramati.pforum.model.ReportAnswer;
import com.pramati.pforum.model.ReportQuestion;
import com.pramati.pforum.service.PforumServiceIface;

@Controller
public class QuestionController {

	@Autowired
	private PforumServiceIface pforumServiceIface;

	@RequestMapping("/searchQues.pforum")
	public ModelAndView searchQuestion(@RequestParam("search") String searchText) {
		ModelAndView modelAndView = new ModelAndView();
		List<Question> searchQuestions = pforumServiceIface.searchQuestion(searchText);
		modelAndView.addObject("allsearchQuestions", searchQuestions);
		Map<String, Integer> allCatCount = pforumServiceIface.catCount();
		modelAndView.addObject("allcatcount", allCatCount);
		modelAndView.setViewName("Search");
		return modelAndView;
	}

	@RequestMapping("/addquestion.pforum")
	public ModelAndView addQuestion(@RequestParam("categories") String categories,
			@RequestParam("question") String question, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Employee curEmp = (Employee) session.getAttribute("curuser");
//		System.out.println(curEmp.toString());
		Question q = new Question();
		try {
			q.setDatecreated(
					new SimpleDateFormat("yyyy-MM-dd").parse(new SimpleDateFormat("yyyy-MM-dd").format(new Date())));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		q.setDesig(curEmp.getDesig());
		q.setQuestionedBy(curEmp.getUserName());
		q.setUserName(curEmp.getFname() + " " + curEmp.getLname());
		q.setTitle(categories);
		q.setQuestion(question);
		pforumServiceIface.addQuestion(q);
		mv.setViewName("redirect:mainpage.pforum");
		return mv;
	}

	@RequestMapping("/addanswer.pforum")
	public ModelAndView addAnswer(@RequestParam("qid") int qid, @RequestParam("answer") String answer,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Employee curEmp = (Employee) session.getAttribute("curuser");
		Answer a = new Answer();
		a.setAnswer(answer);
		a.setQid(qid);
		Date answerDate = null;
		try {
			answerDate = new SimpleDateFormat("yyyy-MM-dd")
					.parse(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			a.setAnswerDate(answerDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		a.setUsernameAnswer(curEmp.getFname() + " " + curEmp.getLname());
		a.setAnsweredBy(curEmp.getUserName());
		pforumServiceIface.addAnswer(a);
		mv.setViewName("redirect:mainpage.pforum");
		return mv;
	}

	@RequestMapping("/mainpage.pforum")
	public ModelAndView toMainPage() {
		ModelAndView mv = new ModelAndView();
		List<Question> allques = pforumServiceIface.getAllQuestions();
		mv.addObject("allques", allques);
		Map<String, Integer> allCatCount = pforumServiceIface.catCount();
		mv.addObject("allcatcount", allCatCount);
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping("/code.pforum")
	public ModelAndView toCodePage() {
		String cat = "Code";
		ModelAndView mv = new ModelAndView();
		List<Question> allques = pforumServiceIface.getAllQuestionByCategory(cat);
		mv.addObject("allques", allques);
		Map<String, Integer> allCatCount = pforumServiceIface.catCount();
		mv.addObject("allcatcount", allCatCount);
		mv.setViewName("Code");
		return mv;
	}

	@RequestMapping("/onboarding.pforum")
	public ModelAndView toOnbardingPage() {
		String cat = "Onboarding";
		ModelAndView mv = new ModelAndView();
		List<Question> allques = pforumServiceIface.getAllQuestionByCategory(cat);
		mv.addObject("allques", allques);
		Map<String, Integer> allCatCount = pforumServiceIface.catCount();
		mv.addObject("allcatcount", allCatCount);
		mv.setViewName("Onboarding");
		return mv;
	}

	@RequestMapping("/payroll.pforum")
	public ModelAndView toPayrollPage() {
		String cat = "Payroll";
		ModelAndView mv = new ModelAndView();
		List<Question> allques = pforumServiceIface.getAllQuestionByCategory(cat);
		mv.addObject("allques", allques);
		Map<String, Integer> allCatCount = pforumServiceIface.catCount();
		mv.addObject("allcatcount", allCatCount);
		mv.setViewName("Payroll");
		return mv;
	}

	@RequestMapping("/policies.pforum")
	public ModelAndView toPoliciesPage() {
		String cat = "Policies";
		ModelAndView mv = new ModelAndView();
		List<Question> allques = pforumServiceIface.getAllQuestionByCategory(cat);
		mv.addObject("allques", allques);
		Map<String, Integer> allCatCount = pforumServiceIface.catCount();
		mv.addObject("allcatcount", allCatCount);
		mv.setViewName("Policies");
		return mv;
	}

	@RequestMapping("/technical.pforum")
	public ModelAndView toTechnicalPage() {
		String cat = "technical";
		ModelAndView mv = new ModelAndView();
		List<Question> allques = pforumServiceIface.getAllQuestionByCategory(cat);
		mv.addObject("allques", allques);
		Map<String, Integer> allCatCount = pforumServiceIface.catCount();
		mv.addObject("allcatcount", allCatCount);
		mv.setViewName("Technical");
		return mv;
	}

	@RequestMapping("/reportquestion.pforum")
	public String reportQuestion(ReportQuestion reportQuestion) {

		pforumServiceIface.reportQuestion(reportQuestion);
		return "redirect:mainpage.pforum";
	}

	@RequestMapping("/reportanswer.pforum")
	public String reportAnswer(ReportAnswer reportAnswer) {
		pforumServiceIface.reportAnswer(reportAnswer);
		return "redirect:mainpage.pforum";
	}
}
