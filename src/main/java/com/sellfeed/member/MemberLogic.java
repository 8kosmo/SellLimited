package com.sellfeed.member;

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

@Service
public class MemberLogic {
   Logger logger = LoggerFactory.getLogger(MemberLogic.class);
   @Autowired
   public MemberDao memberDao = null;
   @Autowired
   public AccountDao accountDao = null;
   

   public String idInspection(Map<String,Object> pMap) {
	   String inspectedId="";
	   //String u_id=p_id;
	   inspectedId = memberDao.idInspection(pMap);
	   logger.info("=================>inspectedId : "+inspectedId);
	   //logger.info("=================>u_id : "+u_id);
	   if(inspectedId.equals("-1")) {
		   logger.info("==================>아이디 사용 가능.계속진행하세요-종현-");
	   }else {
		   logger.info("==============================>아이디 사용 불가");
	   }
	   return inspectedId;
		
	}
   @Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor= {DataAccessException.class})
   @Pointcut(value="execution(* com.sellfeed.member.*Logic.*(..)")
   public int memberIns(Map<String, Object> pMap)  {
      logger.info("=================>memberIns 호출 성공");
      int result=0;
      String acct_number = "";
      //트랜잭션처리
    	  try {
    		  result = memberDao.memberIns(pMap);
    		  acct_number = accountDao.getAcct_number();
			  pMap.put("acct_number", acct_number);
			  accountDao.accountMake(pMap);
    	  } 
    	  catch (DataAccessException e) {
    		  throw e;
    	  }
    	  return result;
   }
   @Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor= {DataAccessException.class})
   @Pointcut(value="execution(* com.sellfeed.member.*Logic.*(..)")
   public List<String> login(Map<String, Object> pMap) {
      logger.info("=================>login 호출 성공");
      String mem_name="";
      String acct_balance="";
      List<String> list = new ArrayList<String>(); 
      try {
    	  mem_name = memberDao.login(pMap);
    	  logger.info(mem_name);
    	  acct_balance = accountDao.accountNowBalance(pMap);
    	  list.add(pMap.get("mem_name").toString());
    	  list.add(acct_balance);
	} catch (DataAccessException e) {
		  throw e;
	  }
      return list;
   }

   public int memberUpd(Map<String, Object> pMap) {
      logger.info("=================>memberUpd 호출 성공");
      int result = 0;
      result = memberDao.memberUpd(pMap);
      return result;
   }

   public int memberDel(Map<String, Object> pMap) {
      logger.info("=================>memberDel 호출 성공");
      int result = 0;
      result = memberDao.memberDel(pMap);
      return result;
   }

   public List<Map<String, Object>> memberList(Map<String, Object> pMap) {
      logger.info("=================>memberList 호출 성공");
      List<Map<String,Object>> rList = null;
      rList = memberDao.memberList(pMap);
      return rList;
      
   }


}