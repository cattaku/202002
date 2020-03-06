package com.example.sample01.study;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.sample01.common.Pagination;

@Controller
@RequestMapping("study")
public class StudyController {
	
	@Autowired
	private StudyServiceImpl studyService;
	
	
	@RequestMapping("jsonList")
	public String jsonList() throws Exception {
		return "/study/test001";
	}
	
	@RequestMapping("filmList")
	public String filmList(Model model) throws Exception {

		return "/study/filmList";
	}
	
	@RequestMapping("getfilmList")
	@ResponseBody
	public List<Map<String, Object>> getList(@RequestParam int startNum) throws Exception {
		
		List<Map<String, Object>> list = studyService.filmList(startNum);
		return list;
	}
	
	@RequestMapping("rentalList")
	public String rentalList() throws Exception {
		return "/study/rentalList";
	}
	
	@RequestMapping("getRentalList")
	@ResponseBody
	public Map<String, Object> getRentalList(@RequestParam String filmTitle,
										     @RequestParam(required=false, defaultValue="1")int page,
										     @RequestParam(required=false, defaultValue="1")int range
	) throws Exception {
		
		Map<String, Object> resultMap = studyService.rentalList(filmTitle, page, range);
			
		return resultMap;
	}	

}
