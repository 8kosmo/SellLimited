package com.sellfeed.aucLog;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AucLogDao {
	Logger logger = LoggerFactory.getLogger(AucLogDao.class);
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	public List<Map<String, Object>> aucLogList(Map<String, Object> pMap) {
		logger.info("Dao| aucLogList 호출성공");
		List<Map<String, Object>> aucList = null;
		aucList = sqlSessionTemplate.selectList("aucLogList",pMap);
		return aucList;
	}
	
	public int aucLogIns(Map<String, Object> pMap) {
		logger.info("Dao| highPrice 호출성공");
		int result = 0;
		result = sqlSessionTemplate.update("aucLogIns",pMap);
		return result;
	}

}
