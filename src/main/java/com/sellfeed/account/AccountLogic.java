package com.sellfeed.account;

import java.util.ArrayList;
import java.util.HashMap;
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
   int acct_balance = 0;
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
   
   public Map<String, Object> accountIns(Map<String,Object> pMap) {
      int result=0;
      logger.info("=================>accountIns 호출 성공");
      String trade = pMap.get("trade").toString();                           			// 입금 or 출금
      int acct_balance = accountDao.accountNowBalance(pMap.get("mem_id").toString());   // 현재 잔액
      int trade_ammount = Integer.parseInt(pMap.get("trade_ammount").toString());       // 거래할 금액
      //int charge_amount = Integer.parseInt(pMap.get("charge_amount").toString());
      //거래 종류에 따라  조회한 잔액(line:50)을 조작하여 pMap에 다시 넣어줌.=> SQL문으로 잔액을 계산할 필요가 없어짐(기존 방법으로는 차감도 불가능했음)
      logger.info("1 : "+acct_balance);
      if(trade.equals("입금")) {
            acct_balance = acct_balance+trade_ammount;
         } 
         else if(trade.equals("출금")) {
            acct_balance = acct_balance-trade_ammount;
         }
      logger.info("2 : "+acct_balance);
      pMap.put("acct_balance",acct_balance);
      result=accountDao.accountIns(pMap);
      Map<String,Object> rMap = new HashMap<>();
      rMap.put("result", result);
      rMap.put("acct_balance", acct_balance);
      return rMap;
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

   public int accountNowBalance(String mem_id) {
      logger.info("=================>NowBalance 호출 성공");
      int acct_balance = 0;
      acct_balance = accountDao.accountNowBalance(mem_id);
      logger.info("잔액"+acct_balance);
      return acct_balance;
   }


   public int accountCharge(Map<String, Object> pMap) {
      logger.info("=================>accountCharge 호출 성공");
      logger.info(pMap.toString());
      int result = 0;
      pMap.put("charge_code"," ");
      result = accountDao.accountCharge(pMap);
      return result;
   }

   public List<Map<String, Object>> accountStatusList() {
      List<Map<String,Object>> accountStatusList = new ArrayList<>();
      accountStatusList = accountDao.accountStatusList();
      return accountStatusList;
   }

   @Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor= {DataAccessException.class})
   @Pointcut(value="execution(* com.sellfeed.account.*Logic.*(..)")
   public int managerPermissionAccount(String charge_code, Map<String, Object> pMap) {
	  int result = 0;
      try {
    	   result = accountDao.managerPermissionAccount(charge_code);
    	   accountIns(pMap);
	} catch (DataAccessException e) {
		throw e;
	}
      return result;
   }

	public int managerRefuseAcct(String charge_code) {
		int result=0;
		result = accountDao.managerRefuseAcct(charge_code);
		return result;
	}
}