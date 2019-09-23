package com.sellfeed.aucLog;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AucLogLogic {
	Logger logger = LoggerFactory.getLogger(AucLogLogic.class);
	@Autowired
	public AucLogDao aucLogDao = null;
	public List<Map<String, Object>> aucLogList(Map<String, Object> pMap) {
		List<Map<String,Object>> aucList = null;
		logger.info("Logic| aucLogList 호출성공");
		aucList=aucLogDao.aucLogList(pMap);
		return aucList;
	}
	
	public int aucLogIns(Map<String,Object> pMap) {
		logger.info("Logic| aucLogIns 호출성공");
		int result;
		result = aucLogDao.aucLogIns(pMap);
		return result;
	}
}
