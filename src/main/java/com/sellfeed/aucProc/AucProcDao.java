package com.sellfeed.aucProc;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AucProcDao {
	Logger logger = LoggerFactory.getLogger(AucProcDao.class);
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	public List<Map<String, Object>> auctionList(Map<String, Object> pMap) {
		List<Map<String,Object>> auctionList = null;
		logger.info("Dao| auctionList 호출성공");
		auctionList =  sqlSessionTemplate.selectList("auctionList",pMap);
		return auctionList;
	}
}




