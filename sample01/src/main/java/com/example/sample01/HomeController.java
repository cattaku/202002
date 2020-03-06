package com.example.sample01;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	
	@RequestMapping("") 
	public String home(Model model) throws Exception {

		  return "home";
	}
	@RequestMapping("study") 
	public String study() throws Exception {
		
		return "study/studyMain";
	}

}
