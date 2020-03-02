package com.example.sample01.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl {
	
	@Autowired
	SqlSession sql;
	
	public Map<String, Object> userList(Map<String, Object> map) {
		
		List<Map<String, Object>> result = sql.selectList("user", map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		
		return resultMap;
		
	}

}
