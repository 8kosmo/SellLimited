package com.sellfeed.aucProc;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AucProcLogic {
	Logger logger = LoggerFactory.getLogger(AucProcLogic.class);
	@Autowired
	public AucProcDao aucProcDao = null;
	public List<Map<String, Object>> auctionList(Map<String, Object> pMap) {
		logger.info("Logic| auctionList 호출성공");
		List<Map<String,Object>> auctionList = null;
		auctionList = aucProcDao.auctionList(pMap);
		return auctionList;
	} 
}
