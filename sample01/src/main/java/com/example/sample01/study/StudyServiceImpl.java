package com.example.sample01.study;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sample01.common.Pagination;

@Service
public class StudyServiceImpl {

	@Autowired
	SqlSession sql;

	/* 영화 목록 */
	public List<Map<String, Object>> filmList(int start) throws Exception {

		int cnt = 10;
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("cnt", cnt);

		List<Map<String, Object>> list = sql.selectList("mapper.study.filmList", map);
		return list;

	}

	/* 대여 목록 */
	public Map<String, Object> rentalList(String filmTitle, int startList) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("filmTitle", filmTitle);
		resultMap.put("startList", startList);
		
		List<Map<String, Object>> list = sql.selectList("mapper.study.rentalList", resultMap);
		int listCnt = sql.selectOne("mapper.study.rentalCnt", resultMap); 
		
		resultMap.put("list", list);
		resultMap.put("listCnt", listCnt); 
		
		return resultMap;
		
	}
}
