package com.sellfeed.account;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value="/account")
public class AccountController {
	
	Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	public AccountLogic accountLogic = null;
	
	@GetMapping(value="/accountList.sf")
	public String accountList(@RequestParam Map<String, Object> pMap) {
		logger.info("==========>accountList 호출 성공");
		List<Map<String,Object>> rList = null;
		rList=accountLogic.accountList(pMap);
		return "redirect:../index.jsp";
	}
	
	@GetMapping(value="/accountIns.sf")
	public String accountIns(@RequestParam Map<String, Object> pMap) {
		logger.info("==========>accountIns 호출 성공");
		accountLogic.accountIns(pMap);
		return "redirect:../index.jsp";
	}
	
	@GetMapping(value="/accountDel.sf")
	public String accountDel(@RequestParam Map<String, Object> pMap) {
		logger.info("==========>accountDel 호출 성공");
		accountLogic.accountHidden(pMap);
		return "redirect:../index.jsp";
	}
	
	
}
