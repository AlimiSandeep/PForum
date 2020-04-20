package com.pramati.pforum.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pramati.pforum.model.Employee;
import com.pramati.pforum.model.Question;
import com.pramati.pforum.service.PforumServiceIface;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	private PforumServiceIface pforumServiceIface;

	@RequestMapping("/")
	public String toDefaultpage() {
		return "index";
	}

	@RequestMapping("/LoginPage.pforum")
	public ModelAndView takeToLogin(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("curuser") != null) {
			mv.setViewName("main");
		} else {
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping("/login.pforum")
	public ModelAndView loginuser(@RequestParam("euname") String email, @RequestParam("epass") String pass,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String adminMail = "admin@gmail.com";
		String adminPass = "Admin@123";
		if (adminMail.equals(email) && adminPass.equals(pass)) {
			mv.setViewName("redirect:admin.pforum");
		} else {
			Employee emp = pforumServiceIface.loginEmp(email, pass);
			if (emp != null) {
				session.setAttribute("curuser", emp);
				List<Question> allques = pforumServiceIface.getAllQuestions();
				mv.addObject("allques", allques);
				Map<String, Integer> allCatCount = pforumServiceIface.catCount();
				mv.addObject("allcatcount", allCatCount);
				mv.addObject("curemp", emp);
				mv.setViewName("main");
			} else {
				mv.addObject("msg", "User doesn't exist or Wrong Password");
				mv.addObject("cssprop",
						"animation: shake 0.5s;animation-iteration-count: once;color: black;background-color:#F8F4F3;transition:all 2s;");
				mv.setViewName("login");
			}
		}
		return mv;
	}

	@RequestMapping("/RegisterPage.pforum")
	public String takeToReg() {
		return "Register";
	}

	@RequestMapping("/register.pforum")
	public ModelAndView regsiteruser(Employee employee) {
		ModelAndView mv = new ModelAndView();

		if (pforumServiceIface.registerEmp(employee))
			mv.addObject("msg", "Registered successfully");
		else
			mv.addObject("msg", "Employee already exists");

		mv.setViewName("login");
		return mv;
	}

	@RequestMapping("/changePassword.pforum")
	public ModelAndView changePassword(@RequestParam("newpwd") String newpwd,
			@RequestParam("curPwd") String curPassword, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Employee employee = (Employee) session.getAttribute("curuser");
		if (pforumServiceIface.loginEmp(employee.getEmail(), curPassword) != null) {
			if (pforumServiceIface.changePassword(employee, newpwd)) {
				modelAndView.addObject("msg",
						"<span style=\"color:green;font-size:20px;\">Updated password succesfully!</span>");
				modelAndView.setViewName("Settings");
			} else {
				modelAndView.addObject("msg",
						"<span style=\"color:red;font-size:20px;\">Some problem occurred! Try again</span>");
				modelAndView.setViewName("Settings");
			}
		} else {
			modelAndView.addObject("msg",
					"<span style=\"color:red;font-size:20px;\">Old password is incorrect!</span>");
			modelAndView.setViewName("Settings");
		}
		return modelAndView;
	}

}
