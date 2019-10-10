package com.sellfeed.auction;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuctionLogic {
	Logger logger = LoggerFactory.getLogger(AuctionLogic.class);
	@Autowired
	public AuctionDao auctionDao = null;
	public List<Map<String, Object>> beforeAuctionList() {
		List<Map<String,Object>> rList = new ArrayList<>();
		rList = auctionDao.beforeAuctionList();
		return rList;
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor= {DataAccessException.class})
	@Pointcut(value="excution(* com.sellfeed.auction.*Logic.*(..)")
	public void auctionIns(Map<String, Object> pMap) {
		logger.info("###########################################{auctions호출 성공///Logic}");
		int step1, step2 =0; 
		try {
			step1=auctionDao.auctionIns(pMap);
			step2=auctionDao.statusAuction(pMap);
		} catch (DataAccessException e) {
			throw e;
		}
	}
}
