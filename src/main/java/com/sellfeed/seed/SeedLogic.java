package com.sellfeed.seed;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeedLogic {
	Logger logger = LoggerFactory.getLogger(SeedLogic.class);
	
	@Autowired
	public SeedDao seedDao = null;
	
	public List<Map<String,Object>> seedList(Map<String, Object> pMap) {
		logger.info("============>seedList 호출 성공");
		List<Map<String,Object>> rList = null;
		rList = seedDao.seedList(pMap);
		return rList;
	}
	
	public int seedIns(Map<String, Object> pMap) {
		logger.info("============>seedIns 호출 성공");
		int result=0;
		result = seedDao.seedIns(pMap);
		return result;
	}
	
	public int bidWin(Map<String, Object> pMap) {
		logger.info("============>bidWin 호출 성공");
		int result=0;
		seedDao.bidLose(pMap);
		result = seedDao.bidWin(pMap);
		return result;
	}
}
