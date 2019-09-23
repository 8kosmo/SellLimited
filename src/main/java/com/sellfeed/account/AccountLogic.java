package com.sellfeed.account;

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
public class AccountLogic {
	
	Logger logger = LoggerFactory.getLogger(AccountLogic.class);
	
	@Autowired
	public AccountDao accountDao = null;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor= {DataAccessException.class})
	@Pointcut(value="execution(* com.sellfeed.account.*Logic.*(..)")
	public void accountMake(Map<String, Object> pMap) {
		logger.info("=================>accountMake 호출 성공");
		String acct_number = "";
		//if문으로 분기해야 하는건가? 조건을 뭘로 해야하지?
			try {
				acct_number = accountDao.getAcct_number();
				pMap.put("acct_number", acct_number);
				accountDao.accountMake(pMap);
			} catch (DataAccessException e) {
				throw e;
			}
	}
	
	public List<Map<String, Object>> accountList(Map<String, Object> pMap) {
		logger.info("=================>accountList 호출 성공");
		List<Map<String,Object>> rList = null;
		rList = accountDao.accountList(pMap);
		return rList;
	}
	
	public int accountIns(Map<String,Object> pMap) {
		int result=0;
		logger.info("=================>accountIns 호출 성공");
		result=accountDao.accountIns(pMap);
		return result;
	}
	
	public int accountHidden(Map<String, Object> pMap) {
		logger.info("=================>accountHidden 호출 성공");
		int result = 0;
		result = accountDao.accountHidden(pMap);	
		return result;
	}
	
	public String nowPoint(Map<String, Object> pMap) {
	    logger.info("=================>nowPoint 호출 성공");
        String result = accountDao.nowPoint(pMap);
        return result;
	}
}
