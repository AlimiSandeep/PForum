package com.pramati.pforum.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pramati.pforum.model.Answer;
import com.pramati.pforum.model.Contactus;
import com.pramati.pforum.model.Employee;
import com.pramati.pforum.model.Question;
import com.pramati.pforum.service.PforumServiceIface;

@Controller
public class OtherPageController {
	@Autowired
	private PforumServiceIface pforumServiceIface;

	 @RequestMapping("/profile.pforum")
	    public ModelAndView allProfileData(HttpSession session) {
	        Employee u = (Employee) session.getAttribute("curuser");
	        String username = u.getUserName();
	        List<Question> allRecentQues = pforumServiceIface.getAllQuestionByLoginUser(username);
	        List<Answer> allAnsByUser = pforumServiceIface.getAllAnsweredByLoginUser(username);
	        ModelAndView mv = new ModelAndView();
	        mv.addObject("empinfo", u);
	        mv.addObject("allquesbyuser", allRecentQues);
	        mv.addObject("allansbyuser", allAnsByUser);
	        mv.setViewName("Profile");
	        return mv;
	    }

	@RequestMapping("/setting.pforum")
	public String toSettingPage() {
		return "Settings";
	}

	@RequestMapping("/aboutus.pforum")
	public String toAboutUsPage() {
		return "AboutUs";
	}

	@RequestMapping("/contactus.pforum")
	public String toContactUsPage() {
		return "Contact";
	}

	@RequestMapping("/saveContactus.pforum")
	public ModelAndView saveContactUs(Contactus contactus) {
//		System.out.println(contactus);
		ModelAndView modelAndView = new ModelAndView();
		String msg = pforumServiceIface.saveContactUs(contactus);
		modelAndView.addObject("msg", msg);
		modelAndView.setViewName("Contact");
		return modelAndView;
	}

	@RequestMapping("/logout.pforum")
	public String logout(HttpSession session) {
		session.removeAttribute("curuser");
		session.invalidate();
		return "login";
	}
}
