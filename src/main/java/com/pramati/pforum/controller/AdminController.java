
package com.pramati.pforum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pramati.pforum.model.Contactus;
import com.pramati.pforum.model.Employee;
import com.pramati.pforum.model.ReportedAnswers;
import com.pramati.pforum.model.ReportedQuestions;
import com.pramati.pforum.service.PforumAdminServiceIface;

@Controller
public class AdminController {

	@Autowired
	private PforumAdminServiceIface pforumAdminServiceIface;

	@RequestMapping("/admin.pforum")
	public ModelAndView allProfileData(HttpSession session) {

		List<ReportedQuestions> allReportQues = pforumAdminServiceIface.getReportQuestion();
		List<ReportedAnswers> allReportAns = pforumAdminServiceIface.getReportAnswer();
		List<Employee> emp = pforumAdminServiceIface.getAllEmployees();
		List<Contactus> allcontactus = pforumAdminServiceIface.getallContactUs();

		ModelAndView mv = new ModelAndView();
		mv.addObject("allreportques", allReportQues);
		mv.addObject("allreportans", allReportAns);
		mv.addObject("allemp", emp);
		mv.addObject("allcontactus", allcontactus);

		mv.addObject("msg", session.getAttribute("msg"));
		session.invalidate();
		mv.setViewName("AdminIndex");
		return mv;
	}

	@RequestMapping("/sendEmail")
	public ModelAndView sendEmail(@RequestParam("email") String toMail, @RequestParam String replymsg,
			HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();

		boolean status = pforumAdminServiceIface.sendEmail(toMail, replymsg);
		if (status)
			request.getSession().setAttribute("msg", "Sent feedback mail successfully");
		else
			request.getSession().setAttribute("msg", "Unable to send mail..Something went wrong...");
		mv.setViewName("redirect:/admin.pforum");
		return mv;

	}

	@RequestMapping("/admin/que/{qid}.pforum")
	public ModelAndView deleteReportedQuestion(@PathVariable("qid") int qid, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		String path = "redirect:/admin.pforum";
		if (pforumAdminServiceIface.deleteQuestion(qid)) {
			request.getSession().setAttribute("msg", "Reported question deleted successfully");
		} else {
			request.getSession().setAttribute("msg", "Not able to delete reported question");
		}
		modelAndView.setViewName(path);
		return modelAndView;
	}

	@RequestMapping("/admin/ans/{aid}.pforum")
	public ModelAndView deleteReportedAnswer(@PathVariable("aid") int aid, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		String path = "redirect:/admin.pforum";
		if (pforumAdminServiceIface.deleteAnswer(aid)) {
			request.getSession().setAttribute("msg", "Reported answer deleted successfully");

		} else {
			request.getSession().setAttribute("msg", "Not able to delete reported answer");
		}
		modelAndView.setViewName(path);
		return modelAndView;
	}

}
