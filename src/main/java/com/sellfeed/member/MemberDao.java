package com.sellfeed.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class MemberDao {
	Logger logger = LoggerFactory.getLogger(MemberDao.class);
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	
	
	public String idInspection(Map<String,Object> pMap) {
		String inspectedId="";
		logger.info("================>idInspection 호출 성공");
		inspectedId = sqlSessionTemplate.selectOne("idInspection",pMap);
		return inspectedId;
	}
	
	public int memberIns(Map<String, Object> pMap) throws DataAccessException  {
		logger.info("================>memberIns 호출 성공");
		int result=0;
		result = sqlSessionTemplate.update("memberIns",pMap);
		return result;
	}
	
	public String login(Map<String, Object> pMap) {
		logger.info("================>login 호출 성공");
		String mem_name = null;
		mem_name = sqlSessionTemplate.selectOne("login",pMap);
		return mem_name;
	}

	public int memberUpd(Map<String, Object> pMap) {
		logger.info("================>memberUpd 호출 성공");
		int result=0;
		result = sqlSessionTemplate.update("memberUpd",pMap);
		return result;
	}

   public int memberDel(Map<String, Object> pMap) {
	    logger.info("================>memberDel 호출 성공");
	    int result=0;
	    result = sqlSessionTemplate.selectOne("memberDel",pMap);
	    return result;
	}

	public List<Map<String, Object>> memberList(Map<String, Object> pMap) {
		logger.info("================>memberList 호출 성공");
		List<Map<String,Object>> rList = null;
		rList = sqlSessionTemplate.selectList("memberList",pMap);
		return rList;
	}


}
