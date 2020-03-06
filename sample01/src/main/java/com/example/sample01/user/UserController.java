package com.example.sample01.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	UserServiceImpl userService;
	
	
	@RequestMapping("userList")
	public String userList(Model model) throws Exception{
		
		List<Map<String, Object>> list = userService.userList();
		model.addAttribute("result", list);
		
		return "user/user0100";
	}	
	
	@RequestMapping("login")
	public String login() throws Exception {
		return "user/login";
	}
	
	@RequestMapping("loginChk")
	@ResponseBody
	public Map<String, Object> loginChk(@RequestParam String userId, @RequestParam String userPw) throws Exception{
		
		System.out.println("::::::::::::::userId::::::::::"+ userId);
		System.out.println("::::::::::::::userPw::::::::::"+ userPw);
		Map<String, Object> map = userService.loginChk(userId, userPw);
		return map;
	}
	
	
}
