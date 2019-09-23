package com.sellfeed.seed;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeedDao {
	
	Logger logger = LoggerFactory.getLogger(SeedLogic.class);
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	
	public List<Map<String, Object>> seedList(Map<String, Object> pMap) {
		logger.info("============>seedList 호출 성공");
		List<Map<String, Object>> rList = null;
		sqlSessionTemplate.selectList("seedList",pMap);
		return rList;
	}

	public int seedIns(Map<String, Object> pMap) {
		logger.info("============>seedIns 호출 성공");
		int result=0;
		result = sqlSessionTemplate.update("seedIns",pMap);
		return result;
	}

	public int bidWin(Map<String, Object> pMap) {
		logger.info("============>bidWin 호출 성공");
		int result=0;
		result = sqlSessionTemplate.update("bidWin",pMap);
		return result;
	}

	public int bidLose(Map<String, Object> pMap) {
		logger.info("============>bidLose 호출 성공");
		int result=0;
		result = sqlSessionTemplate.update("bidLose",pMap);
		return result;
	}
}
