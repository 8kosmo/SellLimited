package com.sellfeed.account;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;


@Service
public class AccountDao {
   
   Logger logger = LoggerFactory.getLogger(AccountDao.class);
   
   @Autowired
   public SqlSessionTemplate sqlSessionTemplate = null;
   
   public void accountMake(Map<String, Object> pMap) throws DataAccessException {
      logger.info("=================>accountMake 호출 성공");
      sqlSessionTemplate.update("accountMake",pMap);
   }
   
   public List<Map<String, Object>> accountList(Map<String, Object> pMap) {
      List<Map<String,Object>> rList = null;
      rList=sqlSessionTemplate.selectList("accountList",pMap);
      return rList;
   }
   public int accountNowBalance(String mem_id) {
      logger.info(mem_id);
      int acct_balance = sqlSessionTemplate.selectOne("accountNowBalance",mem_id);
      logger.info("잔액:::::::::::::::" +acct_balance);
      return acct_balance;
   }
   
   public int accountIns(Map<String, Object> pMap) {
      logger.info("=================>accountIns 호출 성공");
      int result=0;
      logger.info("accountIns : "+pMap);
      result = sqlSessionTemplate.update("accountIns",pMap);
      return result;
   }
   
   public String getAcct_number() {
      logger.info("=================>getAcct_number 호출 성공");
      String acct_number = "";
      acct_number = sqlSessionTemplate.selectOne("getAcct_number");
      return acct_number;
   }

   public int accountHidden(Map<String, Object> pMap) {
      logger.info("=================>accountHidden 호출 성공");
      int result=0;
      result = sqlSessionTemplate.update("accountHidden",pMap);
      return result;
   }
   
   public String nowPoint(Map<String, Object> pMap) {
       logger.info("===================>nowPoint 호출 성공");
       String result = "";
       result = sqlSessionTemplate.selectOne("nowPoint",pMap);
       return result;
   }

   public int accountCharge(Map<String, Object> pMap) {
      int result = 0;
      result = sqlSessionTemplate.update("accountCharge",pMap);
      return result;
   }

   public List<Map<String, Object>> accountStatusList() {
      List<Map<String,Object>> accountStatusList = new ArrayList<>();
      accountStatusList = sqlSessionTemplate.selectList("accountStatusList");
      return accountStatusList;
   }

   public int managerPermissionAccount(String charge_code) {
      int result = sqlSessionTemplate.update("managerPermissionAccount",charge_code);
      return result;
   }

	public String acct_number(String mem_id) {
		String acct_number ="";
		acct_number = sqlSessionTemplate.selectOne("acct_number",mem_id);
		return acct_number;
	}

	public int managerRefuseAcct(String charge_code) {
		int result=0;
		result = sqlSessionTemplate.update("managerRefuseAcct", charge_code);
		return result;
	}

	public void returnDeposit(List<Map<String,Object>> looserList) {
		int result = 0;
		result = sqlSessionTemplate.insert("returnDeposit",looserList);
	}
		public int getMngPermissionTotal() {
		int total = 0;
		total = sqlSessionTemplate.selectOne("getMngPermissionTotal");
		return total;
	}
   
	public int auctionConfirmManagerIns(Map<String, Object> pMap) {
		int result = sqlSessionTemplate.insert("auctionConfirmManagerIns", pMap);
		return result;
	}

	public int auctionConfirmSellerIns(Map<String, Object> pMap) {
		int result = sqlSessionTemplate.insert("auctionConfirmSellerIns", pMap);
		return result;
	}
	
	public int auctionConfirmUpdate(Map<String, Object> pMap) {
		int result = sqlSessionTemplate.update("auctionConfirmUpdate",pMap);
		logger.info("CONFIRM UPDATE성공");
		return result;
	}

}