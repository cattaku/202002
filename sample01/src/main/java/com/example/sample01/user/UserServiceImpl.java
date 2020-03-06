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
	
	public List<Map<String, Object>> userList() throws Exception {
		
		List<Map<String, Object>> list = sql.selectList("mapper.study.userList");
		return list;
	}
	
	public Map<String, Object> loginChk(String userId, String userPw) throws Exception {
	
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("userPw", userPw);
		List<Map<String, Object>> list = sql.selectList("mapper.user.loginCheck", map);

		map.put("list", "list");
		return map;
	}

}
