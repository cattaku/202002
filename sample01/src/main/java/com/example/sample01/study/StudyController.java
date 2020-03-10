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
	
	//영화리스트
	@RequestMapping("filmList")
	public String filmList(Model model) throws Exception {

		return "/study/filmList";
	}
	
	//영화리스트 검색
	@RequestMapping("getfilmList")
	@ResponseBody
	public List<Map<String, Object>> getList(@RequestParam int startNum) throws Exception {
		
		List<Map<String, Object>> list = studyService.filmList(startNum);
		return list;
	}
	
	// 렌탈 페이지
	@RequestMapping("rentalList")
	public String rentalList() throws Exception {
		return "/study/rentalList";
	}
	
	// 렌탈 리스트 검색
	@RequestMapping("getRentalList")
	@ResponseBody
	public Map<String, Object> getRentalList(@RequestParam String filmTitle,
			                                 @RequestParam int startList) throws Exception {
		
		Map<String, Object> resultMap = studyService.rentalList(filmTitle, startList);
			
		return resultMap;
	}	

}
