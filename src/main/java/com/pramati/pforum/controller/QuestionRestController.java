package com.pramati.pforum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.pramati.pforum.model.Question;
import com.pramati.pforum.service.PforumServiceIface;

@RestController
public class QuestionRestController {
	@Autowired
	private PforumServiceIface pforumServiceIface;

	@GetMapping(value = "rest/getall.pforum", produces = "application/json")
	public List<Question> getAllQuestions() {
		return pforumServiceIface.getAllQuestions();
	}

	@GetMapping(value = "rest/question/by/{cat.pforum}", produces = "application/json")
	public List<Question> getAllQuestionByCategory(@PathVariable("cat") String cat) {
		return pforumServiceIface.getAllQuestionByCategory(cat);
	}
}
