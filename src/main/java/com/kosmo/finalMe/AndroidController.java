package com.kosmo.finalMe;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.BoardVO;
import mybatis.IAndroidDAO;

public class AndroidController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("./boardObect.do")
	@ResponseBody
	public Map<String, Object> boardObject(HttpServletRequest req){
		
		Map<String, Object> map = new HashMap<String, Object>();
	
		ArrayList<BoardVO> lists =
				sqlSession.getMapper(IAndroidDAO.class).boardList();
		return map;
	}

}
