package com.example.sample01;

import org.junit.Test;

import com.example.sample01.common.Pagination;

public class PageTest {
	
	@Test
	public void test() {
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(20, 11, 300);
		//pagination.pageInfo(page, range, listCnt);
		
		System.out.println("pageInfo"+ pagination.toString());
		
		
	}

}
