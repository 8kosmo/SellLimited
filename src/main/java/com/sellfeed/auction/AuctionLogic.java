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

import com.sellfeed.account.AccountDao;
import com.sellfeed.aucLog.AucLogDao;
import com.sellfeed.product.ProductDao;

@Service
public class AuctionLogic {
	Logger logger = LoggerFactory.getLogger(AuctionLogic.class);
	@Autowired
	private AuctionDao auctionDao = null;
	@Autowired
	private AucLogDao aucLogDao = null;
	@Autowired
	private ProductDao productDao = null;
	@Autowired
	private AccountDao accountDao = null;
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
	public List<Map<String, Object>> endAuctionList() {
		List<Map<String,Object>> rList = new ArrayList<>();
		rList = auctionDao.endAuctionList();
		return rList;
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor= {DataAccessException.class})
	@Pointcut(value="excution(* com.sellfeed.auction.*Logic.*(..)")
	public int endAuction(Map<String,Object> pMap) {
		logger.info("Logic| endAuctino 호출 성공");
		List<Map<String,Object>> looserList = new ArrayList<>();
		int result = 0;
		try {
			//입찰 패찰 UPDATE
			aucLogDao.aucWinner(pMap);
			//루저 리스트
			logger.info("패찰자 리스트가져요기");
			looserList = aucLogDao.LooserList(pMap);
			logger.info("패찰자 리스트 : "+looserList);
			//패찰자 보증금봔환
			logger.info("패찰자 보증금 반환");
			accountDao.returnDeposit(looserList);
			logger.info("성공");
			//경매진행중=> 배송준비중
			productDao.auct_end(pMap);
			result = 1;
			
		} catch (Exception e) {
			result = 0;
			throw e;
		}
		logger.info("AuctinoLogic endAuction 끝 | result= "+result);
		return result;				
	}
}
